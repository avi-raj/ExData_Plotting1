## First read the input file 
## This requires the file household_power_consumption.txt in the working directory

sourceFile <- "./household_power_consumption.txt"
sourceData <- read.table(sourceFile,
                   header = TRUE,
                   sep = ";",
                   colClasses = c("character", "character", rep("numeric",7)),
                   na = "?")  # Read the date & time as character, set na= "?"

## Subset only the data used for the project.
finalData <- sourceData[sourceData$Date %in% c("1/2/2007","2/2/2007"), ]
finalData$DateTime <- strptime(paste(finalData$Date,finalData$Time), "%d/%m/%Y %H:%M:%S")

## Create plot3.png in working directory
png(filename = "plot3.png",
    width = 480, height = 480,
    units = "px", bg = "transparent")
plot(finalData$DateTime, finalData$Sub_metering_1,
     type = "l",
     col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(finalData$DateTime, finalData$Sub_metering_2, col = "red")
lines(finalData$DateTime, finalData$Sub_metering_3, col = "blue")
legend("topright",
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)
dev.off()

# Please note: 
# 1.The plot background is set to be transparent to match the instructor's plots 
#   https://github.com/rdpeng/ExData_Plotting1/tree/master/figure

# 2.The file household_power_consumption.txt is required in the working directory