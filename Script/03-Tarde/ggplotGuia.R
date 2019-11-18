## Gu√?a Ggplot 

#Ggplot consiste en adici√≥n de capas. Sus componentes principales son data (dataframe), Aesthetics (Se usa para definir X y Y. Tambi√©n permite definir color, size o shape de puntos, height de barras, etc...) y Geometry (Corresponde al tipo de grafico; histogram, box plot, line plot, density plot, etc...)

### Instalar y cargar el paquete ggplot2 

install.packages('ggplot2') #Instalar paquete

library(ggplot2) #Cargar paquete

### Datos

# Cargar datos
data(iris)
# Iris : Contiene datos sobre 3 especies de plantas del g√©nero Iris: iris setosa, iris versicolor e iris virginica. 

head(iris) #Revisar qu√© contiene iris


##########################################################################################
### GRAFICA BASE: Definimos el tema base
# A√∫n no graficamos puntos, l√?neas o √°reas

#ggplot es un lienzo, donde pongo los datos y voy poniendo cosas, una imagen x y son punto
ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width)) + #Graficar solo la base del gr√°fico (Ejes y etiqueta de ejes)
  theme_bw() + theme(panel.border = element_blank(), 
                     panel.grid.major = element_blank(), #solo cuadricula interna
                     panel.grid.minor = element_blank(), 
                     axis.line = element_line(colour = "violetred")) +## Definimos el tema (fondo, bordes...) - blanck es olvidelo y blanco es diferente
  labs(title = "Longitud del sepalo Vs. Ancho del sepalo", #Definimos el t√?tulo, 
       subtitle = "Data: Iris") + #Definimos subt√?tulo importante que sea informativo qe todo este titulado
  labs(x = "Longitud del sepalo", y = "Ancho del sepalo")#Definimos los nombres de los ejes, tambien importante que este titulado
colors()

 
#########################################################################################
### GRAFICA PUNTOS

ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width)) + #Grafico base 
  geom_point() + # A√±adimos la capa de puntos definimos geometria de puntos
  theme_bw() + theme(panel.border = element_blank(), 
                     panel.grid.major = element_blank(), 
                     panel.grid.minor = element_blank(), 
                     axis.line = element_line(colour = "violetred3"))+## Definimos el tema (fondo, bordes...)
  labs(title = "Longitud del sepalo Vs. Ancho del sepalo", #Definimos el t√?tulo
       subtitle = "Data: Iris con puntos") + #Definimos subt√?tulo
  labs(x = "Longitud del sepalo", y = "Ancho del sepalo")#Definimos los nombres de los ejes

####### Ahora definimos el color por especie c("tan",thistle", "whitesmoke")
colors()
ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width, color=Species)) + #Grafico base 
  geom_point(shape=64) + # A√±adimos la capa de puntos, forma del punto
  theme_bw() + theme(panel.border = element_blank(), 
                     panel.grid.major = element_blank(), 
                     panel.grid.minor = element_blank(), 
                     axis.line = element_line(colour = "white"))+## Definimos el tema (fondo, bordes...)
  scale_colour_discrete(name = "Especies")+
  labs(title = "Longitud del sepalo Vs. Ancho del sepalo", #Definimos el t√?tulo
       subtitle = "Data: Iris con puntos y color") + #Definimos subt√?tulo
  labs(x = "Longitud del sepalo", y = "Ancho del sepalo")#Definimos los nombres de los ejes 
  

#Podemos usar cualquier forma que queramos, ejemplo:

#ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width, color=Species)) + 
 # geom_point(shape = 11) + # Usamos la forma de la estrella de David
  #theme_bw() + theme(panel.border = element_blank(), 
   #                panel.grid.major = element_blank(), 
    #               panel.grid.minor = element_blank(), 
     #              axis.line = element_line(colour = "white"))+## Definimos el tema (fondo, bordes...)
  #scale_colour_discrete(name = "Especies")+
  #labs(title = "Longitud del sepalo Vs. Ancho del sepalo", #Definimos el t√?tulo
   #    subtitle = "Data: Iris con la estrella de David y color") + #Definimos subt√?tulo
  #labs(x = "Longitud del sepalo", y = "Ancho del sepalo")#Definimos los nombres de los ejes

#ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width, color= Species)) + 
 # geom_point(shape = 64) + #Usamos la forma del arroba (@)
  #theme_bw() + theme(panel.border = element_blank(), 
   #             panel.grid.major = element_blank(), 
    #           panel.grid.minor = element_blank(), 
     #         axis.line = element_line(colour = "white"))+## Definimos el tema (fondo, bordes...)
  #scale_colour_discrete(name = "Especies")+
  #labs(title = "Longitud del sepalo Vs. Ancho del sepalo", #Definimos el t√?tulo
   # subtitle = "Data: Iris con arroba y color") + #Definimos subt√?tulo
  #labs(x = "Longitud del sepalo", y = "Ancho del sepalo")#Definimos los nombres de los ejes



#########################################################################################
### GRAFICA BARRAS 

#geom_col y no point - cual es la diferencia entre una barra y una columna
#fill y las barras significan los mismo
ggplot(data=iris, aes(x=Species, y=Sepal.Length, fill=Species)) + 
  geom_col()+ #Grafico de barras basico, color por especie
  theme_bw() + theme(panel.border = element_blank(), 
                     panel.grid.major = element_blank(), 
                     panel.grid.minor = element_blank(), 
                     axis.line = element_line(colour = "white"))+## Definimos el tema (fondo, bordes...)
  scale_colour_discrete(name = "Especies")+
  labs(title = "Longitud del sepalo por especie", #Definimos el t√?tulo
       subtitle = "Data: Iris grafico de barras") + #Definimos subt√?tulo
  labs(x = "Especie", y = "Longitud del sepalo")#Definimos los nombres de los ejes 


#que se pueda graficar no significa que este bien
ggplot(data=iris, aes(x=Sepal.Width, y=Sepal.Length, fill=Species)) + 
  geom_col()+ #Grafico de barras basico, color por especie
  theme_bw() + theme(panel.border = element_blank(), 
                     panel.grid.major = element_blank(), 
                     panel.grid.minor = element_blank(), 
                     axis.line = element_line(colour = "white"))+## Definimos el tema (fondo, bordes...)
  scale_colour_discrete(name = "Especies")+
  labs(title = "Longitud del sepalo por especie", #Definimos el t√?tulo
       subtitle = "Data: Iris grafico de barras") + #Definimos subt√?tulo
  labs(x = "Ancho de sepalo", y = "Longitud del sepalo")#Definimos los nombres de los ejes 

### GRAFICA HISTOGRAMAS

#ggplot no hace nada por defecto, si es un histograma lo puedo hacer x,y? No, serian dos, porque un hist es el conteo de algo.
ggplot(data=iris) + 
  geom_histogram(aes(x = Sepal.Width, fill = Species), 
                 bins = 12, position = "identity", alpha = 0.4) + # Ya que las columnas se sobrelapan usamos un alpha para trasparentar [0 a 1]
  theme_bw() + theme(panel.border = element_blank(), 
                     panel.grid.major = element_blank(), 
                     panel.grid.minor = element_blank(), 
                     axis.line = element_line(colour = "white"))+## Definimos el tema (fondo, bordes...) #se puede crear su propio tema, tarea crear un tema como el cafÈ, bien cargadito. Tema de referencia Hello Kitty (rosado, blanco y negro)
  labs(title = "Longitud del sepalo por especie", #Definimos el t√?tulo
       subtitle = "Data: Iris histograma") + #Definimos subt√?tulo
  labs(x = "Especies", y = "Ancho del sepalo")#Definimos los nombres de los ejes 


#Podemos graficar dado variables discretas como especies? Revisar facet_wrap
#que hace facet_wrap? - divide la grafica en varias, en este caso en 3 organizadas en una columna - #prohibidas las tortas, distorcionan la realidad
#antes usamos suavisados con alfa para tener una mejor visualizacion pero tambien es posible tener esta opcion
?Facetwrap
ggplot(data=iris) + 
  geom_histogram(aes(x = Sepal.Width, fill = Species), bins = 12) + 
  facet_wrap(~Species, ncol = 1)+
  theme_bw() + theme(panel.border = element_blank(), 
                     panel.grid.major = element_blank(), 
                     panel.grid.minor = element_blank(), 
                     axis.line = element_line(colour = "white"))+## Definimos el tema (fondo, bordes...)
  labs(title = "Longitud del sepalo por especie", #Definimos el t√?tulo
       subtitle = "Data: Iris histograma") + #Definimos subt√?tulo
  labs(x = "Ancho del sepalo", y = "Conteo")#Definimos los nombres de los ejes 


#########################################################################################
#TEMA
Tema<-theme(panel.border = element_blank(), 
            panel.grid.major = element_blank(), 
            panel.grid.minor = element_blank(), 
            axis.line = element_line(colour = "white"))
### GRAFICA L√çNEAS (Smooth) - Suavee

#Graficamos con el m√©todo loess y el intervalo de confianza
#que haces se? por defecto es T o F? Es F. Que m·s metodos tiene aparte de "loess"?
ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width)) +  
  geom_smooth(method = "loess", se=T) + #  M√©todo loess y con el intervalo
  theme_bw() + theme(panel.border = element_blank(), 
                     panel.grid.major = element_blank(), 
                     panel.grid.minor = element_blank(), 
                     axis.line = element_line(colour = "white"))+## Definimos el tema (fondo, bordes...)
  scale_colour_discrete(name = "Especies")+
  labs(title = "Longitud del sepalo Vs. Ancho del sepalo", #Definimos el t√?tulo
       subtitle = "Data: Iris con l√?neas e intervalo de confianza") + #Definimos subt√?tulo
  labs(x = "Longitud del sepalo", y = "Ancho del sepalo")#Definimos los nombres de los ejes 

## Podemos quitar el intervalo de confianza

ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width)) +  
  geom_smooth(method = "loess",se = FALSE) + # Con m√©todo loess y sin el intervalo de confianza
  theme_bw() + theme(panel.border = element_blank(), 
                     panel.grid.major = element_blank(), 
                     panel.grid.minor = element_blank(), 
                     axis.line = element_line(colour = "white"))+## Definimos el tema (fondo, bordes...)
  scale_colour_discrete(name = "Especies")+
  labs(title = "Longitud del sepalo Vs. Ancho del sepalo", #Definimos el t√?tulo
       subtitle = "Data: Iris con l√?neas y sin intervalo de confianza") + #Definimos subt√?tulo
  labs(x = "Longitud del sepalo", y = "Ancho del sepalo")#Definimos los nombres de los ejes 

### Existen otros m√©todos para graficar, por ejemplo lm
## Revisar otros m√©todos como: "auto", "glm", "gam"
#general lineal models

ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width)) + 
  geom_point()+ #Podemos tambi√©n incluir los puntos de dispersi√≥n
  geom_smooth(method = "lm",se = TRUE) + # Con m√©todo lm y con el intervalo de confianza, modelo lineal
  theme_bw() + theme(panel.border = element_blank(), 
                     panel.grid.major = element_blank(), 
                     panel.grid.minor = element_blank(), 
                     axis.line = element_line(colour = "white"))+## Definimos el tema (fondo, bordes...)
  scale_colour_discrete(name = "Especies")+
  labs(title = "Longitud del sepalo Vs. Ancho del sepalo", #Definimos el t√?tulo
       subtitle = "Data: Iris con lm e intervalo de confianza") + #Definimos subt√?tulo
  labs(x = "Longitud del sepalo", y = "Ancho del sepalo")#Definimos los nombres de los ejes 

# Podemos graficar una l√?nea de regresi√≥n por especie?
#coloreado por especie, se puede con o sin punto

ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width, color=Species)) + 
  geom_point()+ #Podemos tambi√©n incluir los puntos de dispersi√≥n
  geom_smooth(method = "lm",se = TRUE) + # Con m√©todo lm y con el intervalo de confianza
  theme_bw() + theme(panel.border = element_blank(), 
                     panel.grid.major = element_blank(), 
                     panel.grid.minor = element_blank(), 
                     axis.line = element_line(colour = "white"))+## Definimos el tema (fondo, bordes...)
  scale_colour_discrete(name = "Especies")+
  labs(title = "Longitud del sepalo Vs. Ancho del sepalo", #Definimos el t√?tulo
       subtitle = "Data: Iris con lm e intervalo de confianza") + #Definimos subt√?tulo
  labs(x = "Longitud del sepalo", y = "Ancho del sepalo")#Definimos los nombres de los ejes 
install.packages("emoGG")
library(gga)
ggarrange(
a, #primera row on una linea plot
#segunda lina con caja y puntos
ggarrange(b,c,ncol=2, labels=c("B","C")),
nrow=2,
labels="A" #label of the line plot
)

##################################################################################################
############################ Actividades adicionales #############################################
##################################################################################################
# 1. Construyan su propio tema


# 2. Usando el paquete "emoGG" y "ggplot2" definir un emoji por especie en un grafico de dispersi√≥n
devtools::install_github("dill/emoGG") #Instalar el paquete emoGG
library(ggplot2)
library(emoGG)
emoji_search("smile")

??fronts
ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width, color=Species)) + 
  geom_emoji(emoji="1f63a")+ 
  geom_smooth(method = "lm",se = TRUE) + 
  theme_bw() + theme(panel.border = element_blank(), 
                     panel.grid.major = element_blank(), 
                     panel.grid.minor = element_blank(), 
                     axis.line = element_line(colour = "white"))+## Definimos el tema (fondo, bordes...)
  scale_colour_discrete(name = "Especies")+
  labs(title = "Longitud del sepalo Vs. Ancho del sepalo",
       subtitle = "Data: Iris con lm e intervalo de confianza") +
  labs(x = "Longitud del sepalo", y = "Ancho del sepalo")


# 3. Construir una grafica con las l√?neas de regresi√≥n por especie, pero modificar en it√°lica los nombres de las especies en la leyenda

# 4. Construir una gr√°fica con las l√?neas de regresi√≥n por especie, incluir el p, r2 y formula (Pista: Usar la funci√≥n stat_poly_eq del paquete "ggpmisc")


##################################################################################################
############################# Literatura recomendada #############################################
##################################################################################################

# 1. http://www.ievbras.ru/ecostat/Kiril/R/Biblio_N/R_Eng/Wickham2016.pdf
# 2. https://stat545.com/graphics-overview.html
# 3. https://github.com/jennybc/ggplot2-tutorial
# 4. http://r-statistics.co/Top50-Ggplot2-Visualizations-MasterList-R-Code.html
