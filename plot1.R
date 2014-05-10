# plot1
# Read data, convert dates and subset
d <- read.table('household_power_consumption.txt', sep=';', header=T, 
                colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings='?')
d$DateTime <- strptime(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S")
d <- subset(d, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))

# create plot png
png("plot1.png", width = 480, height = 480, bg = "transparent")

# Build histogram
hist(d$Global_active_power, col='red', 
     xlab = 'Global Active Power (kilowatts)',
     main = 'Global Active Power')

# Close PNG file
dev.off()






