# Reading, subsetting power consumption data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)

# Saving figure as Plot_4.png
png("Plot_4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

# Plotting datetime v/s Global Active Power
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

# Plotting datetime v/s Voltage
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

# Plotting datetime v/s Energy Sub_metering
plot(datetime, as.numeric(subSetData$Sub_metering_1), type="l", ylab="Energy Submetering", xlab="")
lines(datetime, as.numeric(subSetData$Sub_metering_2), type="l", col="red")
lines(datetime, as.numeric(subSetData$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

# Plotting datetime v/s Global Reactive Power
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()