## Creates Plot 1
## Read data from household_power_consumption.txt
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors=F)
## Convert Date from a character datatype to a date datatype
df$Date <- as.Date(df$Date, "%d/%m/%Y")
## Create a vector of the two dates of interest
dates <- as.Date(c("2007-02-01", "2007-02-02"))
## Subset the dataset using the vector containing the two dates of interest
df <- subset(df, Date %in% dates)
## Launch a PNG graphics device, create the plot and close the graphics device
png(filename = "plot1.png", width=480, height=480)
hist(df$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()