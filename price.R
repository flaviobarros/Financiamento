juros = 1.43/100
vf = 30000.00
n = 36

## Saldo devedor
saldo = vf

pagamento = function(n, PV, i) {
  
  ## Cálculo da parcela no sistema PRICE
  parcela = PV*((1+i)^n * i)/((1+i)^n - 1)

  return(parcela)
}

formata = function(coluna) {
  
  ## Coloca vírgula
  coluna = format(x = round(coluna,2), nsmall = 2, 
         decimal.mark = ',', big.mark = '.')
  
  ## Coloca R$
  coluna = paste("R$", coluna, sep='')
  return(coluna)
}

resultado = data.frame(n = 1:36, saldo = rep(vf, n), parcela = rep(0,n),
                       juros = rep(0,n), amortização = rep(0,n))

for (i in 1:(n)) {

  
  ## Calcula o juros da primeira parcela
  resultado$juros[i] = juros*saldo
  
  ## Cálculo da parcela
  resultado$parcela[i] = pagamento(n = n, i = juros, PV = vf)
  
  ## Amortização
  resultado$amortização[i] = resultado$parcela[i] - resultado$juros[i]
  
  ## Saldo devedor
  saldo = saldo - resultado$amortização[i]
  resultado$saldo[i] = saldo
}

## Arredondando os valores
resultado[,-1] = sapply(resultado[,-1], formata)