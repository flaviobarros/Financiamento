pagamento = function(n, PV, i) {
  
  ## C�lculo da parcela no sistema PRICE
  parcela = PV*((1+i)^n * i)/((1+i)^n - 1)
  
  return(parcela)
}

formata = function(coluna) {
  
  ## Coloca v�rgula
  coluna = format(x = round(coluna,2), nsmall = 2, 
                  decimal.mark = ',', big.mark = '.')
  
  ## Coloca R$
  coluna = paste("R$", coluna, sep='')
  return(coluna)
}