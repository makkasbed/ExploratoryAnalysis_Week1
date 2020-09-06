clean <- function()
{
  df <- read.table('household_power_consumption.txt',header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
  
  #cast the date to the date(day/month/year)
  df$Date <- as.Date(df$Date, "%d/%m/%Y")
  
  #get a subset of the two day period
  df <- subset(df,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
  
  #drop incomplete cases
  df <- df[complete.cases(df),]
  
  #Combine the date and time columns
  dt <- paste(df$Date, df$Time)
  
  #name the field
  dt <- setNames(dt, "DateTime")
  
  #Remove Date and Time column
  df <- df[ ,!(names(df) %in% c("Date","Time"))]
  
  #Add DateTime column
  df <- cbind(dt, df)
  
  ## Format dateTime Column
  df$dateTime <- as.POSIXct(dt)
  
  df
}