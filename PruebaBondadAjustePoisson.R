library(readxl)
x <- read.csv("C:/Users/Karyme Nava/Documents/Semestre 6/Simulación/U3/PruebasDeBondadYAjuste/poisson.csv",
              header = FALSE,
              sep = ",")     



G <- x[,1] ## Una distribucion generada (los numeros que vienen de nuestro programa), manda primera columna
tamano <- length(G)
## Generación de números pseudoaleatorios poisson
H <-rpois(tamano,
          6000)


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


