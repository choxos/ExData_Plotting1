# R Codes for making plot3.png for Coursera's Exploratory Data Analysis Course, Peer-graded Assignment: Course Project 1


# First, loading the dataset
data <- subset(read.table(unz("exdata_data_household_power_consumption.zip",
                              "household_power_consumption.txt"),
                          sep = ";",
                          header = T),
               Date == "1/2/2007" | Date == "2/2/2007")


# Creating a new column for data and time together
data$DateAndTime <- as.POSIXct(paste(data$Date, data$Time), 
                               format = "%d/%m/%Y %H:%M:%S")


# Creating plot3

plot(x=data$DateAndTime, 
     y = data$Sub_metering_1, 
     type = "S",
     xlab = "",
     ylab = "Energy sub metering")

lines(x=data$DateAndTime,
      y = data$Sub_metering_2, 
      type = "S",
      col = "red")

lines(x=data$DateAndTime,
      y = data$Sub_metering_3, 
      type = "S",
      col = "blue")

legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1, 1, 1),
       col = c("black", "red", "blue"),
       y.intersp=0.3,
       bty = "n")


# Saving it as png
dev.copy(png, 
         "plot3.png",
         width = 480, 
         height = 480, 
         units = "px")
dev.off()
