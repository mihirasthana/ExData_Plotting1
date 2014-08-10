fname <- "./data/household_power_consumption.txt"
fulldata <- read.table(fname,
                   header = TRUE,
                   sep = ";",
                   colClasses = c("character", "character", rep("numeric",7)),
                   na = "?")
dim(fulldata)
attach(fulldata)
filter <- Date == "1/2/2007" | Date == "2/2/2007"
filtered_data <- fulldata[filter, ]
attach(filtered_data)
temp <- paste(Date, Time)
filtered_data$DateTime <- strptime(temp, "%d/%m/%Y %H:%M:%S")
rownames(filtered_data) <- 1:nrow(filtered_data)
dim(filtered_data)
attach(filtered_data)