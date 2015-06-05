plot1 <- function() {
        png("Plot1.png")
        
        ## we are interested only in data from 1/2/2007 to 2/2/2007
        ## therefore we can skip the first 66637 rows
        ## (file measurement is from 16/12/2006 17:24:00)
        data <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrow = 2880, col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        ## we plot the histogram without y axis and we will
        ## plot it later with different breaks
        hist(as.numeric(data$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", yaxt = "n")        
        ## we now add y axis
        axis(2, at = c(0, 200, 400, 600, 800, 1000, 1200))
        dev.off()
}