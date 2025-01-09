#visualizaciones avanzadas con ggplot2 
#instalando paquete

install.packages("ggplot2")
library(ggplot2)

#importar datos 
#dataset "mpg" pertenece a ggplot2
?mpg
data <- ggplot2::mpg

#convertir variables categoricas en tipo factor en los datos es entero 
data <-transform(data,
               cyl = factor(cyl),
               drv = factor(drv),
               fl  = factor(fl),
               year = factor(year),
               class = factor(class)
                 
)

##scatterplot (diagrama de dispersion)

ggplot(data)+  #datos
  aes(x=displ, y=hwy)+ #variables 
  geom_point() #grafico de puntos 


#forma alternativa (con aes dentro del ggplot)
  
  ggplot(data, aes(x=displ, y=hwy))+
    geom_point()
  
  ##grafico de linea
  ggplot(data)+
    aes(x=displ, y=hwy)+
    geom_line()
  
  ##grafico combinado de lineas y puntos 
  ggplot(data)+
    aes(x=displ, y=hwy)+
    geom_point()+
    geom_line()
  
  #cambiar colores y tamaño
  
  ggplot(data)+
    aes(x=displ, y=hwy, color="red", size=cty)+
    geom_point()
    
    #con respecto a una variable categorica y tamaño con cuantitativa 
    ggplot(data)+
    aes(x=displ, y=hwy, color=year, size=cty)+
    geom_point()
    
   #con respecto a una variable  cuantitativa 
    ggplot(data)+
      aes(x=displ, y=hwy, color=cty)+
      geom_point()+
      scale_color_gradient2(
        low = "green",
        mid = "gray",
        high = "red",
        midpoint = median(data$cty)
        
      )
    
    #añadir texto en puntos 
    ggplot(data)+aes(x=displ, y=hwy, color=cty)+
      geom_point()+ geom_text(aes(label=rownames(data)),
    check_overlap= TRUE,
    size=2,
    vjust=-1
      )
    #añadir texto a grafico 
    ggplot(data)+aes(x=displ, y=hwy, color=cty)+
      geom_point()+annotate("text",
                            x=6,
                            y=40,
                            label="hwy and displ are\n negatively correlated\n (rho=-0.77, p-value<0.001)",
                            size=3
                            
                            
                            )
    
    
    #suavizado (smooth)
    ggplot(data)+aes(x=displ, y=hwy, color=cty)+
      geom_point()+geom_smooth()
  
    #metodo lm (regresion lineal)
    ggplot(data)+
      aes(x=displ, y=hwy, color=cty)+
      geom_point()+geom_smooth(method = lm)
    
 #facetas dividir paneles 
    ggplot(data)+
      aes(x=displ, y=hwy, color=cty)+
    geom_point()+facet_grid(. ~drv)
    
    #histagrama 
    ggplot(data)+
      aes(x=hwy)+
      geom_histogram()
    
    #numero de barras = sqrt(n)
    
    ggplot(data) +
      aes(x = hwy) +
      geom_histogram(bins = round(sqrt(nrow(data))))
    
    #personalizado
    
    
    ggplot(data) +
      aes(x = hwy) +
      geom_histogram(bins = round(sqrt(nrow(data))),fill = "magenta")
    
    
    
    ggplot(data) +
      aes(x = hwy) +
      geom_histogram(bins = round(sqrt(nrow(data))),aes(fill=class),color="black")
    
    #graficos de densidad
    ggplot(data)+
      aes(x=hwy)+
      geom_density()
    
    #varias
    ggplot(data)+
      aes(x=hwy)+
      geom_density(aes(fill=drv), alpha=0.25)
    
    #combinacion de histograma + densidad
    ggplot(data)+
      aes(x=hwy, y=..density..)+
      geom_histogram()+
      geom_density()
    
#boxplot 
    ggplot(data)+
      aes(x="", y=hwy)+
      geom_boxplot()
 #varios 
    
    ggplot(data)+
      aes(x=drv, y=hwy)+
      geom_boxplot()
    
    
    ggplot(data)+
      aes(x=drv, y=hwy)+
      geom_boxplot()+
    geom_jitter(alpha=0.25, width = 0.2)#datos aleatorios
    
    ggplot(data)+
      aes(x=drv, y=hwy)+
      geom_boxplot()+
    geom_jitter(alpha=0.25, width = 0.2)+
      facet_wrap(~year) #dividir en 2 paneles 
    
    ggplot(data)+
      aes(x=drv, y=hwy, fill=drv)+ #añadir colores
      geom_boxplot(varwidth = TRUE)+
      geom_jitter(alpha=0.25, width = 0.2)+
      facet_wrap(~year)
    
##barplot
    ggplot(data)+
      aes(x=drv)+
      geom_bar()
    
#colores
    
    ggplot(data)+
      aes(x=drv, fill=drv)+ #relleno de colores 
      geom_bar()+
      theme(legend.position = "none") #quitar leyenda
    
    ggplot(data)+
      aes(x=drv, fill=year)+ #respecto a una variable cualitativa year
      geom_bar()
    
    
    #para comparar entre grupos (prporciones) se puede poner barras del mismo tamaño
    
    ggplot(data)+
     geom_bar(aes(x=drv, fill=year), position = "fill")
    
    #dibujar dos barras una a continuacionde la otra para cada valor de  drv
    ggplot(data)+
      geom_bar(aes(x=drv, fill=year), position = "dodge")
    
    
   #personalizacion avanzada  
 #titulos subtitulos    
    p<- ggplot(data)+
      aes(x=drv, y=hwy)+
      geom_point()
    p+labs(
      title = "fuel efficiency for 38 popular models of car ",
      subtitle = "perod 1999-2008",
      caption = "Data: ggplot2::mpg. See more at www.statsandr.com",
      x= "Engine displacemment (litres)",
      y="Highway miles per gallon (mpg)"
      
    )
    
    #temas : modificar aun mas los labs 
    p+labs (
      title = "fuel efficiency for 38 popular models of car ",
      subtitle = "perod 1999-2008",
      caption = "Data: ggplot2::mpg. See more at www.statsandr.com",
      x= "Engine displacemment (litres)",
      y="Highway miles per gallon (mpg)"
      
    )+
      theme(
        plot.title = element_text(
          hjust= 0.5, #center
          size= 12,
          color="steelblue",
          face= "bold"
          
        ),
        plot.subtitle= element_text(
          hjust= 0.5, #center
          size= 10,
          color="gray",
          face= "italic"
          
        )
        
      )
  #leyenda agregar 
    p+aes(color=class)+
      theme(legend.position = "top")
    
    #creando varios graficos de diferentes  tipos en una sola imagen
    p_a <- ggplot(data)+
      aes(x=displ, y=hwy)+
      geom_point()
    
    p_b <- ggplot(data) +
      aes(x = hwy) + 
      geom_histogram()
    
    p_c <- ggplot(data) +
      aes(x = drv, y=hwy) +  
      geom_boxplot()
    #paquete para que contenga todos los graficos creados 
    
    install.packages("patchwork")
    library(patchwork)
    
    p_a + p_b + p_c
    p_a / p_b / p_c
    p_a + p_b / p_c
    (p_a +p_b)/p_c
    
    
  #ajustando las coordenadas   
    #sin ajustar
    p1 <- ggplot(data)+
      aes(x=class, y =hwy)+
      geom_boxplot()
    #ajustadas
      
    p2 <- ggplot(data)+
      aes(x=class, y =hwy)+
      geom_boxplot()
      coord_flip()
      
    p1+p2  
     #vertical 
      ggplot(data)+
        aes(x=class)+
        geom_bar()
      
      #horizontal
      
      ggplot(data)+
        aes(x=class)+
        geom_bar()+
        coord_flip()
      
      #guardar grafico
      getwd()
      setwd("C:/R_studio_undemy")
      getwd()
      ggplot(data)+
        aes(x=displ, y= hwy)+
        geom_point()
      ggsave("plot1.pdf")
      getwd()
      
      
    
    
    