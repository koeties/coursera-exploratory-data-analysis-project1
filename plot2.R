#Read in our source data
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings="?")
#Only use data for our 2 months
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Get and format the date and time values from the dataset
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#Convert our values to numeric for use in plot
globalActivePower <- as.numeric(subSetData$Global_active_power)

#Draw the plot to the PNG device
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Close off the PNG device to save the plot to file
dev.off()