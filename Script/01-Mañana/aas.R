##PRIMERA SESIÓN
#Manuel Calsada


## If Else


c<-(2)

if(c<=3){
  print ("Mayor/igual a dos")
} else {
  print("Menor/igual a dos")
}

# "else if" permite usar más de dos condiciones en una instruccion

c<-(6)

if (c<=2) {
  print("Valor numérico menor/igual a dos")
} else if (2<c & c<=5){               #if else para condicion intermedia
  print("Valor numérico entre 3 y 5")
} else if (5<c & c<8) {  #if else para condición intermedia
  print ("Valor numérico entre 6 y 7")
} else {                       #se finaliza con else
  print ("mayor/igual a 8")
}

###############################################################################
#2. for/while
#la instrucción for genera un bucle que repite una serie de operaciones en un 
#numero determinado de iteraciones
#while necesita que una condicion se cumpla

#sintxis
#for (elemento in objeto) {
#operacion
#}


a<-c(paste(for (i in 1:10) {
  print(cat("Número", i, " ")  #Qué hace? ##TAREA: como lo guardo en un vecto?
  }))

?cat
?print
?paste
?vector

#otro ejemplo

a<-1
b<-2

for (i in 1:5) {
  print(a+b+i)
}

#while funciona de manera similar a for pero en este caso el numero de iteraciones esta determinado segun una condciones, es decir, mientras una condicion se cumple el bucle seguira

#sintaxis
#while(condicion) {
#operacion
#}

c=0

while(c<=10) {
  print(c)
  c<-c+1
  }

#Ejercicio: Repetir el ejecicio anterior usando un "for"

######################################################################
#3. Repeat/break/next
#"repeat" repite una operacion hasta que el usurario lo inique, suele combinarse con otros comandos como "breal"
#break como s nombre lo indica se usa para detener bucles

a<-0

repeat{
  a<-a+1
  print(a)
  if(a>=10)
    break
}

#next es usado para saltarse ciertos valores del bucle

for (i in 1:100) {
  if (i==10)
    next
  print(i)
}

#Ejercicio: extraer los números pares del 1 al 100 TAREA

#%.Funciones
#una funcion implica un grupo de instruciones que reciben unos datos de entrada 
#emplea estos datos para obtener otros valores y retorna el resultado

#sintaxis
#myfunction <-function(arg1,arg2...){
#statemens
#return(object)
#}

Celsius_a_fahrenheit<-function(temp_C){
  temp_F <-(temp_C * 1.8)+32
  return(temp_F)
}
Celsius_a_fahrenheit(38)

Celsius_a_kelvin<-function(temp_C){
  temp_K <-(temp_C + 273.15)
  return(temp_K)
}
Celsius_a_kelvin(38)

Fahrenheit_a_celsius<-function(temp_F){
  temp_C <-((temp_F-32)*(5/9))
  return(temp_C)
}
Fahrenheit_a_celsius(38)

########################################
huevo_cocido<-function(temperatura){
  tiempo<-0
  while(temperatura<100 && tiempo <100){
    tiempo<-tiempo+1
    temperatura<-temperatura+1
  }
  print("su huevo estará Listo en")
  print(paste("En", tiempo, "segundos o", tiempo/60, "minutos", sep=" "))
}
huevo_cocido(20)

###################################################
#Hacer una funcion que reciba dos argumentos (tiempo, temp) que reporte cuando el huevo está crudo, cocido o quemado
huevo_cocido<-function(temperatura,tiempo){
  
  if (tiempo<=5 & temperatura<=50){
    print("El huevo aún esta crudo")
  } else if (tiempo>5 & tiempo<=8 && temperatura>50 & temperatura<=70) {
    print("El huevo está cocido")
  } else  {
    print("El huevo se ha quemado")
  }
}
huevo_cocido(20,1)
huevo_cocido(60,7)
huevo_cocido(80,10)

#4. apply/lapply/sapply
#Esta familia de funciones es tutilizada para aplicar una funcion a cada elemento de una esturctura de datos
#"Apply" es la mas usada y simple y aplica una funcion a todos los elementos de una matriz

#sintazis
#apli(nmbrematrix,1/2/C(1,2),Funcion)
#Recibe tres argumentos, el primero nombra la matriz, el segundo es el número y corresponde a la mimensión que recibra la operación 1=fila y 2=columnas y tercero es la función que será aplicada.

m<-matrix(data=(1:10), nrow=5, ncol=2)
?apply
apply(m,1,mean)

#que ocurrirá?
m<-matrix(data=(1:25), nrow=5, ncol=5)

me<-apply(m,1,sqrt)
me
#lapply opera co listas y devuelve una lista con el resultad

la<-as.list(m)
lapply(la,sqrt)
lapply(la,mean)

#sapply recibo una lista y devuelve un vectos

vm<-sapply(la,sqrt)

#adicionalmente, existen otras funciones de esta familia como; mapply, tapply, vapply

##Actividad adicional. carpeta de tareas

#Calcule el data "cars" y cree una nueva columuna que rellene con un "muy rápido" si la velocidad del modelo es mayor 15 o rellene con "muy lento" si es menos a 15

#Cree un dataframe con 1000 filas y 2 columnas, reste la primer columna a la seguna y cree una nueva columna con el resultado. Haga este elercicio usando for y apply.


dat<-data.frame(x=1:1000, y=1001:2000)
apply(dat,1,)
?data.frame


L3 <- LETTERS[1:3]
fac <- sample(L3, 10, replace = TRUE)
(d <- data.frame(x = 1, y = 1:10, fac = fac))
## The "same" with automatic column names:
data.frame(1, 1:10, sample(L3, 10, replace = TRUE))