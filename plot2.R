

File_household_power_consumption <- "household_power_consumption.txt"
Data <- read.table(File_household_power_consumption, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
Subset_data <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]


Date_Time <- strptime(paste(Subset_data$Date, Subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Global_Active_Power <- as.numeric(Subset_data$Global_active_power)
png("plot2.png", width=480, height=480)
plot(Date_Time, Global_Active_Power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()