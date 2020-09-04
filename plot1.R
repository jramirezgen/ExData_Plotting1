
library(dplyr)
df<-read.table("household_power_consumption.txt",sep=";",header = T)
df<-
    df%>% 
    filter(Date==c("1/2/2007","2/2/2007"))
df<-df%>%select(Date,Global_active_power)
Global_active_power<-df$Global_active_power
Global_active_power<-as.double(x)
hist(Global_active_power,col = "red",xlab = "Global active power (kilowatts)")

