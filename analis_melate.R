

library(readr)

#creando dataframe e importando datos 
melate.df<-read.csv("C:/melate_docs/MELATE.csv")
revancha.df<-read.csv("C:/melate_docs/REVANCHA.csv")
revanchita.df<-read.csv("C:/melate_docs/REVANCHITA.csv")

#convertir los datos en time-series es recomendable usar ts
# Selecciona las columnas que deseas convertir en una serie temporal
melate.df_subset <- melate.df[, c("num1", "num2", "num3", "num4", "num5", "num6", "numadicional")]
revancha.df_subset <-revancha.df[, c("num1", "num2", "num3", "num4", "num5", "num6")]
revanchita.df_subset <-revanchita.df[, c("num1", "num2", "num3", "num4", "num5", "num6")]


# Convierte las columnas seleccionadas en una serie temporal
melate.ts <- ts(data = melate.df_subset, frequency = 12, start = c(2024, 1,3), end = c(2024, 3,17))
revancha.ts <- ts(data =revancha.df_subset, frequency = 12, start = c(2024, 1,3), end = c(2024, 3,17))
revanchita.ts <- ts(data =revanchita.df_subset, frequency = 12, start = c(2024, 1,3), end = c(2024, 3,17))
head(melate.df)

head(melate.df_subset)

# Verificar las dimensiones de tus datos
dim(melate.df_subset)

# Verifica la clase de melate.ts
class(melate.ts)
class(revancha.ts)
class(revanchita.ts)

#fechas y frecuancias 
melate.ts
start(melate.ts)
end(melate.ts)
frequency(melate.ts)

revancha.ts
start(revancha.ts)
end(revancha.ts)
frequency(revancha.ts)

revanchita.ts
start(revanchita.ts)
end(revanchita.ts)
frequency(revanchita.ts)

plot(melate.ts, col="blue", lwd=2, ylab="numero frecuentes",
     main="tiempo trascurrido melate")

plot(revancha.ts, col="blue", lwd=2, ylab="numero frecuentes",
     main="tiempo trascurrido Revancha")

plot(revanchita.ts, col="blue", lwd=2, ylab="numero frecuentes",
     main="tiempo trascurrido Revanchita")

#extraer ujn subconjunto de datos de la serie 

####



# Calcular la frecuencia de cada número en la serie temporal
frecuencia_numeros <- table(melate.ts)
frecuencia_numerosR<-table(revancha.ts)
frecuencia_numerosChita<-table(revanchita.ts)

# Ordenar los números por frecuencia
frecuencia_numeros_ordenada <- sort(frecuencia_numeros, decreasing = TRUE)
frecuencia_numeros_ordenadaR<-sort(frecuencia_numerosR, decreasing = TRUE)
frecuencia_numeros_ordenadaChita<-sort(frecuencia_numerosChita, decreasing = TRUE)

# Graficar los números más frecuentes
barplot(frecuencia_numeros_ordenada, col = "blue", main = "Números más frecuentes en melate", 
        ylab = "Frecuencia", xlab = "Número")

barplot(frecuencia_numeros_ordenadaR, col = "blue", main = "Números más frecuentes en revancha", 
        ylab = "Frecuencia", xlab = "Número")

barplot(frecuencia_numeros_ordenadaChita, col = "blue", main = "Números más frecuentes en revanchitaa", 
  
        
        ylab = "Frecuencia", xlab = "Número")

###



# Calcular la frecuencia de cada número en la serie temporal
frecuencia_numeros <- table(melate.ts)
frecuencia_numerosR<-table(revancha.ts)
frecuencia_numerosChita<-table(revanchita.ts)


# Ordenar la tabla de frecuencia en orden descendente
frecuencia_numeros_ordenada <- sort(frecuencia_numeros, decreasing = TRUE)
frecuencia_numeros_ordenadaR <- sort(frecuencia_numerosR, decreasing = TRUE)
frecuencia_numeros_ordenadaChita <- sort(frecuencia_numerosChita, decreasing = TRUE)

# Obtener los 10 números más repetidos
numeros_mas_repetidosM <- head(frecuencia_numeros_ordenada, 10)
numeros_mas_repetidosR <- head(frecuencia_numeros_ordenadaR, 10)
numeros_mas_repetidosChita <- head(frecuencia_numeros_ordenadaChita, 10)

# Mostrar los 10 números más repetidos (tabla)
numeros_mas_repetidosM 
numeros_mas_repetidosR 
numeros_mas_repetidosChita

                    

# Graficar los 10 números más repetidos (gráfico de barras)

barplot(df_numerosM$Frecuencia, names.arg = df_numerosM$Numero,
        col = "blue", main = "Los 10 números más repetidos de melate",
        xlab = "Número", ylab = "Frecuencia")

barplot(df_numerosR$Frecuencia, names.arg = df_numerosR$Numero,
        col = "blue", main = "Los 10 números más repetidos de Revancha",
        xlab = "Número", ylab = "Frecuencia")

barplot(df_numerosChita$Frecuencia, names.arg = df_numerosChita$Numero,
        col = "blue", main = "Los 10 números más repetidos de Revanchita",
        xlab = "Número", ylab = "Frecuencia")


################

