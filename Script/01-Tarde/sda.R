########### R - Environments ###########
###### Andres Felipe Ordoñez Casadiego
###### Curso de programación intermedio-avanzado en R
###### Laboratorio de Sistemática y Biogeografía
###### Universidad Industrial de Santander
###### 2019 octubre

# El entorno o ambiente es el atributo de los objetos que nos indica el "lugar o
#espacio" en el que están.
# Por lo que un entorno es una colección de objetos, cuando inicias una sesión de R o Rstudio estas
#iniciando un entorno y cada objeto creado pertenecerá a ese entorno.

# En el uso "cotidiano" el concepto de entornos no es esencial, pero si vas a hacer uso de objetos R6 y
#paquetes dinamicos como ggplot2, debes entender lo básico como que todos los ambientes tienen "padres", #variables globales y variables locales.

environment() ## Comando para mostrar el ambiente, si es vacio será "R_GlobalEnv"

x <- 0.001 ## Creamos un objeto
x

x <- "esto es x" ## Creamos un objeto
x

# Los objetos dentro de un mismo entorno deben tener nombre unicos, sino se hará reasignación de valores

ls() ## Listar los objetos en el "R_GlobalEnv"



#######################
###### Funciones ######
#######################

#Una función es un objeto que puede realizar acciones, estas pueden requerir otros objetos y retornarlos.
#Las funciones generan su propio ambiente, donde los objetos creados y usados son almacenados.

obj_1 <- 1 ## objeto númerico
obj_2 <- "a" ## objeto caracter

c <- function() { ##hacer una función
x <- 0 ## crear el objeto x que es númerico
}

ls() ## Listar los objetos en el "R_GlobalEnv"

c() ## ¿Cuál es el output?
#dos x diferentes, uno funciona en el global y el otro en el de c
ls() ## ¿Por qué la x asignada en c no se muestra en la lista?


  
str(c) ## ¿Cuál es el entorno del objeto?

#sistema hexadecimal, sencillo de manejar, no se llena facil 

################################
###### Variables globales ######
################################

# Los objetos globales son los que se encuentran en el ambiente más general.

# La globalidad es una atributo de la perspectiva de los ambientes, siendo los objetos del ambiente
#parental son globales.

# Veamos esta globalidad:

global_ambiente <- 10 # objeto creado en el Global

fun_1 <- function() { # segundo entorno
  amb_1 <- global_ambiente + 1
  fun_2 <- function(){ # tercer entorno
    amb_2 <- amb_1 + 1
    print(ls()) # Lista los objetos en el entorno de trabajo
    print(amb_2)
    print(environment())
    }
  print(ls()) # Lista los objetos en el entorno de trabajo
  print(amb_1)
  print(environment())
  fun_2()
  }

fun_1() # el primer entorno corresponde a la fun_1 que tiene dos objetos
# el segundo entorno corresponde a la fun_2 que tiene un objeto
# Las variables locales pueden ser usadas en entornos descendendientes pero las perentales no pueden usar las de sus descendientes

################################
###### Variables locales #######
################################

# Objetos que solo existen en un entorno especifico y son invisibles para los otros entornos.

a <- 20 # Objeto global

fun_1 <- function(){
  a <- 10 # Objeto local
  print(a)
  fun_2 <- function(){
  a <- "hello" # Objeto local
  return(a)
  }
  fun_2()
 }

fun_1() # Ejecutar la función

a # El valor de "a" es dado por el objeto global no por los locales

################################
###### Retornar valores ########
################################

# <<- nos permite retornar el valor de una variables a su ambiente parental.
# puede redifinir y escribir objetos.


a <- 20 # Objeto global

fun_1 <- function(){
  a <<- 10 # Objeto local reasignando al objeto "a" - al poner la flecha doble se modifica la "a" del entorno global
  print(a)
  
  fun_2 <- function(){
    a <<- "hello" # Objeto local reasignando al objeto "a"
    return(a)
    } 
  fun_2()
  }

fun_1() # Ejecutar la función
#doble flecha sirve para modificar las variables globales desde un ambiente local
a # El valor de "a" es dado por el objeto retornado

##################################
###### Ejercicio en clase ########
##################################

f<-function(y,fun) {
  d <- 8
  print(environment(fun))
  return(fun(d,y))
  }

h <- function(dee,yyy){
  return(dee*(w+yyy))}

d <- 12
## Antes de ejecutar: ¿cuál será el env?

f(3,h)


