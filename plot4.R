# plot4
# Read data, convert dates and subset
d <- read.table('household_power_consumption.txt', sep=';', header=T, 
                colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings='?')
d$DateTime <- strptime(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S")
d <- subset(d, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))

# create plot png
png("plot4.png", width = 480, height = 480)

# Configure multiplot
par(mfrow=c(2,2))

# Global Active Power plot
plot(d$DateTime, d$Global_active_power, pch=NA, xlab="", ylab="Global Active Power (kilowatts)")
lines(d$DateTime, d$Global_active_power)

# Voltage plot
plot(d$DateTime, d$Voltage, ylab="Voltage", xlab="datetime", pch=NA)
lines(d$DateTime, d$Voltage)

# Submetering plot
plot(d$DateTime, d$Sub_metering_1, pch=NA, xlab="", ylab="Energy sub metering")
lines(d$DateTime, d$Sub_metering_1)
lines(d$DateTime, d$Sub_metering_2, col='red')
lines(d$DateTime, d$Sub_metering_3, col='blue')
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1),col = c('black', 'red', 'blue'),bty = 'n')

# Global reactive power plot
with(d, plot(DateTime, Global_reactive_power, xlab='datetime', pch=NA))
with(d, lines(DateTime, Global_reactive_power))

# Close PNG file
dev.off()