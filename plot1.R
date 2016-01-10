if (!file.exists("household_power_consumption.txt")){
  message("No data in the working directory")
} else {
    classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
    data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = classes, nrows = 2075259, comment.char = "")
    data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
    
    png("plot1.png", bg = "transparent")
    hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
    dev.off()
}
