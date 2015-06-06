

f <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

f2 <- na.omit(f[as.Date(f$Date, "%d/%m/%Y") %in% as.Date(c('2007-02-01', '2007-02-02')),])

f2$DateTime = strptime(paste(f2$Date, f2$Time), "%d/%m/%Y %H:%M:%S")

#convert the factor into proper number
f2$Global_active_power=as.numeric(type.convert(as.character(f2$Global_active_power), dec = "."))

#plot with empty x-axis
with(f2, plot(DateTime, Global_active_power, type = "l", xaxt = "n", ylab = "Global Active Power (kilowatts)", xlab = ""))

#get a date range for x-axis
r <- as.POSIXct(round(range(f2$DateTime), "days"))

#draw x-axis by days with specified format
axis.POSIXct(1, at=seq(r[1], r[2], by="days"), format="%a")

dev.copy(png, file="plot2.png")
dev.off()

