## Reads datafile from working directory 
energydf <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE);

## Converts & pastes character Date & Time columns to new POSIXct column DateTime 
energydf$DateTime <- as.POSIXct(paste(energydf$Date, energydf$Time), format = "%d/%m/%Y %H:%M:%S");

## Subsets to only the dates needed -- Feb 1 & 2, 2007
energydf <- subset(energydf, format(DateTime, '%Y-%m-%d') > "2007-01-31" & format(DateTime, '%Y-%m-%d') < "2007-02-03");

## Converts column 3 "Global Active Power" from character to numeric
energydf[,3] <- as.numeric(energydf[,3]);

##Open PNG Graphic Device
png(filename = "plot2.png", width = 480, height = 480);

## Generates plot
plot(energydf$DateTime, energydf$Global_active_power, type="l", xlab="", ylab = "Global Active Power (kilowatts)");

## closes graphic device
dev.off();