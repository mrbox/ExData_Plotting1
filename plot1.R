setClass('powerDate')
setAs("character","powerDate", function(from) as.Date(from, format="%d/%m/%Y") )
data <- read.csv("../household_power_consumption.txt", sep=";", na.strings = "?", 
                 colClasses=c("powerDate", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), 
                 skip=66637, nrows=2880, header=FALSE, quote="", dec=".",
                 col.names=c("date", "time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

png(filename="plot1.png")
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
