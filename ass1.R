# For plot 1

ass1 <- read.table("./household_power_consumption.txt",sep = ";" ,header = TRUE) #load the .txt
ass1[ass1=="?"]<-NA # replace ? to NA
ass1$Date <- format(as.Date(ass1$Date,format="%d/%m/%Y"),"%Y-%m-%d")

ass1_final <- subset(ass1, ass1$Date >="2007-02-01"& ass1$Date<="2007-02-02")

globalActivePower <- as.numeric(ass1_final$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()


#For plot 2
ass1 <- read.table("./household_power_consumption.txt",sep = ";" ,header = TRUE) #load the .txt
ass1[ass1=="?"]<-NA # replace ? to NA
ass1$Date <- format(as.Date(ass1$Date,format="%d/%m/%Y"),"%Y-%m-%d")
ass1_final <- subset(ass1, ass1$Date >="2007-02-01"& ass1$Date<="2007-02-02")

date_time <- strptime(paste(ass1_final$Date, ass1_final$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 
globalActivePower <- as.numeric(ass1_final$Global_active_power)
png("plot2.png", width=480, height=480)
plot(date_time, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

#For plot 3
ass1 <- read.table("./household_power_consumption.txt",sep = ";" ,header = TRUE) #load the .txt
ass1[ass1=="?"]<-NA # replace ? to NA
ass1$Date <- format(as.Date(ass1$Date,format="%d/%m/%Y"),"%Y-%m-%d")
ass1_final <- subset(ass1, ass1$Date >="2007-02-01"& ass1$Date<="2007-02-02")

date_time <- strptime(paste(ass1_final$Date, ass1_final$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 
globalActivePower <- as.numeric(ass1_final$Global_active_power)
subMetering1 <- as.numeric(ass1_final$Sub_metering_1)
subMetering2 <- as.numeric(ass1_final$Sub_metering_2)
subMetering3 <- as.numeric(ass1_final$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(date_time, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, subMetering2, type="l", col="red")
lines(date_time, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

#For plot 4

date_time <- strptime(paste(ass1_final$Date, ass1_final$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 
globalActivePower <- as.numeric(ass1_final$Global_active_power)
globalReactivePower <- as.numeric(ass1_final$Global_reactive_power)
voltage <- as.numeric(ass1_final$Voltage)
subMetering1 <- as.numeric(ass1_final$Sub_metering_1)
subMetering2 <- as.numeric(ass1_final$Sub_metering_2)
subMetering3 <- as.numeric(ass1_final$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(date_time, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(date_time, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(date_time, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, subMetering2, type="l", col="red")
lines(date_time, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(date_time, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
