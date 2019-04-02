# Real World Analytics
# Financial Share price analysis of a company

# Libraries Used in program
library("plotly")
library(quantmod)


# Reading data from CSV
Telstra_Hist_data <- read.csv(file="AGL.AX.csv", header = TRUE, sep=",")

# Formatting Date information and storing data in new variable
Odata <- Telstra_Hist_data
Odata$Date <- as.Date(Odata$Date, format="%d/%m/%Y")

# Creating color lists for Bullish and Bearish Candle
i <- list(line = list(color = 'green'))
d <- list(line = list(color = 'pink'))

# Creating basic candle stick diagram to visualize share price
chart <- Odata %>%
  plot_ly(x = ~Date, type = "candlestick",
          open = ~Open, close = ~Close,
          high = ~High, low = ~Low,
          increasing = i, decreasing = d) %>%
  layout(title = "Financial Data",
         xaxis = list(rangeslider = list(visible = F)))
chart