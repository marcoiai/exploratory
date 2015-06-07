
dataRaw <- read.csv(
  "household_power_consumption.txt",
  sep=";",
  dec=".",
  na.strings = "?",
  colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
)
data <- dataRaw[(dataRaw$Date == "1/2/2007" | dataRaw$Date == "2/2/2007"), ]
data$Time = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png", width = 400, height = 400)

par(mfrow = c(2, 2))

# Plot 1
plot(data$Time, data$Global_active_power, type = "n", ylab = "Global Active Power", xlab="")
lines(data$Time, data$Global_active_power)

# Plot 2
plot(data$Time, data$Voltage, type = "n", ylab = "Voltage", xlab="")
lines(data$Time, data$Voltage)

# Plot 3
plot(c(data$Time,data$Time,data$Time), c(data$Sub_metering_1, data$Sub_metering_2, data$Sub_metering_3), type = "n", ylab = "Energy sub metering", xlab="")
lines(data$Time, data$Sub_metering_1, col="black")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"))

# Plot 4
plot(data$Time, data$Global_reactive_power, type = "n", ylab = "Global_reactive_power", xlab="datetime")
lines(data$Time, data$Global_reactive_power)

dev.off()
