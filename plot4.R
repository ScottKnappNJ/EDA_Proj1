## reading in the data; 
## sub-setting the data, 
## converting & combining dates & time formats

file_name <- "household_power_consumption.txt"

power <- read.table(file_name, sep =";", 
                    na.strings = "?", 
                    stringsAsFactors = FALSE, 
                    header = TRUE)

data <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

## creating Plot4 and saving to png file

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

## plot #1
with(data, 
     plot(DateTime, 
          Global_active_power, 
          type = "l", 
          xlab = "", 
          ylab = "Global Active Power"))

## plot #2
with (data, 
      plot(DateTime, 
           Voltage, 
           type = "l", 
           xlab = "datetime", 
           ylab = "Voltage"))

## plot #3
with(data, 
     plot(DateTime, 
                Sub_metering_1, 
                type = "l", 
                xlab = "", 
                ylab = "Energy sub metering"))
with(data, 
     points(DateTime, 
                  Sub_metering_2, 
                  type = "l", 
                  col = "red"))
with(data, 
     points(DateTime, 
                  Sub_metering_3, 
                  type = "l", 
                  col = "blue"))
legend("topright", 
       col = c("black", "red", "blue"),  
       lty = 1, 
       lwd = 1, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       cex = 0.75, 
       bty = "n")

## plot #4
with(data, 
     plot(DateTime, 
          Global_reactive_power, 
          type = "l", 
          lwd = 1,
          xlab = "datetime"))

dev.off()