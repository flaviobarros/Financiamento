
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

## Functions
pagamento = function(n, PV, i) {
  
  ## Calculo da parcela no sistema PRICE
  parcela = PV*((1+i)^n * i)/((1+i)^n - 1)
  
  return(parcela)
}

formata = function(coluna) {
  
  ## Coloca virgula
  coluna = format(x = round(coluna,2), nsmall = 2, 
                  decimal.mark = ',', big.mark = '.')
  
  ## Coloca R$
  coluna = paste("R$", coluna, sep='')
  return(coluna)
}

shinyServer(function(input, output) {

  # Campo VP
  output$choose_VP <- render({
    
    numericInput(inputId = 'PV', 
                label = 'Valor financiado', 
                value = 100000, min = 100, max = 30000, step = 100)
    
  })
  
  # Campo juros
  output$choose_i <- renderUI({
    
    sliderInput(inputId = 'juros', 
                label = 'Juros', 
                value = 1.5, min = 0, max = 3, step = 0.01)
  })
  
  # Campo n
  output$choose_n <- renderUI({
    
    selectInput(inputId = 'n', choices = 1:72, 
                label = '# Parcelas:')
  })
  
  # Output the data
  output$data_table <- renderTable({
    
    
    
    print('chegou aqui')
    ## Saldo devedor
    saldo = input$choose_VP
    n_parcelas = input$choose_n
    juros = input$choose_i
    
    print(n_parcelas)
    print(input$choose_n)
    
    resultado = data.frame(n = 1:n_parcelas, saldo = rep(saldo, n_parcelas), parcela = rep(0,n_parcelas),
                           juros = rep(0,n_parcelas), amortiza = rep(0,n_parcelas))
    
    for (i in 1:(n_parcelas)) {
      
      
      ## Calcula o juros da primeira parcela
      resultado$juros[i] = juros*saldo
      
      ## Calculo da parcela
      resultado$parcela[i] = pagamento(n = n, i = juros, PV = vf)
      
      ## Amortizacao
      resultado$amortiza[i] = resultado$parcela[i] - resultado$juros[i]
      
      ## Saldo devedor
      saldo = saldo - resultado$amortiza[i]
      resultado$saldo[i] = saldo
    }
    
    ## Arredondando os valores
    resultado[,-1] = sapply(resultado[,-1], formata)
    head(resultado)
  })

})
