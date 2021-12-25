
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

## Second Plot
with(elec_df, {	plot(Global_active_power~DateTime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")	})

## PNG saving
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
