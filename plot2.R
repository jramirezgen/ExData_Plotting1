library(dplyr)
install.packages("tidyr")
library(tidyr)
library(lubridate)
df<-read.table("household_power_consumption.txt",sep=";",header = T)
df<-
    df%>% 
    filter(Date==c("1/2/2007","2/2/2007"))
df<-df%>%select(Date,Time,Global_active_power)
df<-unite(df,Date.Time,c(1,2),sep=" ",remove=T)

df$Date.Time<-strptime(df$Date.Time, "%d/%m/%Y %H:%M:%S")
df$Date.Time
