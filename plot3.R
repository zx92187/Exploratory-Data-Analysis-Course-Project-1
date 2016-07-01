

File_household_power_consumption <- "household_power_consumption.txt"
Data <- read.table(File_household_power_consumption, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
Subset_data <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]


Date_Time <- strptime(paste(Subset_data$Date, Subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Global_Active_Power <- as.numeric(Subset_data$Global_active_power)
SubMetering1 <- as.numeric(Subset_data$Sub_metering_1)
SubMetering2 <- as.numeric(Subset_data$Sub_metering_2)
SubMetering3 <- as.numeric(Subset_data$Sub_metering_3)


png("plot3.png", width=480, height=480)
plot(Date_Time, SubMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(Date_Time, SubMetering2, type="l", col="red")
lines(Date_Time, SubMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

