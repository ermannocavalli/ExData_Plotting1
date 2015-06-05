plot2 <- function() {
        library(lubridate)
        library(dplyr)
        png("Plot2.png")
        
        ## we are interested only in data from 1/2/2007 to 2/2/2007
        ## therefore we can skip the first 66637 rows
        ## (file measurement is from 16/12/2006 17:24:00)
        data <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrow = 2880, col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        ## we add a new column with merge of data and time,
        ## relative to 1/2/2007 00:00:00
        newdata <- mutate(data, timescale = (as.numeric(Date) - 1) * 1440 + as.numeric(Time))
        
        ## we plot without both axis and we will add them later
        with(newdata, plot(timescale, Global_active_power, type = "l", xaxt = "n", xlab = "", yaxt = "n", ylab = "Global Active Power (kilowatts)"))
        axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
        axis(2, at = c(0, 2, 4,6))
        dev.off()
        ##with(data, plot((as.numeric(Date) - 1) * 1440 + as.numeric(Time), Global_active_power, type = "l"))
}