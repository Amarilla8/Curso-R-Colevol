## Objetos S3

##  Guia elaborada con base a:

## Matloff, Norman S.The art of R programming : tour of statistical software design

## http://www.stat.umn.edu/geyer/3701/notes/generic.html

## https://adv-r.hadley.nz/s4.html


rm(list = ls())

install.packages("sloop")#Instalar paquete
library(sloop)#Cargar paquete
install.packages("rlang")
library(rlang)
# Los objetos S3 son utilizados en los paquetes base y estadísticos de R, además son los más utilizados en los paquetes CRAN.

# Cada elemento en R es un objeto. Sin embargo, existen los objetos base; los cuales provienen del lenguaje de programación S y los object-oriented (OO).

# La diferencia es que los objetos OO tienen un atributo "clase", se haya definido o no.

# Objeto base o "type base"
n <- 1:10
attr(n, "class")

otype(n)


# Objeto OO
attr(mtcars, "class")

otype(mtcars)


## Los objetos S3 no tienen una definición formal predefinida. Básicamente, una lista con su atributo "clase" establecido en algún nombre de clase, es un objeto S3. Los componentes de la lista se convierten en las variables miembro del objeto.

# Ejemplo objeto S3

ejemplo_S3 <- list()

ejemplo_S3$datos  <-  c(1,2,3)

ejemplo_S3$conteo  <-  5


str(ejemplo_S3)

typeof(ejemplo_S3)

class(ejemplo_S3)


# Establecemos la clase
class(ejemplo_S3)  <- "myClass"

class(ejemplo_S3)

otype(ejemplo_S3)


# Podemos crear el objeto y asignar la clase en un solo paso

# ejemplo_S3 <- structure(list(), class = "my_class")
?structure

# Otro ejemplo  

x <- c(1,2,3)

y <- c(1,3,8)

lmout <- lm(y ~ x)


str(lmout)

typeof(lmout)

class(lmout) #tipo base

otype(lmout) #clase


## Funciones genéricas  

# Todas las funciones genéricas tienen la misma estructura: una llamada a UseMethod que especifica el nombre genérico y el objeto para despachar. 

print
summary
plot #tiene difernte namespace, pero es un tipo de base, es un entorno de grafico base que se llama latiz (corregir nombre)
#funciones genericas tienen la misma estructura base
# Creemos una función genérica
hola <- function(x,..){
  UseMethod("hola",x)
}
hola
## Métodos

# Cuando se usa una función genérica R redirige el llamado al método de clase adecuado, es decir, usa una función específica definida para la clase de ese objeto.


# Los objetos de cada clase se imprimen con un método específico a partir de la función genérica print.

class(x)
print(x)

class(lmout)
print(lmout)
#como lmout y x son de clase diferente muestra un resultado difernete
# Revisemos todos los métodos de la función print
# Los asteriscos indican métodos no visibles.
methods(print) #diferentes metodos, no formas. �que es un m�todo?
#el metodo es la funcion especifica de como quiero usar esa funcion generica ya que los diferentes objetos pueden tener diferentes propiedades
#funcion genetica, punto, clase del objeto
# Los nombres de los métodos tienen el formato generic_name.class_name (). Así es como R es capaz de determinar qué método llamar dependiendo de la clase.


class(ejemplo_S3)


# qu� imprime ?
print(ejemplo_S3)


typeof(ejemplo_S3)


# creemos un método para print de la clase
print.myClass <- function(x){           #myclass esta en minuscula as� que la tomara como otra cosa
  cat (x$datos,"\n","estos son mis datos")
}
tienda
print(ejemplo_S3) #llamamos la funci�n generica, quien llamara a la funcion especifica
#muchos metodos estan oculs
print.lm(lmout) #no puede hallar la funci�n. las funciones genericas tienen muchos metodos ocultos, por eso usamos le metodo general. si se llaman directamente no funcionan, se tienen que hacer desde la funci�n genetica.
print.myClass(ejemplo_S3) #funcion especifica para la clase myClass
print.myclass(ejemplo_S3) #funci�n con ese nombre no corresponde con la clase del objeto, denomina a la lista datos con "estos son mis datos"
#se pueden alterar los metodos (a riesgo de error) pero las funciones base no se pueden alterar.
# Ahora usemos la función "hola" en este objeto
# ¿qué sucede ?
hola(ejemplo_S3) #error
#�que es una funci�n generica? 

#mi ejemplo de funcion
hola.myClass<-function(x){
  paste(x$datos, "hola", sep=" ")
}

# Creemos un método de la función para la clase "myClass"
hola.myClass <- function(x,..){
  cat("me amo",x[conteo], "\n") 
} #no funciona con [] ya que se deben extraer los datos como se llama una lista "$"
hola.myClass <- function(x,..){
  cat("me amo",x$conteo, "\n") 
} #ahora si funciona al llamar a conteo como se llama a una lista

# Cuál es la salida?
hola(ejemplo_S3)

hola(lmout) #no funciona porque esta definida para la clase myClass y no para lm
## Repaso de objeto S3 -

# Cada componente de la lista es una variable

j <- list(name="Joe", salary=55000, union=T)

# Definimos el atributo clase 
class(j) <- "employee"
class(j)

# Imprimamos el objeto j ¿qué estructura tiene?
print(j)

# Creemos el método "print" para la clase "employee" 
print.employee <- function(wrkr) {
  cat(wrkr$name,"\n")
  cat("salary",wrkr$salary,"\n")
  cat("union member",wrkr$union,"\n")
}

# Ahora, cualquier objeto de la clase "employee" sera impreso con el método print.employee
print(j)


## Herencia - propiedad de los objetos S3 

# Es cuando formamos nuevas clases como versiones especializadas de las antiguas 

# La nueva clase hereda los métodos de la clase antigua - cuando definimos la clase nueva, sin definirle el metodo lo imprime como el anterior, como cuando imprimia como una lista cuando ya no estabadefinido como

# Si la nueva clase no tiene métodos entonces toma los métodos la clase anterior


#creemos un objeto, paso a paso y definimos su clase "cosa"

test01  <- list()

test01$datos  <-  c(1,2,3)

test01$conteo  <-  5

test01$letras  <-  "This is ok"

class(test01)  <- "cosa"

class(test01)

str(test01)

typeof(test01)


# creamos el metodo para la clase
print.cosa <- function(x, ...){
  "1_ Si!!!!!!!!!!!!, lo logramos!!"
}

print(test01)

# la clase tambien puede ser un conjunto de caracteres
class(test01) <- c("cosa" ,"cosa1", "cosa2", "CCc")

class(test01)

# ¿ Qué debe pasar?
print(test01)

# creemos un método para la siguiente clase del conjunto
print.cosa1 <- function(x, ...){
  "2_ ni idea si lo logramos!!"
}

# ¿Qué pasa?
print(test01)

class(test01)


# y si lo creamos asi ?
print.cosa.cosa1 <- function(x, ...){
  "3_ ni idea si esta vez si lo logramos!!"
}

print(test01)


rm(print.cosa)


print(test01)


#################### actividades ############################################################################### 
# ejercicio 

# Cree un objeto de clase "Ropa" cuyos componentes sean precio y prenda

# cree  una función generica para la clase y un método que imprima la prenda y su precio

# cree un print para la clase que muestre la suma del valor de todas las prendas
