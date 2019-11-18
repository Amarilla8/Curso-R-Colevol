######Resumen lunes en la mañana
#Regex

#necesitamos el paquete stringr
library(stringr)

nchar("South Pole") #"longitud de el string

paste("North","Pole",sep=".") #pega los dos string separados con un punto
paste("North","and","South","Poles") #pega los strings con el separados por defecto para paste (espacio)
paste0("North","and","South","Poles") #pega los strings con el separados por defecto para paste0 (sin separados)
cat("North","and","South","Poles") #muestra los strings con el separados por defecto para cat (espacio) y sin salto de linea al final, no lo pone como una lista
cat("North","and","South","Poles",sep="\t") #al especificar el separados con \t pone un tabulador como espaciador, no pone espaciador al final
cat("North","and","South","Poles",sep="\n") #pone un salto de pagina coomo espaciador incluso pone uno al final, porq?

i <- 8
s <- sprintf("the square of %d is %d",i,i^2) # returns a character vector containing a formatted combination of text and variable values. 
s #"the square of 8 is 64"
?sprintf 

#~ ¿qué espera que haga?
#crea el vector s que contiene texto y valores, %d es el vector que se pondra despues e la coma. en este caso "i" y "i^2"

a<-11792356
s<-sprintf("la raiz de %d es %d",a,sqrt(a))
s
