data <- read.csv("../household_power_consumption.txt", sep=";", na.strings = "?", 
                 colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), 
                 skip=66637, nrows=2880, header=FALSE, 
                 col.names=c("date", "time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
data<-cbind(data, as.POSIXct(paste(data$date, data$time), format="%d/%m/%Y %H:%M:%S"))
colnames(data)[10] <- "real_date"
user_lang <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "en_GB.UTF-8")
par(mfrow=c(2,2))
png(filename="plot4.png")
par(mfrow=c(2,2))
plot(data$Global_active_power ~ data$real_date, data, type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(data$Voltage ~ data$real_date, data, type="l", ylab="Voltage", xlab="datetime")
plot(data$Sub_metering_1 ~ data$real_date, type="n", ylab="Energy sub metering", xlab="")
lines(data$Sub_metering_1 ~ data$real_date)
lines(data$Sub_metering_2 ~ data$real_date, col="red")
lines(data$Sub_metering_3 ~ data$real_date, col="blue")
legend("topright", pch="-", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=c(2,2,2))
plot(data$Global_reactive_power ~ data$real_date, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()

#Sys.setlocale("LC_TIME", user_lang)
