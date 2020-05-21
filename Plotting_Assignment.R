
# Variables used 
# Date: Date in format dd/mm/yyyy
# Time: time in format hh:mm:ss
# Global_active_power: household global minute-averaged active power (in kilowatt)
# Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
# Voltage: minute-averaged voltage (in volt)
# Global_intensity: household global minute-averaged current intensity (in ampere)
# Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
# Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
# Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.


# Setting up the Datafile
setwd("~/Documents/RTest/Plotting_Assignment_1")
downloadFile <- "./exdata_data_household_power_consumption.zip"
householdFile <- "./household_power_consumption.txt"

# Loading data 
plotData <- read.table(householdFile, header=T, sep=";", na.strings="?")
summary(plotData)
#    Date               Time         Global_active_power Global_reactive_power    Voltage      Global_intensity
# 1/1/2007 :   1440   17:24:00:   1442   Min.   : 0.076      Min.   :0.000         Min.   :223.2   Min.   : 0.200  
# 1/1/2008 :   1440   17:25:00:   1442   1st Qu.: 0.308      1st Qu.:0.048         1st Qu.:239.0   1st Qu.: 1.400  
# 1/1/2009 :   1440   17:26:00:   1442   Median : 0.602      Median :0.100         Median :241.0   Median : 2.600  
# 1/1/2010 :   1440   17:27:00:   1442   Mean   : 1.092      Mean   :0.124         Mean   :240.8   Mean   : 4.628  
# 1/10/2007:   1440   17:28:00:   1442   3rd Qu.: 1.528      3rd Qu.:0.194         3rd Qu.:242.9   3rd Qu.: 6.400  
# 1/10/2008:   1440   17:29:00:   1442   Max.   :11.122      Max.   :1.390         Max.   :254.2   Max.   :48.400  
# (Other)  :2066619   (Other) :2066607   NA's   :25979       NA's   :25979         NA's   :25979   NA's   :25979   
# Sub_metering_1   Sub_metering_2   Sub_metering_3  
# Min.   : 0.000   Min.   : 0.000   Min.   : 0.000  
# 1st Qu.: 0.000   1st Qu.: 0.000   1st Qu.: 0.000  
# Median : 0.000   Median : 0.000   Median : 1.000  
# Mean   : 1.122   Mean   : 1.299   Mean   : 6.458  
# 3rd Qu.: 0.000   3rd Qu.: 1.000   3rd Qu.:17.000  
# Max.   :88.000   Max.   :80.000   Max.   :31.000  
# NA's   :25979    NA's   :25979    NA's   :25979   

# set time variable
finalData <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(SetTime, finalData)

# Generating Plot 1 : histogram
hist(finalData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")


# Generating Plot 2 : Time Series Plot 
plot(finalData$SetTime, finalData$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")


# Generating Plot 3 : Sub metring 
columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(finalData$SetTime, finalData$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(finalData$SetTime, finalData$Sub_metering_2, col=columnlines[2])
lines(finalData$SetTime, finalData$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")


# Generating Plot 4 : Multiple plots
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
par(mfrow=c(2,2))
plot(finalData$SetTime, finalData$Global_active_power, type="l", col="green", xlab="", ylab="Global Active Power")
plot(finalData$SetTime, finalData$Voltage, type="l", col="orange", xlab="datetime", ylab="Voltage")
plot(finalData$SetTime, finalData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(finalData$SetTime, finalData$Sub_metering_2, type="l", col="red")
lines(finalData$SetTime, finalData$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(finalData$SetTime, finalData$Global_reactive_power, type="l", col="blue", xlab="datetime", ylab="Global_reactive_power")

