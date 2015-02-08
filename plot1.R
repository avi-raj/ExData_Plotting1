## First read the input file 
## This requires the file household_power_consumption.txt in the working directory

sourceFile <- "./household_power_consumption.txt"
sourceData <- read.table(sourceFile,
                   header = TRUE,
                   sep = ";",
                   colClasses = c("character", "character", rep("numeric",7)),
                   na = "?")  # Read the date & time as character, set na= "?"

## Subset only the data used for this project 
finalData <- sourceData[sourceData$Date %in% c("1/2/2007","2/2/2007"), ]
finalData$DateTime <- strptime(paste(finalData$Date,finalData$Time), "%d/%m/%Y %H:%M:%S")

## Create plot1.png in the working directory
png(filename = "plot1.png",
    width = 480, height = 480,
    units = "px", bg = "transparent")
hist(finalData$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     breaks = 12, ylim = c(0, 1200))
dev.off()

# Please note: 
# 1.The plot background is set to be transparent to match the instructor's plots 
#   https://github.com/rdpeng/ExData_Plotting1/tree/master/figure

# 2.The file household_power_consumption.txt is required in the working directory
