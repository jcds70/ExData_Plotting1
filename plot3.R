# read all data from file
rawdata <- read.csv("household_power_consumption.txt", sep=";", header=TRUE,
                    na.strings="?")

# create an intermediate subset of data of the 2 relevant days
data <- subset(rawdata, rawdata$Date == "1/2/2007" | rawdata$Date == "2/2/2007")

# create a date/time column in data
data$dttm <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#Start PNG plot
png("plot3.png", width=480, height=480)

#set type="n" so line can be added to blank plot
plot(dttm, data$Sub_metering_1, type="n", 
     xlab="", ylab="Energy sub metering")

#add the three lines
lines(dttm, data$Sub_metering_1, col="black")
lines(dttm, data$Sub_metering_2, col="red")
lines(dttm, data$Sub_metering_3, col="blue")

#add the legend with colored lines
legend("topright", lwd=1, col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()