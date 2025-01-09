library(readr)

sbux.df<-read.csv("C:/R_studio_undemy/sbuxPrices.csv")
msft.df<-read.csv("C:/R_studio_undemy/msftPrices.csv")

#convertir los datos en time-series es recomendable usar ts
sbux.ts=ts(data=sbux.df$Adj.Close, frequency = 12, start = c(1993,3), end =c(2008,3))
class(sbux.ts)

msft.ts =ts(data=msft.df$Adj.Close, frequency = 12, start = c(1993,3), end =c(2008,3))
class(msft.ts)

#fechas y frecuancias 
sbux.ts
start(sbux.ts)
end(sbux.ts)
frequency(sbux.ts)

#extraer ujn subconjunto de datos de la serie 
tmp=sbux.ts[1:5]
class(tmp)

tmp=window(sbux.ts, start=c(1993,3),end=c(1993,8))
class(tmp)


#combinar dos series temporales  en dos columnas dentro del mismo dataset
sbuxmsft.ts= cbind(sbux.ts, msft.ts)
class(sbuxmsft.ts)

#plot objeto
plot(sbux.ts, col="blue", lwd=2, ylab="Adjusted close",
     main="monthly closing price of SBUX")

#dibujar un subconjunto de datos(Acercar)
plot(window(sbux.ts, start=c(2000,3), end=c(2008,3)),
     ylab="adjunted close", col="blue", lwd=2,
     main="monthly closing price of sbux")

#plot para multiples columnas 
#en graficos diferentes 
plot(sbuxmsft.ts)

#plot en el mismo grafico 
plot(sbuxmsft.ts, plot.type="single",
     main="monthly closing price of sbux",
    ylab="adjunted close price", 
    col=c("blue", "red", lty=1:2))
    legend(1994, 35, legend = c("SUBX", "MSFT"), col= c("blue", "red"),
           lty=1:2)

















