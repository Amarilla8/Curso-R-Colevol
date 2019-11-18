#######################################
#####     TAREA DE S3, S4 y R6      ###
#######################################

##########
# S3 -------------------------------------------------------------------

rm(list = ls())

install.packages("sloop")#Instalar paquete
library(sloop)#Cargar paquete
install.packages("rlang")
library(rlang)

# ejercicio 1.1 Cree un objeto de clase "Ropa" cuyos componentes sean precio y prenda.
tienda<-list(tallas=c("XS","S","M","L","XL"),
             disponibles=c("camisas","pantallones","faldas","medias"),
             precios=c(50,80,100,120,150))
otype(tienda)
class(tienda)

ropa<-list(precio="Tenemos gran variedad de precios",
           prenda="¿Qué prenda busca?")

class(tienda)<-"ropa"
class(tienda)
otype(tienda)

ropa$precio
ropa$prenda

tienda$tallas
tienda$disponibles
tienda$precios

# ejercicio 1.2 cree una funciÃ³n generica para la clase "Ropa" y un mÃ©todo que imprima la prenda y su precio.
print.ropa <- function(tienda){ 
  cat (ropa$prenda,"Tenemos", tienda$disponibles, "en las siguientes tallas", tienda$tallas, "\n")
  cat(ropa$precio, tienda$precios)
}
print(tienda)

# ejercicio 1.3 cree un print para la clase "Ropa" que muestre la suma del valor de todas las prendas.
print.ropa.valor<-function(tienda){
  cat(sum(tienda$precios))
}
print.ropa.valor(tienda)

##############################
rm(list = ls())

library(sloop)
library(rlang)
################################

# ejercicio 2.1 Cree un objeto de clase "Baraja" cuyos componentes sean nÃºmero y simbolo. SegÃºn la baraja espaÃ±ola de 40 cartas https://es.wikipedia.org/wiki/Baraja_espa%C3%B1ola#/media/Archivo:Baraja_de_40_cartas.png
cartas<-c(paste("oro",c(1:7,10:12)),paste("espadas",c(1:7,10:12)),paste("bastos",c(1:7,10:12)),paste("copas",c(1:7,10:12)))

#cartas<-list(oro=c(paste("oro",c(1:7,10:12))),
 #          espadas=c(paste("espadas",c(1:7,10:12))),
 #          bastos=c(paste("bastos",c(1:7,10:12))),
 #          copas=c(paste("copas",c(1:7,10:12))))
cartas

otype(cartas)
class(cartas)

baraja<-list(numero="Este es el valor de cada carta",
           simbolo=c("oro","espadas","bastos","copas"))

class(cartas)<-"baraja"
class(cartas)
otype(cartas)

baraja$numero
baraja$simbolo

# ejercicio 2.2 Cree un print que para la clase "Baraja" donde se muestre una descripciÃ³n breve del objeto y 3 reglas de juego de cualquier variante de la baraja espaÃ±ola, puede guiarse de http://www.juntadeandalucia.es/averroes/centros-tic/18700441/myscrapbook/bookcontents.php?page=8&section=7&viewis=&username=

print.baraja<-function(cartas){
  cat("La baraja española consta de", length(cartas), "cartas y con ella se puede jugar a La Escoba:","\n")
  cat("Para jugarlo se necesitan mínimo dos personas y una baraja española.","\n")
  cat("Cada jugador debe completar 15 puntos sumando los valores en cada carta, los cuales son:", 1:7,10:12, "con la excepción que las últimas tres cartas, 10, 11 y 12, tienen valores 8, 9 y 10, respectivamente.","\n")
  cat("No se tiene en cuenta los diferentes palos:", baraja$simbolo,".")
}
print(cartas)

# ejercicio 2.3 cree una funciÃ³n generica para la clase "Baraja" que sirva de manera al azar (uniforme sin reemplazo) 9 cartas y se las asigne a un objeto jugador.

nueve<-function(cartas){
  paula<<-sample(cartas,size=9,replace = F)
  cat("Cartas Paula:",paula,sep=" ","\n")
  lukas<<-sample(cartas,size=9,replace = F)
  cat("Cartas Lukas:",lukas,sep=" ")
}
nueve(cartas)

##############################
rm(list = ls())

library(sloop)
library(rlang)
################################
# ejercicio 3. Dado lo siguiente, explique y argumente (con evidencia resultante de diferentes comandos) por quÃ© modificar el objeto "bubba" afecta a "louise" y viceversa? Recuerde comentar el cÃ³digo que use como argumento.

NordAmericain <- function(eatsBreakfast = TRUE, myFavorite = "cereal") {
  thisEnv <- environment()
  hasBreakfast <- eatsBreakfast
  favoriteBreakfast <- myFavorite
  me <- list(
    thisEnv = thisEnv,
    getEnv = function() {
      return(get("thisEnv", thisEnv))
    }
  )
  assign('this', me, envir = thisEnv)
  class(me) <- append(class(me), "NordAmericain")
  return(me)
}


bubba <- NordAmericain()
bubba
bubba <- NordAmericain(myFavorite="oatmeal")
bubba
get("favoriteBreakfast", bubba$getEnv()) #desayuno favorito oatmeal

louise <- bubba
assign("favoriteBreakfast", "toast", louise$getEnv())
get("favoriteBreakfast", louise$getEnv()) #desayuno favorito toast
get("favoriteBreakfast", bubba$getEnv()) #desatuno favorito toast
bubba$thisEnv 
louise$thisEnv #mismo ambiente que bubba$thisEnv
###########################
#Al modificar luise se modifica bubba y viceversa debido a que tienen el mismo ambiente, es decir el de la función NordAmericain(), por lo que se modifica la función y esta modifica a louise y a bubba. Al crear otra funcion, NordAmerican(), con otro ambiente diferente la cual se le asigna a louise ya no ocurre esto.
NordAmericain <- function(eatsBreakfast = TRUE, myFavorite = "cereal") {
  thisEnv <- environment()
  hasBreakfast <- eatsBreakfast
  favoriteBreakfast <- myFavorite
  me <- list(
    thisEnv = thisEnv,
    getEnv = function() {
      return(get("thisEnv", thisEnv))
    }
  )
  assign('this', me, envir = thisEnv)
  class(me) <- append(class(me), "NordAmericain")
  return(me)
} #repetimos la funcion

bubba<-NordAmericain()
bubba
get("favoriteBreakfast", bubba$getEnv()) #para que el desayuno favorito sea nuevamente ceral


NordAmerican <- function(eatsBreakfast = TRUE, myFavorite = "cereal") {
  thisEnv <- environment()
  hasBreakfast <- eatsBreakfast
  favoriteBreakfast <- myFavorite
  me <- list(
    thisEnv = thisEnv,
    getEnv = function() {
      return(get("thisEnv", thisEnv))
    }
  )
  assign('this', me, envir = thisEnv)
  class(me) <- append(class(me), "NordAmericain")
  return(me)
} #creamos la funcion para louise

louise <- NordAmerican()
louise
louise$thisEnv #<environment: 0x0000019eda3bdfc0> un ambiente diferente de bubba
assign("favoriteBreakfast", "toast", louise$getEnv()) #se le asigna toast como desayuno favorito
get("favoriteBreakfast", louise$getEnv())
get("favoriteBreakfast", bubba$getEnv())
#ya no se modifican entre ellos porque ya no comparten el mismo ambiente
##########
# S4 ------------------------------------------------------------------- 
rm(list = ls())
library(sloop)
#Cargar paquetes
install.packages("maptools")
library(maptools)
install.packages("rgeos")
library(rgeos)
#install.packages("nnclust") #no diponibles, fue removido de CRAN
library(nnclust) #intalado desde archivo directamente
install.packages("shapefiles")
library(shapefiles)


# Ejercicios 1. Â¿Que hace el objeto graph_mst? comente cada componente de la funciÃ³n
###############################################################
graph_mst <- function () {
  distrib<-l@lines[[1]]@Lines[1][[1]]@coords #deine las coordenadas de los puntos a graficar
  mst<-mst(l@lines[[1]]@Lines[1][[1]]@coords) #mst = minimum spanning trees o arbol recubridor minimo: determina el minimo de lineas necesarias para unir todos los puntos en un plot con las menores distancias
  plot(l, col="white");title("MST") #grafica los puntos de l, de color blanco con el titulo MST
  segments(distrib[mst$from,1], distrib[mst$from,2], distrib[mst$to,1],distrib[mst$to,2],col="red") #añade las lineas segmentos al grafica definidas en mst con la función mst y las colorea de rojo.
}

class(graph_mst) #function
otype(graph_mst) #objeto base

#en resumen, graph_mst() es una función base, diseñada para objetos s4 para graficar un diagrama de puntos y unirlos con las menores distancias posibles.
#############################################################################

# Ejercicios 2. Crear un objeto s4 en donde incluya 30 letras y 30 observaciones aleatorias de una distribucion normal. 

setClass("ejer2",
         representation(letras="character",
                        observaciones="numeric"))

getClass("ejer2")
getSlots("ejer2")
slotNames("ejer2")

Ejer2<-new("ejer2",letras=sample(letters,size=30,replace=T),observaciones=rnorm(30, 10,1)) #se crea el objeto Ejer2 con 30 letras aleatorias y 30 numeros aleatorios con una distrbución normal

Ejer2 #objeto clase ejer con dos slots
class(Ejer2) #clase ejer2 
typeof(Ejer2) #tipo s4
str(Ejer2)  

Ejer2@letras
summary(Ejer2@letras)
Ejer2@observaciones
summary(Ejer2@observaciones)

# Ejercicios 3. Usando setGeneric() y setMethod(), escribir dos funciones para extraer los datos del objeto creado en el punto 2 y graficarlos.

setGeneric("ejercicio",
           function(x,...) {
             standardGeneric("ejercicio");
           }); #creamos la función generica

setMethod("ejercicio",
          definition = function(x){
            x<<-x@letras
            y<<-x@observaciones
            }) #definimos la función que extrae los valores de cada slot para realizar la grafica
ejercicio(Ejer2) #ejecutamos la función y se crean los ejes de la gráfica
plot(as.factor(x), y, lty=5, col=1:25,xlab="Letras",ylab="Observaciones",main="Ejercicio 3") #realizamos la grafica


################################################################################
# Ejercicios 4. Sin ejecutar que pasa en cada una de laa asignaciones y Â¿por quÃ©? comente errores de cÃ³digo y la correciÃ³n que le realizÃ³

rm(list=ls())


setClass("angelito",
         representation(nombre="character",
                        apellido="character",
                        peso=altura="numeric") #no se pueden igualar así solo porque ambos son numericos
)
#nuevamente sin el error anterior
setClass("angelito",
         representation(nombre="character",
                        apellido="character",
                        peso="numeric",
                        altura="numeric") 
) #ya no sale error


setClass("angelito",
         representation(nombre="character",
                        apellido="character",
                        peso  <- "numeric",
                        altura="numeric")
) #no hay error, R no ve la diferencia entre = y <-. Sin embargo al usar <- se define peso como un objeto y no como un slot



setClass("angelito",
         representation(nombre="character",
                        apellido="character",
                        peso="numeric",
                        altura="numeric")
) #no hay nada raro

yo  <- new("angelito",
           nombre  <- "Daniel",
           apellido  <- "Miranda"
           ) #aquí si ya no se puede usar <-, porque no se está definiendo ningún valor, se debe usar el =


yo  <- new("angelito",
           nombre  = "Daniel",
           apellido  = "Miranda") #ahora si está bien definido, sin la información del peso y la altura

yo #definido, sin la información del peso o la altura

setClass("estudiante",
         representation(
           identidad="angelito", #hereda las caracteristicas de angelito, nombre, apellido, peso y altura
           semestre="numeric",
           grado="logical")
) #no hay nada raro


yoReal  <- new("estudiante")
yoReal #tiene un slot llamado identidad que contiene los slot de la clase angelito

yoReal$angelito #$ no se usa para s4
yoReal@estudiante #ningun slot se llama estudiante

yo@nombre #nombre daniel
yoReal@identidad@nombre #nombre de yoReal el cual aún no está definido character(0)
yoReal@identidad <- yo #se definen los slot de clase angelito con yo que es un objeto de clase angelito

yoReal #ahora tiene el nombre y el apellido definidos en yo

yo@nombre #yo no tiene porque modificarse, y no se modifica

yoReal@nombre #yo se puede llamar así el nombre de yoReal, porque nombre no es un slot de la clase estudiante, sino que esta dentro del slot identidad y es de clase angelito

yoReal@identidad@nombre #manera correcta de llamar el nombre de yoReal

ls()

#########################################################################
# R6 -------------------------------------------------------------------#
#########################################################################
rm(list=ls())
install.packages("R6")
library(R6)
library(sloop)
# Ejercicio 1. Cree una clase de cuenta bancaria R6 que almacene un saldo y le permita depositar y retirar dinero. Cree una subclase que arroje un error si intenta entrar en sobregiro. Cree otra subclase que le permita entrar en sobregiro, pero le cobra una tarifa.
banco<-R6Class("cuenta",list(
  saldo=100,
  transaccion=function(x){self$saldo<-self$saldo+x},
  sobregiro=if (saldo>0){
    print("Transacción aprobada")
    print("SOBREGIRO")
    }
  ))
cuentaPaula<-banco$new() #Paula crea una cuenta
cuentaPaula
cuentaPaula$transaccion(500) #Paula deposita $500
cuentaPaula #saldo actual $600
cuentaPaula$transaccion(-50) #Paula retira $50
cuentaPaula #saldo actual $550
##corregir
typeof(banco)
str(banco)

# Ejercicio 2. Cree una clase (parquedero) R6 que almacene diferentes vehiculos y le permita  diferencar motocicletas y automoviles. Cree una subclase para diferenciar el cobro por tipo de vehiculo y otra por la cantidad de tiempo. Adicione otra clase "dia" y finalemente presente los ingresos mensueales.

