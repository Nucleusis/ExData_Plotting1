if (!file.exists("household_power_consumption.txt")){
  message("No data in the working directory")
} else {
    classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
    data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = classes, nrows = 2075259, comment.char = "")
    data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
    #Sys.setlocale("LC_TIME", "C")
    datetime <- strptime(with(data, paste(Date, Time)), format = "%d/%m/%Y %H:%M:%S")
    
    png("plot3.png", bg = "transparent")
    
    plot(datetime, data$Sub_metering_1, type = "n", xlab = "", ylab = "")
    points(datetime, data$Sub_metering_1, type = "l", col = "black")
    points(datetime, data$Sub_metering_2, type = "l", col = "red")
    points(datetime, data$Sub_metering_3, type = "l", col = "blue")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1, 1, 1), col = c("black", "red", "blue"))
    title(ylab = "Energy sub metering")
    
    dev.off()
}