# ------------------------------------------------------------------------------------------
# Real World Analytics
# Financial Share price analysis of a company
# ------------------------------------------------------------------------------------------
# Libraries Used in program
library(plotly)
library(quantmod)
# ------------------------------------------------------------------------------------------
# Reading data from CSV
AGL_data <- read.csv(file="AGL.AX.csv", header = TRUE, sep=",")

# Formatting Date information and storing data in new variable
Odata <- AGL_data[-1,]
Odata$Date <- as.Date(Odata$Date, format="%d/%m/%Y")
# ------------------------------------------------------------------------------------------
# Creating column for Trends - Increasing and Decreasing
for (i in 1:length(Odata[,1])){
  if (Odata$Close[i] >= Odata$Open[i]){Odata$Direction[i] = "Increasing"}
  else {Odata$Direction[i] = "Decreasing"}
}
# ------------------------------------------------------------------------------------------
# Creating color lists for Bullish and Bearish Candle
i <- list(line = list(color = 'green'))
d <- list(line = list(color = 'pink'))
# ------------------------------------------------------------------------------------------
# Creating basic candle stick diagram to visualize share price - Point 2
candleStickGraph <- Odata %>%
  # Creating Plot and assigning appropriate columns of data
  plot_ly(x = ~Date, type = "candlestick",
          open = ~Open, close = ~Close,
          high = ~High, low = ~Low,
          increasing = i, decreasing = d) %>%
  # Layout Creation
  layout(title = "AGL Energy Limited Share Price: Behaviour and Performance (Mar-May 2018)",
         xaxis = list(rangeslider = list(visible = F), title = "Date"),
         yaxis = list(title = "Share Price (Open, Close, High, Low)"))

# Calling candleStickGraph
candleStickGraph
# ------------------------------------------------------------------------------------------
# Creating basic line diagram to visualize share price closing - Point 2
lineGraph <- Odata %>%
  plot_ly(x = ~Date, y = ~Close, type = "scatter", mode = "lines") %>%
  layout(title = "AGL Energy Limited Share Price: Date vs Closing Price (Mar-May 2018)",
         xaxis = list(rangeslider = list(visible = F), title = "Date"),
         yaxis = list(title = "Share Price (Close)"))
lineGraph
# ------------------------------------------------------------------------------------------
# Checking the data distribution - Normal or not
for (i in 2:length(AGL_data[,1])){
  Odata$Daily_Return[i-1] <- (AGL_data$Close[i]-AGL_data$Close[i-1])/AGL_data$Close[i-1]
  #print(i)
}

shapiro.test(Odata$Daily_Return)

HistGraphDistribution <- Odata %>%
  plot_ly(x = ~Daily_Return, type = "histogram", histnorm = "probability") %>%
  layout(title = "Distribution of Daily Returns",
         xaxis = list(title = "Daily Returns"))

HistGraphDistribution
# # ------------------------------------------------------------------------------------------
# # Drift Calculation - daily and annualised
# sampleData <- 62
# annualDays <- 249
# drift.daily <- (1/(annualDays*sampleData))*sum(Odata$Daily_Return)
# drift.daily*100
# drift.annual <- (annualDays/(annualDays*sampleData))*sum(Odata$Daily_Return)
# drift.annual*100
# # ------------------------------------------------------------------------------------------
# # Volatility Calculation - daily and annulisedv
# 
# # Daily return - mean of daily return and whole square
# MeanDailyReturn <- mean(Odata$Daily_Return)
# 
# for (i in 2:length(AGL_data[,1])){
#   Odata$Daily_ReturnMeanSQ[i-1] <- (Odata$Daily_Return[i-1] - MeanDailyReturn)^2
# }
# # Calculation
# volat.daily <- sqrt((1/(annualDays*(sampleData-1))) * sum(Odata$Daily_ReturnMeanSQ))
# volat.daily*100
# volat.annual <- sqrt((annualDays/(annualDays*(sampleData-1))) * sum(Odata$Daily_ReturnMeanSQ))
# volat.annual*100
# # ------------------------------------------------------------------------------------------

