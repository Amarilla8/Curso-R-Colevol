#######################################
##### TAREA DE ENTORNOS Y REPASO    ###
#######################################

# REPASO -------------------------------------------------------------------

##############################################################################
##Ejercicio 1: Repetir el ejercicio usando un "for" sin "while" pero con la condicion
##############################################################################
c <- 0
while(c <= 10) {
  print(c)
  c <- c + 1
}
#############
##Respuesta##
#############
c<-0
for(c in 0:10) {
  print(c)
  if (c<=10)
  c <- c + 1
}

########################################################
##Ejercicio 2: Extraer los n煤meros pares del 1 al 100##
########################################################
for (i in 1:100){
  if (i%%2==0)
    print(i)
  next
}
#Extrae los valores cuando al dividir i da un n鷐ero entero.

###############################################################################
##Ejercicio 3: Modifique el siguiente c贸digo para que el loop rellene un vector con todos los resultados
###############################################################################

for (i in 1:10){
  cat("Numero", i, " ")
  }

#############
##Respuesta##
#############
a<-c()

for (i in 1:10){
  a[i]<-print(paste("N鷐ero", i, " "))
}
a

#Ejercicio 4: cargue el data "cars" y cree una nueva columna que rellene con "muy rapido" si la velocidad del modelo es mayor 15 o rellene con "muy lento" si es menor a 15
data(cars)
cars$rapidez<-ifelse(cars$speed>=15, "muy rapido", "muy lento")

#Ejercicio 5: Cree un dataframe con 1000 filas y 2 columnas, reste la primer columna a la segunda y cree una nueva columna con el resultado. Haga este ejercicio usando "for" y apply.

a<-rnorm(1000, mean=5, sd=1)
b<-rnorm(1000, mean=6, sd=3)

tabla<-data.frame(a,b)
tabla$resta<-apply(tabla,1,function(x){tabla$a-tabla$b})

##########
# ENTORNOS -------------------------------------------------------------------

# Responda las siguientes preguntas y comente las operaciones y valores de cada objeto en cada funci贸n
# ejerc 1 ---------------------------------------
rm(list=ls())
func_1 <- function(u){
  
  u <<- 2*u   # es un reasignaci贸n local o global? Global, se sabe por el "<<-". lo esta definiendo fuera del entorno de la funci髇
    return(u) 
}

u <- 1
func_1(u) # es un reasignaci贸n local o global? Reasignaci髇 global, ya no esta dentro del entorno de la funci髇, sino en el ambiente global, renortna el u global que yo ingrese, es decir el 1, no el u local que esta dentro de la funci髇. - Al llamar a la funcion redefine la u de u<-1 a u<<-2*u. 


# ejerc 2 ---------------------------------------

func_1 <- function(u){
  u <- 2*u
  func_2 <- function(uu){
    u <<- 3*uu    # es un reasignaci贸n local o global? Reasignaci髇 local dentro de un ambiente local
  }

  return(u)
  return(func_2(u))
  
}

u <- 1

func_1(u) # es un reasignaci贸n local o global? Asignaci髇


# ejerc 3 ---------------------------------------

fun_1 <- function(d, j){
  d <- 8
  j <- "esto es local y por defecto"
  paste(d,j, sep = " ")
}

v1 <- 1
v2 <- "esto es global y un argumento"

fun_1(d=v1, j=v2)      #porque ignora las variables locales? No ignoro. v1 y v2, simplemente no se llamaron asi que muestra la definicion por defecto de d y j

# ejerc 4 ---------------------------------------

fun_1 <- function(d = 8, j = "esto es local y por defecto"){
  paste(d,j, sep = " ")
}

fun_1()      #que valores muestra, explique su respuesta, muestra el mismo resultado que la anterior, ya que dice lo mismo solo que define los argumentos en la misma linea

fun_1(d = v1, j = v2)   #que valores muestra, explique su respuesta, muestra los valores de v1 y v2 ya que se le dijo que v1 era equivalente a d y v2 es equivalente a j
