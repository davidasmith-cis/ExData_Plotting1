## Creates Plot 3
library(lubridate)
## Read data from household_power_consumption.txt
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors=F)
## Convert Date from a character datatype to a date datatype
df$Date <- as.Date(df$Date, "%d/%m/%Y")
## Create a vector of the two dates of interest
dates <- as.Date(c("2007-02-01", "2007-02-02"))
## Subset the dataset using the vector containing the two dates of interest
df <- subset(df, Date %in% dates)
## Add a datetime column to the dataset
datetime <- paste(df$Date, df$Time)
df$datetime <- ymd_hms(datetime)
## Launch a PNG graphics device, create the plot and close the graphics device
png(filename = "plot3.png", width=480, height=480)
plot(df$datetime, df$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(df$datetime, df$Sub_metering_1)
lines(df$datetime, df$Sub_metering_2, col = "red")
lines(df$datetime, df$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.off()