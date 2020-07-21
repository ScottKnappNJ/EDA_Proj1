## reading in the data; 
## sub-setting the data, 
## converting & combining dates & time formats

file_name <- "household_power_consumption.txt"

power <- read.table(file_name, sep =";", na.strings = "?", 
                    stringsAsFactors = FALSE, header = TRUE)
data <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

## creating Plot2 and saving to png file

png("plot2.png", width = 480, height = 480)

with(data, plot(DateTime, Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)"))

dev.off()