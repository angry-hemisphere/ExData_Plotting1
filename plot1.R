dataFile <- "C:\Users\Aadi\Downloads\exdata_data_household_power_consumption\household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

ggplot(subSetData, aes(x = Global_active_power)) +
  geom_histogram(fill = "red", binwidth = 1) +
  labs(title = "Global Active Power", x = "Global Active Power (kilowatts)", y = "Frequency") +
  theme_minimal()

ggsave("plot1.png", width = 480, height = 480)
