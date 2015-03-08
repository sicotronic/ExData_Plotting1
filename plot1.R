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
png("plot1.png", width=480, height=480)

hist(interest_data$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", 
     col="Red")

dev.off()