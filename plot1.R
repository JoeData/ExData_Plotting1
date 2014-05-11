## Reads datafile from working directory 
energydf <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE);

## Converts character date column to standard date format 
energydf[,1] <- as.Date(energydf[,1], format = '%d/%m/%Y');

## Subsets to only the dates needed -- Feb 1 & 2, 2007
energydf <- subset(energydf, Date > as.Date("2007-01-31") & Date < as.Date("2007-02-03"));

## Converts column 3 "Global Active Power" from character to numeric
energydf[,3] <- as.numeric(energydf[,3]);

##Open PNG Graphic Device
png(filename = "plot1.png", width = 480, height = 480)

## Generates histogram plot
hist(energydf$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power");

## closes graphic device
dev.off()