##################################################
#####     TAREA DE RegEx, Ggplot2 y shiny      ###
##################################################

rm(list=ls())
library(stringr)

##########
# RegEx   -------------------------------------------------

vectorCars <- c("juan1@hotmail.com",
                "2juanes@hotmail.com",
                "juaMes@hatmail.com",
                "pedro99@gmail.com",
                "pedro@hotmail.com",
                "pedro9@gmail.com",
                "peter11@xmail.com",
                "otroJujuan99@hotmail.com",
                "otrojuan99@gmail.com",
                "juanchito99@gmail.com",
                "superJuancho99@xmail.com",
                "mary01@gmail.com",
                "sistermarria@gmail.com",
                "marryMe@gmail.com",
                "maria01@gmail.com",
                "maRia01@gmail.com",
                "jhonBravo@gmail.xom",
                "johnBravo@gmail.com",
                "jaunMalEscritoBravin@gmiial.com",
                "jaunGravo@gmail.com",
                "JHONNY@gmail.com",
                "pedrito611@gmail.com",
                "marian@hotmail.com",
                "PedroMaria@gmail.com",
                "juanMaria@xmail.com",
                "JuanPedro@hotmaail.com",
                "pedroJuan@hotmail.com",
                "juanPedrito@hotmail.com")

### crear un regex para extraer del vectorCars
usuarios<-
  juan
  pedro
  maria
  
## Ejercicio 1. el mismo usario (expl�???cito) en dos proveedores de correo
  str_detect(vectorCars, "...@.mail"=="...@...mai")
  
    
?grep
?str_extract
?substring
?regexpr
?gregexpr
?str_extract
#Cuentas Juan (juan, john)
Juan<-c(grep("j..n",vectorCars,ignore.case=T),grep("jua.",vectorCars,ignore.case=T))
cuentasjuan<-vectorCars[sort(unique(Juan))]
#cuentas maria (Maria, Marry,mary)
Maria<-grep("mar",vectorCars,ignore.case=T)
cuentasmaria<-vectorCars[sort(unique(Maria))]
#cuentas Pedro (pedro, peter)
Pedro<-c(grep("pedr",vectorCars,ignore.case=T),grep("pete",vectorCars,ignore.case=T))
cuentaspedro<-vectorCars[sort(unique(Pedro))]


str_extract(verctorCars, "juan",ignore.case=T)
str_extrac(vectorCars, "indicacion")
#grep("inddicacion", vector)


## Ejercicio 2. potencialmente el mismo usuario tanto en el mismo proveedor como en distintos proveedores. Para los dos casos suponga que solo existen tres nombres: Maria / Juan / Pedro, en distintos idiomas

## Ejercicio 3. corrija de manera automatica los usarios o los dominios con nombres errados; preferiblemente escrito como una función.

### Utilizando el archivo fasta
rm(list=ls())
library(stringr)
install.packages("seqinr")
library(seqinr)
seq<-read.fasta(file="tarea.fasta",seqtype ="DNA",as.string = T,whole.header = F)
seq

## Ejercicio 4.1 cuantificar el número de veces que se repiten tripletas de la misma base AANA/CCC/TTNT/GGG  

## Ejercicio 4.2 repita el conteo anterior pero considere que N puede ser la base de la izquierda o de la derecha

## Ejercicio 5.1 Suponga que los datos contienen 0 / 1 o 2 genes, el gen 1 inicia con SSSN y termina en WWWW y el gen 2 inicia en BWW y termina en AANA, indique si cada entrada contiene o no los genes 1 y/o 2. [Pista, inicio sucede ANTES que termina]
## Ejercicio 5.2 cuantificar el número de veces que se repiten tripletas de la misma base AAA/CCC/TTT/GGG
## Ejercicio 5.3 repita el conteo anterior pero considere que N (el codigo IUPAC) puede ser cualquier base


##########
# Ggplot2   -------------------------------------------------

## Utilizando los datos de iris
dat<-iris

library(emoGG)
install.packages("ggplot2")
library(ggplot2)
library(ggpmisc)

#devtools::install_github("dill/emoGG") #Instalar el paquete emoGG

## Ejercicio 1. Usando el paquete "emoGG" y "ggplot2" definir un emoji por especie en un grafico de dispersión

emoji_search("monkey") #Buscamos cuáles códigos nos sirven para flores
emoji_search("mushroom")
emoji_search("rainbow")

data(iris)
ejer1<-ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width),label=label) + 
  theme_minimal() +
  labs(title = "Longitud del sepalo Vs. Ancho del sepalo",subtitle = "Datos Iris")+
  ylab("Ancho de sepalo")+
  xlab("Longitud de sepalo")+
  geom_emoji(data = iris[iris$Species == "setosa", ], emoji = "1f344",size=0.03) + #Emoji de hongo
  geom_emoji(data = iris[iris$Species == "virginica", ], emoji = "1f648", size=0.03) + #Emoji de monito
  geom_emoji(data = iris[iris$Species == "versicolor", ], emoji = "1f308", size=0.03) #Emoji de arcoiris

#guardamos
ggsave("dia3_plot1.png", plot = ejer1, 
       type = 'cairo',
       width = 6, height = 6, dpi = 150)  

## Ejercicio 2. Construir una grafica con las l�???neas de regresión por especie, pero modificar en itálica los nombres de las especies en la leyenda

library(ggpmisc)

ejer2<-ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width, color=Species)) + 
  geom_point()+ #grafica de puntos
  geom_smooth(method = lm, se = FALSE, formula = y~x, alpha= 0.18, size = 1.1) +
    stat_poly_eq(aes(label = paste(..eq.label.., ..rr.label.., sep = "~~~~~~")), 
               formula = y~x, parse = TRUE, size = 4, label.x = "right",label.y = "top")+
  scale_color_brewer(name = "Especies", palette = "Set2",labels=c(expression(paste(italic("I. setosa"))),expression(paste(italic("I. versicolor"))),expression(paste(italic("I. virginica"))))) +
  theme_bw() + theme(panel.border = element_blank(), 
                     panel.grid.major = element_blank(), 
                     panel.grid.minor = element_blank(), 
                     axis.line = element_line(colour = "white"))+
  labs(title = "Longitud del sepalo Vs. Ancho del sepalo",
       subtitle = "Data: Iris") + 
  labs(x = "Longitud del sepalo", y = "Ancho del sepalo")

#guardamos
ggsave("dia3_plot2.png", plot = ejer2, 
       type = 'cairo',
       width = 6, height = 6, dpi = 150)  

## Ejercicio 3. Construir una gráfica con las l�???neas de regresión por especie, incluir el valor de p, r2 y formula (Pista: Usar la función stat_poly_eq)
ejer3<-ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width, color=Species)) + 
  geom_point()+ #grafica de puntos
  facet_wrap(~Species, ncol = 1)+
  geom_smooth(method = lm, se = FALSE, formula = y~x, alpha= 0.18, size = 1.1) +
  stat_poly_eq(aes(label = paste(..eq.label.., ..rr.label.., sep = "~~~~~~")), 
               formula = y~x, parse = TRUE, size = 4, label.x = "right",label.y = "top")+
  scale_color_brewer(name = "Especies", palette = "Set2",labels=c(expression(paste(italic("I. setosa"))),expression(paste(italic("I. versicolor"))),expression(paste(italic("I. virginica"))))) +
  theme_bw() + theme(panel.border = element_blank(), 
                     panel.grid.major = element_blank(), 
                     panel.grid.minor = element_blank(), 
                     axis.line = element_line(colour = "white"))+
  labs(title = "Longitud del sepalo Vs. Ancho del sepalo",
       subtitle = "Data: Iris") + 
  labs(x = "Longitud del sepalo", y = "Ancho del sepalo")
#guardamos
ggsave("dia3_plot3.png", plot = ejer3, 
       type = 'cairo',
       width = 6, height = 6, dpi = 150)  

## Ejercicio 4. Cree su propio theme donde las majorgrid sean verdes, las minorgrid de color rosado, el fondo de la grafica de color azul, el margen derecho y el margen superior no aparezcan.######TEMA HELLOKITTY


font_families()

temaPaula<-theme(
  panel.border = element_rect(colour = "#B01455"), 
  panel.grid.major = element_line(colour = "#F88FB0"), 
  panel.grid.minor = element_line(colour = "#EA6292"),
  panel.background = element_rect(fill="#F2C8D6"),
  axis.line = element_line(colour = "#B01455"),
  plot.title = element_text(color="#B01455", size=14, face="bold",hjust=0.5,family="sans"),
  plot.subtitle =element_text(color="#EA6292",size=12,face="bold",family="mono"), 
  plot.caption = element_text(color="#cf36a6",size=10,face="bold",family="serif"),
  plot.tag = element_text(color="#b0338f",size=8,face="bold"),
  axis.title.x = element_text(color="#c31954", size=13, face="bold"),
  axis.title.y = element_text(color="#993332", size=13, face="bold"),
  axis.text.x = element_text(color="#c31954", size=8),
  axis.text.y= element_text(color="#993332", size=8))

ejer4<-ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width),label=label) + 
  labs(title = "Longitud del sepalo Vs. Ancho del sepalo",subtitle = "Datos Iris",caption="Tarea Curso R - Colevol",tag="Ejer. 4",colours="Cylinders")+
  ylab("Ancho de sepalo")+
  xlab("Longitud de sepalo")+
  geom_emoji(data = iris[iris$Species == "setosa", ], emoji = "1f43e",size=0.04) + 
  geom_emoji(data = iris[iris$Species == "virginica", ], emoji = "1f431", size=0.03) +
  geom_emoji(data = iris[iris$Species == "versicolor", ], emoji = "1f344", size=0.03)+
  theme_bw() + temaPaula

  
#guardamos
  ggsave("dia3_plot4.png", plot = ejer4, 
         type = 'cairo',
         width = 6, height = 6, dpi = 150)  
  

##########
# Shiny   -------------------------------------------------

## Ejercicio 1. Crear un app que reciba una cantidad de números simulados bajo una distribución normal y que como output sea una grafica tipo histograma y una tabla que muestre la media, la mediana y la sd de los datos

library(shiny)
  
  ui <- fluidPage(
    titlePanel("Ejercicio shinny"),
    sidebarLayout(
      sidebarPanel(
        radioButtons("dist", "Distribution type:",
                     c("Normal" = "norm")),
        br(),
        sliderInput("n",
                    "N�mero de observaciones:",
                    value = 500,
                    min = 1,
                    max = 1000)),
      mainPanel(
        tabsetPanel(type = "tabs",
                    tabPanel("Histograma", plotOutput("plot")),
                    tabPanel("Tabla", verbatimTextOutput("summary")))
      )
    )
  )
  
  
  server <- function(input, output) {
    d <- reactive({
      dist <- switch(input$dist,
                     norm = rnorm,
                     rnorm)
      dist(input$n)
    })
    output$plot <- renderPlot({
      dist <- input$dist
      n <- input$n
      hist(d(),
           main = paste("r", dist, "(", n, ")", sep = ""),
           col = "#75AADB", border = "white")
    })
    output$summary <- renderPrint({
      summary(d())
    })}
  
  # Create Shiny app ----
  shinyApp(ui, server)
  