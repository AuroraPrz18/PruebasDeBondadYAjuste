library(readxl)
x <- read.csv("C:/Users/Aurora/Desktop/New folder (2)/Simulacion/final/PruebasBondadAjuste/hiperg.csv",
              header = FALSE,
              sep = ",")     



G <- x[,1] ## Una distribucion generada (los numeros que vienen de nuestro programa), manda primera columna
tamano <- length(G)
## Generación de números pseudoaleatorios
H <-rhyper(tamano,    # Número de observaciones aleatorias a ser generadas
           7000, # the number of white balls in the urn.
           3000,     # the number of black balls in the urn.
           5000) # the number of balls drawn from the urn, hence must be in 0,1,., m+n.


d <- (1.36)/sqrt(length(G))
ks.test(G, H)    ## compara que tanto se parece

#install.packages("ggplot2")
library(ggplot2)

#Graficacion en lugar de hist(G)
qplot(G,
      geom="histogram", 
      main = "Histograma de G", 
      xlab = "X",  
      ylab = "Frecuencia", 
      fill=I("blue"), 
      col=I("black"), 
      alpha=I(.2))


#Graficacion en lugar de hist(H)
qplot(H,
      geom="histogram", 
      main = "Histograma de H", 
      xlab = "X",  
      ylab = "Frecuencia", 
      fill=I("pink"), 
      col=I("black"), 
      alpha=I(.2))


qqplot(G, H, main="Comparación de datos generados con datos hipotéticos",
       xlab="Datos hipotéticos (G)",
       ylab = "Datos generados (H)",
       col=I("blue"))



