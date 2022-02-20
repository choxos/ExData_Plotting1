# R Codes for making plot2.png for Coursera's Exploratory Data Analysis Course, Peer-graded Assignment: Course Project 1


# First, loading the dataset
data <- subset(read.table(unz("exdata_data_household_power_consumption.zip",
                              "household_power_consumption.txt"),
                          sep = ";",
                          header = T),
               Date == "1/2/2007" | Date == "2/2/2007")


# Creating a new column for data and time together
data$DateAndTime <- as.POSIXct(paste(data$Date, data$Time), 
                               format = "%d/%m/%Y %H:%M:%S")


# Creating plot2
plot(x=data$DateAndTime, 
     y = data$Global_active_power, 
     type = "S",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

# Saving it as png
dev.copy(png, 
         "plot2.png",
         width = 480, 
         height = 480, 
         units = "px")
dev.off()
