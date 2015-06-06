
f <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

filtered <- na.omit(f[as.Date(f$Date, "%d/%m/%Y") %in% as.Date(c('2007-02-01', '2007-02-02')),])

hist(as.double(as.character(filtered$Global_active_power)), col = "red", breaks = 25, main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png")
dev.off()
