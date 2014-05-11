## Reads datafile from working directory 
energydf <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE);

## Converts & pastes character Date & Time columns to new POSIXct column DateTime 
energydf$DateTime <- as.POSIXct(paste(energydf$Date, energydf$Time), format = "%d/%m/%Y %H:%M:%S");

## Subsets to only the dates needed -- Feb 1 & 2, 2007
energydf <- subset(energydf, format(DateTime, '%Y-%m-%d') > "2007-01-31" & format(DateTime, '%Y-%m-%d') < "2007-02-03");

## Converts columns 3-9 from character to numeric
for (i in 3:9) {
  energydf[,i] <- as.numeric(energydf[,i])
};

##Open PNG Graphic Device
png(filename = "plot4.png", width = 480, height = 480)

## Generates plot
par(mfrow = c(2,2))
with(energydf, {
  
  ## 1st plot
  plot(DateTime, Global_active_power, type="l", xlab="", ylab = "Global Active Power");
  
  ## 2nd plot
  plot(energydf$DateTime, energydf$Voltage, type="l", xlab="datetime", ylab = "Voltage");
  
  ## 3rd plot
  plot(energydf$DateTime, Sub_metering_1, type="l", xlab="", ylab = "Energy sub metering");
  with(energydf, points(DateTime, Sub_metering_2, col = "red", type = "l"));
  with(energydf, points(DateTime, Sub_metering_3, col = "blue", type = "l"));
  
  ## add legend to 3rd plot
  legend("topright", pch = "_", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n");
  
  ## 4th plot
  plot(energydf$DateTime, energydf$Global_reactive_power, type="l", xlab="datetime", ylab = "Global_reactive_power");
})


## closes graphic device
dev.off()