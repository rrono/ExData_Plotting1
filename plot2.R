# plot2
# Read data, convert dates and subset
d <- read.table('household_power_consumption.txt', sep=';', header=T, 
                colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings='?')
d$DateTime <- strptime(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S")
d <- subset(d, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))

# create plot png
png("plot2.png", width = 480, height = 480)

# Build time series
plot(d$DateTime, d$Global_active_power, pch=NA, xlab="", ylab="Global Active Power (kilowatts)")
lines(d$DateTime, d$Global_active_power)

# Close PNG file
dev.off()