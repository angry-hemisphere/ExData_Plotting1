library(ggplot2)

dataFile <- "C:\Users\Aadi\Downloads\exdata_data_household_power_consumption\household_power_consumption.txt"

data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

subSetData$datetime <- as.POSIXct(paste(subSetData$Date, subSetData$Time), format="%d/%m/%Y %H:%M:%S")

ggplot(subSetData, aes(x = datetime)) +
  geom_line(aes(y = Sub_metering_1, color = "Sub_metering_1")) +
  geom_line(aes(y = Sub_metering_2, color = "Sub_metering_2")) +
  geom_line(aes(y = Sub_metering_3, color = "Sub_metering_3")) +
  labs(title = "Energy Submetering", x = "", y = "Energy Submetering") +
  scale_color_manual(values = c("black", "red", "blue"), 
                     labels = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) +
  theme_minimal()

ggsave("plot3.png", width = 480, height = 480)
