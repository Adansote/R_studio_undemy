### Importar datos

#importar packete para archivos excel con extencion .xsl
install.packages("readxl")
library(readxl)
# Hay conjuntos de datos que ya están dentro de R, por ejemplo el USA states (datos de 50 estados de EE.UU)
?state.x77

#Cargar los datos
X <- as.data.frame(state.x77)
X

#Dimensiones
dim(X)

n.X <- nrow(X)
n.X
p.X <- ncol(X)
p.X

#Resumen estadístico de cada variable
summary(X)

#Vector de medias por columna
mu.X <- colMeans(X)
mu.X

#Matriz de covarianza
S.X <- cov(X)
S.X

#Matriz de correlaciones
R.X <- cor(X)
R.X

#Seleccionando subconjuntos
X[X$Population>9000,]

X[(X$Population>9000) & (X$Income>5000),]

subset=X[(X$Population>9000) & (X$Income>5000), c("Population", "Income", "Area")]
subset


## Importar desde un .csv
cancerdata <- read.csv("C:/R_studio_undemy/cancerdata.csv")

#Dimensiones
dim(cancerdata)


#Resumen estadístico de cada variable
summary(cancerdata)

# Filtrar para guardar datos
subset_cancerdata=cancerdata[(cancerdata$radius_mean>17) & (cancerdata$diagnosis=="M"),]
subset_cancerdata
dim(subset_cancerdata)

## Guardar un .csv
write.csv(subset_cancerdata,"C:/R_studio_undemy/subset_cancerdata.csv")


