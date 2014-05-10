# plot3
# Read data, convert dates and subset
d <- read.table('household_power_consumption.txt', sep=';', header=T, 
                colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings='?')
d$DateTime <- strptime(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S")
d <- subset(d, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))

# create plot png
png("plot3.png", width = 480, height = 480)

# Build time series
plot(d$DateTime, d$Sub_metering_1, pch=NA, xlab="", ylab="Energy sub metering")
lines(d$DateTime, d$Sub_metering_1)
lines(d$DateTime, d$Sub_metering_2, col='red')
lines(d$DateTime, d$Sub_metering_3, col='blue')
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c('black', 'red', 'blue'))

# Close PNG file
dev.off()