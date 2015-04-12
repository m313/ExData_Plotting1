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

# data$Date <- strptime(data$Date,format="%d/%m/%Y")
# data$Time <- strptime(data$Time,format="%H:%M:%S")
# 
# d <- strptime(data$Date,format="%d/%m/%Y")
# t <- strptime(data$Time,format="%H:%M:%S")

# Combine date and time info into data$Time
data$Time <- strptime(paste(data$Date, data$Time),format="%d/%m/%Y %H:%M:%S")

# Now some values have a time zone, some don't
# > data$Time[141636] # with time zone
# > data$Time[141637] # without

# > min(which(data$Time>="2007-02-01")) # first sample of interest !! 
# [1] 66637

# max(which(data$Time<"2007-02-03")) # last sample of interest !!
# [1] 69516


good_days <- (data$Time >= "2007-02-01") & (data$Time < "2007-02-03")
# > summary(good_days)
# Mode   FALSE    TRUE    NA's 
# logical 2072139    2880     240 


# first and last row of interest
# row_begin <- min(which(good_days))
# 66637
# row_end <- max(which(good_days))
# 69516


data_good <- data[good_days,]


# ## Plot 1
# hist(data_good$Global_active_power,
#      main="Global Active Power",
#      xlab="Global Active Power (kilowatts)",
#      col="red")
# 
# dev.copy(png, file = "plot1.png",
#          width = 480, 
#          height = 480)

## Plot 2
plot(data_good$Time, data_good$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png",
         width = 480, 
         height = 480)
dev.off()
