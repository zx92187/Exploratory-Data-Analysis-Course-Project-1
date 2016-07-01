

File_household_power_consumption <- "household_power_consumption.txt"
Data <- read.table(File_household_power_consumption, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
Subset_data <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]


Global_Active_Power <- as.numeric(Subset_data$Global_active_power)
png("plot1.png", width=480, height=480)
hist(Global_Active_Power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()