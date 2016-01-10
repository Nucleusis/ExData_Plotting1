if (!file.exists("household_power_consumption.txt")){
  message("No data in the working directory")
} else {
    classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
    data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = classes, nrows = 2075259, comment.char = "")
    data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
    #Sys.setlocale("LC_TIME", "C")
    datetime <- strptime(with(data, paste(Date, Time)), format = "%d/%m/%Y %H:%M:%S")

    png("plot2.png", bg = "transparent")

    plot(datetime, data$Global_active_power, type = "l", xlab = "", ylab = "")
    title(ylab = "Global Active Power (kilowatts)")
    
    dev.off()
}