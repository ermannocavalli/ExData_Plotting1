plot3 <- function() {
        library(lubridate)
        library(dplyr)
        
        ## we are interested only in data from 1/2/2007 to 2/2/2007
        ## therefore we can skip the first 66637 rows
        ## (file measurement is from 16/12/2006 17:24:00)
        data <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrow = 2880, col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        ## we add a new column with merge of data and time,
        ## relative to 1/2/2007 00:00:00
        newdata <- mutate(data, timescale = (as.numeric(Date) - 1) * 1440 + as.numeric(Time))
        
        png("Plot3.png")
        
        ## we start with plotting Sub_metering_1
        with(newdata, plot(timescale, Sub_metering_1, type = "l", xaxt = "n", xlab = "", yaxt = "n", ylab = "Energy sub metering"))
        
        ## we add Sub_metering_2
        with(newdata, lines(timescale, Sub_metering_2, type = "l", col = "red"))
        
        ## we add Sub_metering_3
        with(newdata, lines(timescale, Sub_metering_3, type = "l", col = "blue"))
        
        ## we add both axis
        axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
        axis(2, at = c(0, 10, 20, 30))
        
        ## we add legend
        legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        dev.off()
        ##with(data, plot((as.numeric(Date) - 1) * 1440 + as.numeric(Time), Global_active_power, type = "l"))
}