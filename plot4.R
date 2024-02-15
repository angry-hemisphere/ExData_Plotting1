library(ggplot2)

dataFile <- "C:\Users\Aadi\Downloads\exdata_data_household_power_consumption\household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

subSetData$datetime <- as.POSIXct(paste(subSetData$Date, subSetData$Time), format="%d/%m/%Y %H:%M:%S")

ggplot(subSetData, aes(x = datetime)) +
  geom_line(aes(y = Global_active_power), linetype = "solid", size = 0.5) +
  geom_line(aes(y = Voltage), linetype = "solid", size = 0.5) +
  geom_line(aes(y = Sub_metering_1), linetype = "solid", size = 0.5) +
  geom_line(aes(y = Sub_metering_2), linetype = "dashed", color = "red", size = 0.5) +
  geom_line(aes(y = Sub_metering_3), linetype = "dashed", color = "blue", size = 0.5) +
  geom_line(aes(y = Global_reactive_power), linetype = "solid", size = 0.5) +
  labs(title = "Power Consumption", x = "", y = "") +
  scale_linetype_manual(values = c("solid", "solid", "solid", "dashed", "dashed", "solid")) +
  scale_color_manual(values = c("black", "black", "black", "red", "blue", "black")) +
  theme_minimal() +
  facet_wrap(~variable, scales = "free_y", ncol = 1)

ggsave("plot4.png", width = 480, height = 480)

