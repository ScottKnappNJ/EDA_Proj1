## reading in the data; 
## subsetting the data

file_name <- "household_power_consumption.txt"

power <- read.table(file_name, sep =";", na.strings = "?", 
                    stringsAsFactors = FALSE, header = TRUE)
data <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")

## Creating Plot1 and saving to PNG

png("plot1.png", width = 480, height = 480)

with(data, hist(Global_active_power, col = "red", xlab = "Global Active Power 
     (kilowatts)", ylab = "Frequency", main = "Global Active Power"))

dev.off()
