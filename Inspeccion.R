library(readxl)
library(lubridate)
library(dplyr)
library(tidyr)

df <- read_xlsx("Datos/online_retail_II.xlsx")

summary(df)
str(df)

df$InvoiceDate <- as.POSIXct(df$InvoiceDate, format = "%Y-%m-%d %H:%M:%S")
df$`Customer ID`<- as.character(df$`Customer ID`)

length(unique(df$Invoice))

precmed<- df %>%
  group_by(Invoice)%>%
  summarise(prec_med= mean(Price))


ProdxPed<- df %>%
  group_by(Invoice)%>%
  summarise(Productos=n())

PrecXPed<- df %>%
  group_by(Invoice)%>%
  summarise(Precio=sum(Price))


