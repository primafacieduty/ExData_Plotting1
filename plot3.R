## DOWNLOAD DATA

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
files <- download.file(url, destfile = "Data", method = "curl")
unzip("Data")

## LOAD AND CLEAN DATA

data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
dataSubset <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

## Plot #3

dev.copy(png, file = "plot3.png", height = 480, width = 480)
plot(dataSubset$DateTime, dataSubset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(dataSubset$DateTime, dataSubset$Sub_metering_2, type = "l", col = "red")
points(dataSubset$DateTime, dataSubset$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()