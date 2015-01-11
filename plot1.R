# read all data from file
rawdata <- read.csv("household_power_consumption.txt", sep=";", header=TRUE,
                 na.strings="?")

# create an intermediate subset of data of the 2 relevant days
data <- subset(rawdata, rawdata$Date == "1/2/2007" | rawdata$Date == "2/2/2007")

# create a date/time column in data
data$dttm <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#Start PNG plot
png("plot1.png", width=480, height=480)
hist(finaldata$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="darkorange")
dev.off()

