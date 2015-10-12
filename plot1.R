## plot1.R
## First of 6 R Scripts for the second course project
## for the Johns Hopkins "Exploratory Data Analysis"
## Coursera course.
##
## Author: Matthew Pemble
## Github: gothub.com/mwapemble
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
## SCC not needed for this plot
## SCC <- readRDS(paste(".",data.directory,"Source_Classification_Code.rds", sep="/"))

## Generate the total emissions sum by year
em_sum <- aggregate(NEI$Emissions, by=list(Category=NEI$year), FUN=sum)
names(em_sum)<-c("Year","Total_Emissions")

## Change display to png
png(filename="plot1.png", width=pngsize, height=pngsize)

## Simple plot
with(em_sum, {
  ## Convert from tons to megatons for clarity
  Total_Emissions <- Total_Emissions / 1000000
  plot(Year,Total_Emissions,main="Total Emissions by Year",ylab="Megatons PM2.5")
  abline(lm(Total_Emissions ~ Year),col="red")
})

## Close display
dev.off()
