# R Codes for making plot1.png for Coursera's Exploratory Data Analysis Course, Peer-graded Assignment: Course Project 1


# First, loading the dataset
data <- subset(read.table(unz("exdata_data_household_power_consumption.zip",
                       "household_power_consumption.txt"),
                   sep = ";",
                   header = T),
               Date == "1/2/2007" | Date == "2/2/2007")


# Converting Global_active_power column to numeric class

data$Global_active_power <- as.numeric(data$Global_active_power)

# Creating plot1
hist(data$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     col = "red")


# Saving it as png
dev.copy(png, 
         "plot1.png",
         width = 480, 
         height = 480, 
         units = "px")
dev.off()
