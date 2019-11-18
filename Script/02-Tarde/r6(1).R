
#~ #~  it uses the encapsulated OOP paradigm, which means that methods
#~ #~  belong to objects, not generics, and you call them like
#~ #~  object$method().


#~ #~  R6 objects are mutable, which means that they are modified in
#~ #~  place, and hence have reference semantics.
rm(list=ls())
install.packages("R6")

library(R6)

#~ Clases y métodos
#~ Los dos argumentos más importantes para R6Class(): 

#~  1) classname: no es estrictamente necesario, pero mejora los mensajes de error y permite utilizar objetos R6 con genéricos S3. Por convención, las clases R6 tienen UpperCamelCasenombres.

#~  2)  public: proporciona una lista de métodos (funciones) y campos (cualquier otra cosa) que componen la interfaz pública del objeto. Los métodos pueden acceder a los métodos y campos del objeto actual a través de self$.
#S4 -> clase -> objeto -> metodo
#R6 -> se hace ahi mismo

Accumulator <- R6Class("Accumulator", list( #se crea el objeto con la clase
  sum = 4,
  add = function(x = 1) {
    self$sum <- self$sum + x #estos son los elementos que se pueden definir como publicos o privados, pueden ser listar de metodos o funciones
    invisible(self) #encadenar varias llamadas
  })
)



x<-Accumulator$new()

x
x$add(10)
x
x$add(10)$add(10)
x
x$add(10)$add(10)$add(

#el valor del objeto va cambiando por el metodo que lo modifica

#~ construir un nuevo objeto de la clase mediante new(). En R6, los métodos pertenecen a los objetos, por lo que se utiliza $para acceder a new():


x <- Accumulator$new()  #define un objeto distinto dentro de la clase, x es el nombre del nuevo objeto

x
typeof(Accumulator)
str(Accumulator)

ls()
#~ #~  mediante $ se accede a los campos.
#como es R6 puede contener metodos y campos

x$add(4) #metodo
x$sum #campo


#~ en esta clase, los campos y métodos son públicos, lo que significa que puede obtener o establecer el valor de cualquier campo. 

#~  "Método de encadenamiento"

#~ $add()se llama principalmente por su efecto secundario de la actualización $sum

Accumulator <- R6Class("Accumulator", list(
  sum = 0,
  add = function(x = 1) {
    self$sum <- self$sum + x 
    invisible(self)
  })
)



#~ Los métodos de efectos secundarios R6 siempre deben volver self invisiblemente. Esto devuelve el objeto "actual" y permite encadenar varias llamadas a métodos:


x


x$add(10)

x

x$add(10)$add(10)

x
x$add(10)$add(10)$sum

x

#~ #~ #~  Hay dos métodos importantes que deben definirse para la mayoría de las clases: $initialize()y $print()

#~  $initialize() anula el comportamiento predeterminado de $new()

Person <- R6Class("Person", list(
  name = NULL,
  age = NA,
  initialize = function(name, age = NA) {
    stopifnot(is.character(name), length(name) == 1)
    stopifnot(is.numeric(age), length(age) == 1)
    
    self$name <- name
    self$age <- age
  }
))
?stopifnot
#que ocurre?
hadley <- Person$new("Hadley", age = "thirty-eight") #
#~ > Error in .subset2(public_bind_env, "initialize")(...): is.numeric(age) is
#~ > not TRUE

hadley <- Person$new("Hadley", age = 38)

?invisible



#~ #~  $print() permite anular el comportamiento de impresión predeterminado.  $print()debería regresar invisible(self).

Person <- R6Class("Person", list(
  name = NULL,
  age = NA,
  initialize = function(name, age = NA) {
    self$name <- name
    self$age <- age
  },
  print = function(...) {
    cat("Person: \n")
    cat("  Name: ", self$name, "\n", sep = "")
    cat("  Age:  ", self$age, "\n", sep = "")
    invisible(self)
  }
))

hadley2 <- Person$new("Hadley")
hadley2
hadley2$print #es un metodo definido arriba
hadley2$print() #es la funcion print
print(hadley2)

#~ Agregar métodos después de la creación
#~ En lugar de crear continuamente nuevas clases, también es posible modificar los campos y métodos de una clase existente. Esto es útil cuando explora interactivamente o cuando tiene una clase con muchas funciones que le gustaría dividir en pedazos. 


Accumulator <- R6Class("Accumulator")

Accumulator$set("public", "sum", 0)
Accumulator$set("public", "add", function(x = 1) {
  self$sum <- self$sum + x 
  invisible(self)
})


#~ #~  herencia

#~ Para heredar el comportamiento de una clase existente, proporcione el objeto de clase al argumento inherit 



AccumulatorChatty <- R6Class("AccumulatorChatty", 
  inherit = Accumulator,   #hereda en comportamiento de Accumulator
  public = list(   #
    add = function(x = 1) {
      cat("Adding ", x, "\n", sep = "")
      super$add(x = x) #self$ es un metodo publico, super$ metodo publico del padre
    }
  ))
x2 <- AccumulatorChatty$new()
x2
x2$add(10)
x2
x2$add(10)$add(1)$sum
x2$sum #de donde sale?

#es lo mismo preguntar la clase y los nombres
class(x2)
names(x2)

#S4 la sintaxis para escribir los objeto sorientados a programacion cambia. en s4 los simbolos y argumentos que voy asignando cambian y cambian en orden. tambien lo que tuliso. clase-> objeto-> metodo, un metodo puede ser ...
#R6 la sistaxis tambien cambia, no hay slots sino nuevamente el simbolo $, tambien hay una lista de argumentos, primero la clase RClass, necesitamos el paquete para poder escribir estos objetos r6 y a diferencia e s4, ac� se puede hacer los tres pasos al tiempo. se puede heredar metodos de otras clases en donde estas enpecificados otras clases de argumentos y para llamarlos no se usa self, sino super.

#~ Cada objeto R6 tiene una clase S3 que refleja su jerarquía de clases R6. Esto significa que la forma más fácil de determinar la clase (y todas las clases de las que hereda) es usar class():

hadley
class(hadley)

names(hadley)

hadley2
class(hadley2)

names(hadley2)


#~ ejercicios

#1
#Defina a fabrica(factory) para microondas(a microwave oven).
#llame una clase R6Class.
#El nombre de la clase debe ser "MicrowaveOven".
#Determine un elemento que se llame private y que sea una list (asi como puede tener elementos publicos, se pueden tener elementos privados )
#Esta listdebe contener un unico campo, que se llame  power_rating_watts y que tenga un valor de  800.

# Defina microwave_oven_factory
microwave_oven_factory <- ___(
  "___",
  ___ = ___(
    ___ = ___
  )
)

?"<-"
  
# Ver su  microwave_oven_factory

# Crear un nuevo objeto MicrowaveOven  y asignelo a la variable microwave_oven

#microwave_oven <- 
  
  

#~ Tarea

#~ 1)Cree una clase de cuenta bancaria R6 que almacene un saldo y le permita depositar y retirar dinero. Cree una subclase que arroje un error si intenta entrar en sobregiro. Cree otra subclase que le permita entrar en sobregiro, pero le cobra una tarifa.

#~ 2) Cree una clase (parquedero) R6 que almacene diferentes vehiculos y le permita  diferencar motocicletas y automoviles. Cree una subclase para diferenciar el cobro por tipo de vehiculo y otra por la cantidad de tiempo. Adicione otra clase "dia" y finalemente presente los ingresos mensueales.



