

File_household_power_consumption <- "household_power_consumption.txt"
Data <- read.table(File_household_power_consumption, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
Subset_data <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

Date_time <- strptime(paste(Subset_data$Date, Subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Global_Active_Power <- as.numeric(Subset_data$Global_active_power)
Global_Reactive_Power <- as.numeric(Subset_data$Global_reactive_power)
Voltage <- as.numeric(Subset_data$Voltage)
SubMetering1 <- as.numeric(Subset_data$Sub_metering_1)
SubMetering2 <- as.numeric(Subset_data$Sub_metering_2)
SubMetering3 <- as.numeric(Subset_data$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(Date_time, Global_Active_Power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(Date_time, Voltage, type="l", xlab="datetime", ylab="Voltage")


plot(Date_time, SubMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(Date_time, SubMetering2, type="l", col="red")
lines(Date_time, SubMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(Date_time, Global_Reactive_Power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()