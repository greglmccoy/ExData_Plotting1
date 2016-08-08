## Download file to local repository
if(!file.exists("exdata-data-household_power_consumption.zip")) {
        temp <- tempfile()
        download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
        file <- unzip(temp)
        unlink(temp)
}
## Read data into R and prepare for analysis
power <- read.table(file, header=T, sep=";")
## Set date format to dd/mm/yy
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
## Filter only dates between 01/02/07 and 02/02/07
df <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
## Set data to numeric vectors
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
df$Voltage <- as.numeric(as.character(df$Voltage))
# Set Date and Time format
df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))