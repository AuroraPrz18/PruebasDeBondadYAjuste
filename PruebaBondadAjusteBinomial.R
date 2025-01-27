library(readxl)
x <- read.csv("C:/Users/Aurora/Desktop/New folder (2)/Simulacion/final/PruebasBondadAjuste/binomial.csv",
              header = FALSE,
              sep = ",")     



G <- x[,1] ## Una distribucion generada (los numeros que vienen de nuestro programa), manda primera columna
tamano <- length(G)
## Generaci�n de n�meros pseudoaleatorios binomiales
H <-rbinom(tamano,    # N�mero de observaciones aleatorias a ser generadas
       4200, # N�mero de ensayos (> = 0)
       0.5) # La probabilidad de �xito en cada ensayo


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


qqplot(G, H, main="Comparaci�n de datos generados con datos hipot�ticos",
       xlab="Datos hipot�ticos (G)",
       ylab = "Datos generados (H)",
       col=I("blue"))


