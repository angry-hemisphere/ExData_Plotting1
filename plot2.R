library(ggplot2)

dataFile <- "C:\Users\Aadi\Downloads\exdata_data_household_power_consumption\household_power_consumption.txt"

data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

subSetData$datetime <- as.POSIXct(paste(subSetData$Date, subSetData$Time), format="%d/%m/%Y %H:%M:%S")

ggplot(subSetData, aes(x = datetime, y = Global_active_power)) +
  geom_line(color = "blue") +
  labs(title = "Global Active Power", x = "", y = "Global Active Power (kilowatts)") +
  theme_minimal()

ggsave("plot2.png", width = 480, height = 480)
