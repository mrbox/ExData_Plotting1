data <- read.csv("../household_power_consumption.txt", sep=";", na.strings = "?", 
                 colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), 
                 skip=66637, nrows=2880, header=FALSE, 
                 col.names=c("date", "time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
data<-cbind(data, as.POSIXct(paste(data$date, data$time), format="%d/%m/%Y %H:%M:%S"))
user_lang <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "en_GB.UTF-8")
colnames(data)[10] <- "real_date"
png(filename="plot2.png")
plot(data$Global_active_power ~ data$real_date, data, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
Sys.setlocale("LC_TIME", user_lang)