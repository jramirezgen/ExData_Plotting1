library(dplyr)
library(tidyr)
library(lubridate)
df<-read.table("household_power_consumption.txt",sep=";",header = T)
df<-
    df%>% 
    filter(Date==c("1/2/2007","2/2/2007"))
df<-unite(df,Date.Time,c(1,2),sep=" ",remove=T)

df$Date.Time<-strptime(df$Date.Time, "%d/%m/%Y %H:%M:%S")
x<-df$Date.Time

df$Global_active_power<-as.numeric(df$Global_active_power)
df$Global_reactive_power<-as.numeric(df$Global_reactive_power)
df$Voltage<-as.numeric(df$Voltage)
df$Sub_metering_1<-as.numeric(df$Sub_metering_1)
df$Sub_metering_2<-as.numeric(df$Sub_metering_2)
df$Sub_metering_3<-as.numeric(df$Sub_metering_3)

Global_active_power<-df$Global_active_power
Global_reactive_power<-df$Global_reactive_power
Voltage<-df$Voltage
Sub_metering_1<-df$Sub_metering_1
Sub_metering_2<-df$Sub_metering_2
Sub_metering_3<-df$Sub_metering_3
class(df$Sub_metering_1)
Voltage
par(mfrow=c(2,2))

plot(x,Global_active_power,type="l",xlab = "",ylab="Global active power")
plot(x,Voltage,type="l",xlab = "",ylab="Voltage")

plot(x, Sub_metering_1,type="l",col="black",ylab = "Energy sub metering",xlab = " ")
lines(x,Sub_metering_2, col="red")
lines(x,Sub_metering_3, col="blue")
legend("topright",lty=1,
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       fill =c("black","red","blue"),cex=0.7)

plot(x,Global_reactive_power,type="l",xlab = "",ylab="Global_reactive_power")

