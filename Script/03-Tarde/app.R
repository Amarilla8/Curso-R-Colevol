library(shiny)

# Define UI for app that draws a histogram ----
ui <- fluidPage(

  # App title ----
  titlePanel("Hello Shiny!"), #titulo del panel
# Sidebar layout with input and output definitions ----
  sidebarLayout(     #sidebarLayout "una cosa que va a un lado"
    # Sidebar panel for inputs ----
    sidebarPanel(     #que va a tener? -> poner un pnaler lateral
      # Input: Slider for the number of bins ----
      sliderInput(inputId = "bins",  #que es slider y que es input? va a recibir cosas, es el panel latera, un slier - 
                  label = "Pedacitos de:", #etiqueta
                  min = 1,   #donde inicia el slider
                  max = 50, #donde termina el slider
                  value = 30)
    ), #cierra sidebarpabel
    # Main panel for displaying outputs ---- salida en el panel principal
    mainPanel( #inicia panel principal
      # Output: Histogram ----
      plotOutput(outputId = "distPlot") #graficar salida - la salida de llama distplot y la entrada bin
    ) #cierra mainpanel
  ) #cierra sidebarlayoue
) #fin

#el cliente no procesa, uno le da entradas al servior y este regresa la salida que en este caso en un plot


# Define server logic required to draw a histogram ----
server <- function(input, output) { #se define la funcion que hará el histograma

  # Histogram of the Old Faithful Geyser Data ----
  # with requested number of bins
  # This expression that generates a histogram is wrapped in a call
  # to renderPlot to indicate that:
  #
  # 1. It is "reactive" and therefore should be automatically
  #    re-executed when inputs (input$bins) change
  # 2. Its output type is a plot
  output$distPlot <- renderPlot({  #la salida se llama distPlot tiene que coincidir con el anterior, con la funcion renderPlot "plot renderizado" para el cliente

    x    <- faithful$waiting #datos, una lista (no se que tipo s3, s4) busca waiting
#    bins <- seq(min(x), max(x), length.out = input$bins + 1)
#    bins <- seq(min(x), max(x), length.out =  6) #maldad en length.out porque tiene un numero fijo, esta linea no se debe usar, si no la anterior
bins <- seq(min(x), max(x), length.out = input$bins + 1) #ahora si va a suceder algo, bins que es la entrada da una secuencia que se puede modificar
    hist(x, breaks = bins, col = "#75AADB", border = "white", #hist es latis o ggplot? buscar. - hago un hist para x con los breaks definidos por bins, defino colores. lo importantes es poner el input como bins. 
    #lo importante en terminos de shiny es mostrar, blink blink - 
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")

    })

}
#diferencia entre image y plot

# Create Shiny app ----
shinyApp(ui = ui, server = server) #ya creado el servidos y usuario, solo hay que llamarlo 
#se pone en R y se agre en el navegador
#desde Rstudio tambien lo va a lanzar, pero es buena idea saber donde lo esta haciendo. puede abrir puertas extrañas. 
