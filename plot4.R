## plot4.R
## Fourth of 6 R Scripts for the second course project
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
NEI <- readRDS(paste(".",data.directory,datafile.1, sep="/"))
SCC <- readRDS(paste(".",data.directory,datafile.2, sep="/"))

## Derive the list of coal related emissions
## "EI.Sector" chosen rather than "SCC.Level.3" to include Lignite.
coal_boolean <- stri_detect_fixed(SCC$EI.Sector,"Coal")
coal_scc <- SCC$SCC[coal_boolean]

## Subset NEI to extract just the coal related emissions
coal_nei <- NEI[NEI$SCC %in% coal_scc,]

## Calculate the year totals
em_sum <- aggregate(coal_nei$Emissions, by=list(coal_nei$year), FUN=sum)
names(em_sum)<-c("Year","Total_Emissions")

## Change display to png
png(filename="plot4.png", width=pngsize, height=pngsize)

## Simple plot with labels
with(em_sum,print(qplot(Year, Total_Emissions, geom=c("point","line"), main="Total US Emissions from Coal", ylab="PM2.5 (tons)")))

## Close display
dev.off()
