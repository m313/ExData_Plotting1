# Coursera Exploratory Data Analysis - Assignment 1 - Plot 1
#
#
# Estimating required memory for reading data
# 2075259 rows * 9 columns * 8 bytes/numeric / (2^20)
# =~ 142 MB


# Reading data
data <- read.table("../household_power_consumption.txt", 
                   na.strings="?", sep=";", header=TRUE, nrows=-1)

# data$Date <- as.Date(data$Date)

data$Date <- strptime(data$Date,format="%d/%m/%Y")
data$Time <- strptime(data$Time,format="%H:%M:%S")

good_days <- (data$Date >= "2007-02-01") & (data$Date <= "2007-02-02")

data_good <- data[good_days,]

hist(data_good$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="red")

dev.copy(png, file = "plot1.png",
         width = 480, 
         height = 480)

