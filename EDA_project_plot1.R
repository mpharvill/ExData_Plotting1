##plot 1
library(data.table)

power_data <- data.table::fread(input = "household_power_consumption.txt"
                                , na.strings="?")
names(power_data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                       "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

power_data <- subset(power_data,power_data$Date=="1/2/2007" | power_data$Date =="2/2/2007")


png("plot1.png", width = 480, height = 480)

hist(power_data$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red",
     main = "Global Active Power")

dev.off()