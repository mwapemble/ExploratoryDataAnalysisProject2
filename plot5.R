## plot5.R
## Fifth of 6 R Scripts for the second course project
## for the Johns Hopkins "Exploratory Data Analysis"
## Coursera course.
##
## Author: Matthew Pemble
## Github: github.com/mwapemble
## Course: exdata-033, 5 Oct 15

## Readme file with more detailed comments and Acknowledgements
## https://github.com/mwapemble/ExploratoryDataAnalysisProject2/blob/master/README.md

## First, initialise variables 

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
data.directory <- "data"
zipfile <- "FNEI_data.zip"
datafile.1 <- "summarySCC_PM25.rds"
datafile.2 <- "Source_Classification_Code.rds"
baltimore = 24510
pngsize=480

## Libraries
require(ggplot2)
require(stringi)
require(dplyr)

## Then, load the file

## Check to see if there is a data directory
## If not, create it.
if (!file.exists(data.directory)) {
  dir.create(data.directory)
}

## Fetch file if not already downloaded
tempname <- paste(".", data.directory, zipfile, sep="/")
if (!file.exists(tempname)) 
{
  ## Running on Mac / OSX & target is https, therefore "libcurl" method is required.
  download.file(fileUrl, destfile = tempname, method = "libcurl")
  dateDownloaded.zip <- date()
}

## Extract files from zip archive
datafile <- paste(".", data.directory, datafile.1, sep="/")
if (!file.exists(datafile))
{
  unzip(tempname, exdir = data.directory)
}

## Then extract & subset to get the relevant data
NEI <- readRDS(paste(".",data.directory,"summarySCC_PM25.rds", sep="/"))
SCC <- readRDS(paste(".",data.directory,"Source_Classification_Code.rds", sep="/"))

## Derive the list of vehicle related emissions
vehicle_boolean <- stri_detect_fixed(SCC$SCC.Level.Two,"Vehicles")
vehicle_scc <- SCC$SCC[vehicle_boolean]

## Subset NEI to extract just the vehicle related emissions in baltimore
vehicle_nei <- subset(NEI, ((NEI$fips==baltimore) & (NEI$SCC %in% vehicle_scc)))

## Calculate the year totals
em_sum <- aggregate(vehicle_nei$Emissions, by=list(vehicle_nei$year), FUN=sum)
names(em_sum)<-c("Year","Total_Emissions")

## Change display to png
png(filename="plot5.png", width=pngsize, height=pngsize)

## Simple plot with labels
with(em_sum,print(qplot(Year, Total_Emissions, geom=c("point","line"), main="Baltimore Emissions from Vehicles", ylab="PM2.5 (tons)")))

## Close display
dev.off()