# R Codes for making plot4.png for Coursera's Exploratory Data Analysis Course, Peer-graded Assignment: Course Project 1


# First, loading the dataset
data <- subset(read.table(unz("exdata_data_household_power_consumption.zip",
                              "household_power_consumption.txt"),
                          sep = ";",
                          header = T),
               Date == "1/2/2007" | Date == "2/2/2007")


# Creating a new column for data and time together
data$DateAndTime <- as.POSIXct(paste(data$Date, data$Time), 
                               format = "%d/%m/%Y %H:%M:%S")


# Creating plot4
par(mfcol = c(2, 2))
par(mar=c(4, 4, 3, 4))

# First plot
plot(x=data$DateAndTime, 
     y = data$Global_active_power, 
     type = "S",
     xlab = "",
     ylab = "Global Active Power")

# Second plot
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
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1,
       col = c("black", "red", "blue"),
       y.intersp=0.1,
       bty = "n",
       cex = 0.82)

# Third plot
plot(x=data$DateAndTime, 
     y = data$Voltage, 
     type = "S",
     xlab = "datetime",
     ylab = "Voltage")

# Fourth plot
plot(x=data$DateAndTime, 
     y = data$Global_reactive_power, 
     type = "S",
     xlab = "datetime",
     ylab = "Global_reactive_power")


# Saving it as png
dev.copy(png, 
         "plot4.png",
         width = 480, 
         height = 480, 
         units = "px")
dev.off()
