# download the data file and load it into memory 

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
              cacheOK=TRUE, destfile="household_power_consumption.zip")
unzip(zipfile = "household_power_consumption.zip")
data <- read.csv("household_power_consumption.txt", 
                 header=TRUE, sep=";", 
                 na.strings="?")

# subset the interesting data (1 Feb 2007 until 2 Feb 2007) and free the rest
interest_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
rm(data)

# make the plot and save into the specified png file
datetime_string <- strptime(paste(interest_data$Date, interest_data$Time, sep=" "),
                            "%d/%m/%Y %H:%M:%S") 
active_power <- as.numeric(interest_data$Global_active_power)
type1 <- as.numeric(interest_data$Sub_metering_1)
type2 <- as.numeric(interest_data$Sub_metering_2)
type3 <- as.numeric(interest_data$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime_string, type1, 
     type="l", 
     xlab="", 
     ylab="Energy Submetering")
lines(datetime_string, type2, 
     type="l", 
     xlab="", 
     col="red")
lines(datetime_string, type3, 
     type="l", 
     xlab="", 
     col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()