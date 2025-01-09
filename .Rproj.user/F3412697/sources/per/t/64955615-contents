

#creando un dataframe
mi_df <- data.frame(
  "entero" = 1:4,
  "factor" = c("a", "b", "c", "d"),  # Eliminado el espacio en blanco antes de "c"
  "numero" = c(1.2, 3.4, 4.5, 5.6),
  "caracter"= as.character(c("a", "b", "c", "d"))
)
dim(mi_df)
names(mi_df)

#craendo lista 
mi_vector <- 1:10
mi_matriz <- matrix(1:4, nrow = 2)
mi_df <- data.frame("num"= 1:3, "let"= c("a", "b","c"))
 mi_lista<- list("un_vector"= mi_vector, "una_matriz"= mi_matriz, "un_df"= mi_df)
 mi_lista
 
 #lista recursiva 
 
 lista_recursiva <- list("lista1"= mi_lista, "lista2"= mi_lista)
 lista_recursiva
 
 #propiedades de las listas
 length(lista_recursiva)
 dim(lista_recursiva)
 class(lista_recursiva)
 
 #subconjuntos
 #extraer elementos 
 nivel <- c("prescolar","primaria", "secundaria","prepa","universidad")
 #extarer elemnto 3
 nivel[3]
 #extarer elemnto 1 al 4
 nivel[1:4]
 #extarer elemnto 2 y 5
 nivel[c(2,5)]
 
 #extarer datos de un dataframe 
 mi_df2 <- data.frame(
   "nombre"= c("armando","elsa","olga","nacho"),
   "edad"= c(20,22,34,23),
   "sexo"= c("h","m","m","h"),
   "grupo"=c(1,2,3,4)
 )
 mi_df2
 
 #indice para extraer datos por columna
  mi_df2[1]
  
  #con vector para varios datos 
  mi_df2[c(1,3)]
  
  #extraer por filas 
  mi_df2[3,]
  mi_df2[,1]
  
  #extraccion combinada por renglones y columnas
  mi_df2[3,3]
  
 #extraccion de matrces funciona igual que los dataframe 
  mi_matriz2 <-matrix(1:8, nrow = 4)
  mi_matriz2
 
 #ejemplo de crear una funcion
 area_prima_primary<-function(artista1, artista2, artista3){
   
   artista1* artista2 *artista3
 }
 
 area_prima_primary(3,6,9)
 
 #ejemplo de la funcion ifeslse
num <- 1:8
ifelse(num %% 2== 0 ,"par", "non")
print(num)
 
 
 
 