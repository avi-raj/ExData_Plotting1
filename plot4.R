## First read the input file
## Requires the file household_power_consumption.txt in the working directory

sourceFile <- "./household_power_consumption.txt"
sourceData <- read.table(sourceFile,
                   header = TRUE,
                   sep = ";",
                   colClasses = c("character", "character", rep("numeric",7)),
                   na = "?")  # Read the date & time as character, set na= "?"

## Subset only the data used for the project.
finalData <- sourceData[sourceData$Date %in% c("1/2/2007","2/2/2007"), ]
finalData$DateTime <- strptime(paste(finalData$Date,finalData$Time), "%d/%m/%Y %H:%M:%S")

## Create plot4.png in working directory
png(filename = "plot4.png",
    width = 480, height = 480,
    units = "px", bg = "transparent")
par(mfrow = c(2, 2)) # Fills rows first from left to right

## Top Left (Quadrant 1)
plot(finalData$DateTime, finalData$Global_active_power,
     type = "l",
     xlab = "", ylab = "Global Active Power")
## Top Right (Quadrant 2)
plot(finalData$DateTime, finalData$Voltage,
     type = "l",
     xlab = "datetime", ylab = "Voltage")
## Bottom Left (Quadrant 3)
plot(finalData$DateTime, finalData$Sub_metering_1,
     type = "l",
     col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(finalData$DateTime, finalData$Sub_metering_2, col = "red")
lines(finalData$DateTime, finalData$Sub_metering_3, col = "blue")

legend("topright",
       bty = "n",
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)

## Bottom Right (Quadrant 4)
plot(finalData$DateTime, finalData$Global_reactive_power,
     type = "l",
     col = "black",
     xlab = "datetime", ylab = "Global_reactive_power")
dev.off()

# Please note: 
# 1.The plot background is set to be transparent to match the instructor's plots 
#   https://github.com/rdpeng/ExData_Plotting1/tree/master/figure

# 2.The file household_power_consumption.txt is required in the working directory