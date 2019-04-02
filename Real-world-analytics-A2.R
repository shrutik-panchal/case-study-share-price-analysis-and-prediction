# Real World Analytics
# Financial Share price analysis of a company

# Reading data from CSV
Telstra_Hist_data <- read.csv(file="AGL.AX.csv", header = TRUE, sep=",")

# Formatting Date information and storing data in new variable
Odata <- Telstra_Hist_data
Odata$Date <- as.Date(Odata$Date, format="%d/%m/%Y")
