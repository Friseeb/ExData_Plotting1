Zipfile <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(Zipfile, destfile = "./Zipfile.zip", method = "curl")
list.files("./")
unzip("./Zipfile.zip")
file.remove("./Zipfile.zip")
install.packages("readr","tidyverse","lubridate")
library(readr, tidyverse, lubridate)
dateDownloaded <- date()
dateDownloaded
consraw <- read_delim("./household_power_consumption.txt", delim = ";")
consraw$Date <- as.Date(consraw$Date, format = "%d/%m/%Y")
cons <- consraw %>%
        filter(Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
remove(consraw)
cons$weekday <- weekdays(cons$Date)
png(filename = "Rplot2.png",
    width = 480, height = 480, units = "px", pointsize = 12, bg = "grey")
plot(cons$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xaxt = "n", xlab = "")
axis(1, at = c(0, 1440, 2880), labels = (c("Thu","Fri","Sat")))
dev.off()

