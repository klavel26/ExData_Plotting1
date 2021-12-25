
## Set wd
setwd("/Users/Kevin/Documents/Coursera WOrk/Exploratory Data Analysis")

## Read Data
elec_data <- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?", comment.char = "")

## Take only needed dates
elec_df <- data.frame(subset(elec_data, Date %in% c("1/2/2007", "2/2/2007")))

## Format dates
elec_df$Date <- as.Date(elec_df$Date, format = "%d/%m/%Y")

## More date formatting for graph output
elec_df$DateTime <- as.POSIXct(paste(elec_df$Date, elec_df$Time))

## Third Plot
## Essentially Second Plot but with Sub metering
with(elec_df, {	
	plot(Sub_metering_1~DateTime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
	lines(Sub_metering_2~DateTime,col='Red')
	lines(Sub_metering_3~DateTime,col='Blue')	
	legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
	})
	
## PNG saving
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()



