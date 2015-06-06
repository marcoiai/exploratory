
f <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

f2 <- na.omit(f[as.Date(f$Date, "%d/%m/%Y") %in% as.Date(c('2007-02-01', '2007-02-02')),])

f2$DateTime = strptime(paste(f2$Date, f2$Time), "%d/%m/%Y %H:%M:%S")

plot(f2$DateTime, f2$Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab="")

lines(f2$DateTime, f2$Sub_metering_2, col = "red", type = 'l', lty=2)
lines(f2$DateTime, f2$Sub_metering_3, col = "blue", type = 'l', lty=2)

legend("topright",                       # x-y coordinates for location of the legend  
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),      # Legend labels  
       col=c("black", "red", "blue"),   # Color of points or lines  
       lty=c(1,1,1),                    # Line type  
       lwd=c(1,1,1)) 

dev.copy(png, file="plot3.png", width=640, height=480)
dev.off()
