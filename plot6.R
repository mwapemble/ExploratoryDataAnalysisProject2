## plot6.R
## Last of 6 R Scripts for the second course project
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
cities = c("24510", "06037")
pngsize=480

## Libraries
require(ggplot2)
require(stringi)
require(dplyr)
require(gridExtra)

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
vehicle_nei <- subset(NEI, ((NEI$fips %in% cities) & (NEI$SCC %in% vehicle_scc)))

## Calculate the year totals
em_sum <- aggregate(vehicle_nei$Emissions, by=list(vehicle_nei$year, vehicle_nei$fips), FUN=sum)
names(em_sum)<-c("Year","City", "Total_Emissions")

## Create a new column. Populate with a normed value for the emissions change
em_sum[1:8,"Change_in_Emissions"] <- 0
em_sum[1:4,"Change_in_Emissions"] <- ((em_sum$Total_Emissions[1:4]) - em_sum[1,"Total_Emissions"])/em_sum[1,"Total_Emissions"]
em_sum[5:8,"Change_in_Emissions"] <- ((em_sum$Total_Emissions[5:8]) - em_sum[5,"Total_Emissions"])/em_sum[5,"Total_Emissions"]

## Rreplace fips with city names

em_sum$City[em_sum$City == cities[1]] <- "Baltimore"
em_sum$City[em_sum$City == cities[2]] <- "Los Angeles"


## Change display to png
png(filename="plot6.png", width=2 * pngsize, height=pngsize)

## Two plots - one with absolute values (noting scale issues), one with normalised changes from 1999 to better show changes
plot6a <- ggplot(em_sum, aes(Year, Total_Emissions))
plot6a <- plot6a + geom_point(aes(color=City)) + geom_line(aes(color=City)) + labs(title="Total Emissions from Vehicles",y="PM2.5 (tons)")
plot6b <- ggplot(em_sum, aes(Year, Change_in_Emissions))
plot6b <- plot6b + geom_point(aes(color=City)) + geom_line(aes(color=City)) + labs(title="Change in Emissions from Vehicles",y="PM2.5 (norm to 1999)")

grid.arrange(plot6a,plot6b,ncol=2)

## Close display
dev.off()