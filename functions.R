pagamento = function(n, PV, i) {
  
  ## Garantindo que todos sao numericos
  n = as.numeric(n)
  PV = as.numeric(PV)
  i = as.numeric(i)
  
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

price = function(i, n, vf) {
  
  resultado = data.frame(n = 1:n, saldo = rep(vf, n), parcela = rep(0,n),
                         juros = rep(0,n), amortization = rep(0,n))
  
  saldo = vf
  juros = i/100
  
  ## Calculo da parcela
  parcela = pagamento(n = n, i = juros, PV = vf)
  resultado$parcela = rep(parcela, n)
  
  for (i in 1:n) {
    
    
    ## Calcula o juros da primeira parcela
    resultado$juros[i] = juros*saldo
    
    ## Amortizacao
    resultado$amortization[i] = resultado$parcela[i] - resultado$juros[i]
    
    ## Saldo devedor
    saldo = saldo - resultado$amortization[i]
    resultado$saldo[i] = saldo
  }
  
  ## Total de juros
  juros = round(sum(resultado$juros), 2)
  juros = formata(juros)
  
  ## Arredondando os valores
  resultado[,-1] = sapply(resultado[,-1], formata)
  row.names(resultado) <- NULL
  
  ## Change colnames to english version
  colnames(resultado)  = c('n', 'loan balance','installment', 'interest', 'amortization')
  
  ## Retorna a tabela PRICE
  return(list(resultado = resultado, juros = juros))
}

sac = function(i, n, vf) {
  
  resultado = data.frame(n = 1:n, saldo = rep(vf, n), parcela = rep(0,n),
                         juros = rep(0,n), amortization = rep(0,n))
  
  saldo = vf
  juros = i/100
  
  ## Calculo da parcela
  amortization = saldo/as.numeric(n)
  resultado$amortization = rep(amortization, n)
  
  for (i in 1:n) {
    
    
    ## Calcula o juros da primeira parcela
    resultado$juros[i] = juros*saldo
    
    ## Amortizacao
    resultado$parcela[i] = resultado$amortization[i] + resultado$juros[i]
    
    ## Saldo devedor
    saldo = saldo - resultado$amortization[i]
    resultado$saldo[i] = saldo
  }
  
  ## Total de juros
  juros = round(sum(resultado$juros), 2)
  juros = formata(juros)
  
  ## Arredondando os valores
  resultado[,-1] = sapply(resultado[,-1], formata)
  row.names(resultado) <- NULL
  
  ## Change colnames to english version
  colnames(resultado)  = c('n', 'loan balance','installment', 'interest', 'amortization')
  
  ## Retorna a tabela SAC
  return(list(resultado = resultado, juros = juros))
  
}
