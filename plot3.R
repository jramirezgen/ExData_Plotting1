library(dplyr)
library(tidyr)
library(lubridate)
df<-read.table("household_power_consumption.txt",sep=";",header = T)
df<-
    df%>% 
    filter(Date==c("1/2/2007","2/2/2007"))
df<-df%>%select(Date,Time,Sub_metering_1,Sub_metering_2,Sub_metering_3 )
df<-unite(df,Date.Time,c(1,2),sep=" ",remove=T)

df$Date.Time<-strptime(df$Date.Time, "%d/%m/%Y %H:%M:%S")
x<-df$Date.Time
df$Sub_metering_1<-as.numeric(df$Sub_metering_1)
df$Sub_metering_2<-as.numeric(df$Sub_metering_2)
df$Sub_metering_3<-as.numeric(df$Sub_metering_3)
Sub_metering_1<-df$Sub_metering_1
Sub_metering_2<-df$Sub_metering_2
Sub_metering_3<-df$Sub_metering_3
class(df$Sub_metering_1)


plot(x, Sub_metering_1,type="l",col="black",ylab = "Energy sub metering",xlab = " ")
lines(x,Sub_metering_2, col="red")
lines(x,Sub_metering_3, col="blue")
legend("topright",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       fill =c("black","red","blue"),cex=0.8,lty=1)

