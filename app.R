library(shiny)
source('functions.R')

tabPanelAbout <- source("about.R")$value
mos <- c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")
headerPanel_2 <- function(title, h, windowTitle=title) {    
  tagList(
    tags$head(tags$title(windowTitle)),
    h(title)
  )
}

ui <- navbarPage("Financing",
                 
  ## Primeiro tab
  tabPanel(title = 'TABLES', id = 'price',
  
  ## Define o layout
  fluidRow(
    column(width = 12, 
           fluidRow(
             column(width = 4,
                    
                    ## Entra com valor financiado
                    numericInput(inputId = 'PV', 
                                 label = 'Value:', 
                                 value = 100000, min = 0)),
             
             column(width = 4, 
                    ## Entra com a taxa de juros
                    sliderInput(inputId = 'juros', 
                                label = 'Interest:', 
                                value = 1.5, min = 0, max = 3, step = 0.01)),
             column(width = 4, 
                    ## Entra com o numero de parcelas
                    selectInput(inputId = 'n', choices = 1:72, selected = 12,
                                label = 'Installments:'))
           ))),
    
            ## Tabela de saida
            column(width = 12, offset = 3,
                   
                    ## Action buttons para sistemas de amortiza
                    actionButton(inputId = 'price', label = 'PRICE'),
                    actionButton(inputId = 'sac', label = 'SAC')),
            column(width = 12, offset = 3, tableOutput('resultado')),
            column(width = 12, offset = 3, textOutput('totalJuros'))
            
  ),
  tabPanel(title = 'About & Instructions', tabPanelAbout())
)


server <- function(input, output) {
   
   ## Cria valor reativo
   rv <- reactiveValues(
     data = price(i = 1.5, vf = 100000, n = 12)[[1]],
     juros = price(i = 1.5, vf = 100000, n = 12)[[2]]
    
   )
   
   ## De acordo com evento muda o calculo
   observeEvent(input$price, {
     
     ## Recalcula o financiamento
     rv$data = price(i = input$juros, vf = input$PV, n = input$n)[[1]]
     
     ## Obtem novo texto
     rv$juros = price(i = input$juros, vf = input$PV, n = input$n)[[2]]
     
     })
   
     
   observeEvent(input$sac, {
     
     ## Recalcula o financiamento
     rv$data = sac(i = input$juros, vf = input$PV, n = input$n)[[1]]
     
     ## Obtem novo texto
     rv$juros = sac(i = input$juros, vf = input$PV, n = input$n)[[2]]
     
     })
   
   output$resultado = renderTable(
     
     expr = rv$data
   )
   
   output$totalJuros = renderText({paste0('Total interest: ', rv$juros)})
     
}

shinyApp(ui = ui, server = server)