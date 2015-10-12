===
title: "Readme.MD for JH 'Exploratory Data Analysis Project 2'"
author: "Matthew Pemble"
output: html_document
===

# Readme.MD
============
## Course
This is the Readme file for the second course project
for the Johns Hopkins "Exploratory Data Analysis"
Coursera course.

Author: Matthew Pemble
Github: github.com/mwapemble
Course: exdata-033, 5 Oct 15

## Introduction
This Github repository contains the R scripts and output png files for the second course project for the Johns Hopkins University Coursera course, "Exploratory Data Analysis", which forms part of the Data Science specialisation.

## Data
The data used is the US Environmental Protection Agency data for Fine Particulate Matter pollution (PM[2.5]), for the years 1999, 2002, 2005 & 2008, split by US counties (using FIPS codes) and Source Classification Codes. 

The Source Classification Code database is also provided and is used the later plots to extract emissions caused either by coal or by vehicles.

###Description:
The EPA data contains the following for each observation:
<ul><li>fips: A five-digit number (represented as a string) indicating the U.S. county</li>
<li>SCC: The name of the source as indicated by a digit string (see source code classification table)</li>
<li>Pollutant: A string indicating the pollutant</li>
<li>Emissions: Amount of PM2.5 emitted, in tons (_assumed to be 'US short tons' as opposed to UK long tons or metric tonnes_)</li>
<li>type: The type of source (point, non-point, on-road, or non-road)</li>
<li>year: The year of emissions recorded</li></uk>

## Scripts
_Note that the third level headers aren't displaying reliably :(_

### Plot 1
This script 
<ol>
<li>initialises the variables,</li>
<li>downloads the data if this is required</li>
<li>extracts the NEI data</li>
<li>uses the aggregate function to generate an overall emissions sum by year</li>
<li>sets the display to the required PNG format</li>
<li>plots the emissions with points</li>
<li>and adds a linear regression line to highlight the trend.</li></ol>

### Plot 2
This script 
<ol>
<li>initialises the variables,</li>
<li>downloads the data if this is required</li>
<li>extracts the NEI data</li>
<li>subsets the NEI data on the fips code for Baltimore</li>
<li>uses the aggregate function to generate an overall emissions sum by year</li>
<li>sets the display to the required PNG format</li>
<li>plots the emissions with points only</li>
<li>and adds a linear regression line to highlight the trend.</li></ol>

### Plot 3
This script 
<ol>
<li>initialises the variables,</li>
<li>downloads the data if this is required</li>
<li>extracts the NEI data</li>
<li>subsets the NEI data on the fips code for Baltimore</li>
<li>uses the aggregate function to generate an overall emissions sum by type of emission and by year</li>
<li>sets the display to the required PNG format</li>
<li>plots each type using 'color="Type"' as a differentiator</li>
<li>and plotting with both points and a joining line to help to show trends.</li>
</ol>

### Plot 4
The "EI.Sector" column was used to search for SCC codes relevant to coal, as opposed to any of the SCC.Level descriptors, in order to include Lignite as a type of coal.
"Short Name" was considered but reject due to the significant variability in the naming structure.

This script:
<ol>
<li>initialises the variables,</li>
<li>uses the 'require' function to ensure the appropriate libraries are loaded</li>
<li>downloads the data if this is required</li>
<li>extracts the NEI and SCC data</li>
<li>creates list of the coal related SCC codes by searching within the EI.Sector string for each row</li>
<li>subsets the NEI data against the list</li>
<li>uses the aggregate function to generate an overall emissions sum by year</li>
<li>sets the display to the required PNG format</li>
<li>uses qplot (and print) to generate a simple point and line plot against year.</li></ol>

### Plot 5
The "SCC.Level.2" column was used to search for SCC codes relevant to Vehicles, as this seemed to be the most reliable on inspection of the SCC table in RStudio.

This script:
<ol>
<li>initialises the variables,</li>
<li>uses the 'require' function to ensure the appropriate libraries are loaded</li>
<li>downloads the data if this is required</li>
<li>extracts the NEI and SCC data</li>
<li>creates list of the vehicle related SCC codes by searching within the EI.Sector string for each row</li>
<li>subsets the NEI data against the list and the fips code for Baltimore</li>
<li>uses the aggregate function to generate an overall emissions sum by year</li>
<li>sets the display to the required PNG format</li>
<li>uses qplot (and print) to generate a simple point and line plot against year.</li></ol>

### Plot 6
This script:
<ol>
<li>initialises the variables,</li>
<li>uses the 'require' function to ensure the appropriate libraries are loaded</li>
<li>downloads the data if this is required</li>
<li>extracts the NEI and SCC data</li>
<li>creates list of the vehicle related SCC codes by searching within the EI.Sector string for each row</li>
<li>subsets the NEI data against the list and a vector containing the fips codes for Baltimore and LA</li>
<li>uses the aggregate function to generate an overall emissions sum by city and year</li>
<li>generates a normed differential for each city (because the data levels are so different, they are not readily comparable as totals</li>
<li>renames columns and the city labels</li>
<li>sets the display to the required PNG format</li>
<li>uses ggplot to generate a plot of the overall emissions, with cities differentiated by colour</li>
<li>uses ggplot to generate a plot of the normed differential emissions, with cities differentiated by colour</li>
<li>and uses grid.arrange from the gridExtra library to place the plots side by side.</li></ol>

## Results

### Plot 1
![Overall US Emissions](plot1.png) 

### Plot 2
![Total Emissions in Baltimore](plot2.png) 

### Plot 3
![Emissions in Baltimore, split by Type factor](plot3.png) 

### Plot 4
![Total US Emissions from Coal Sources](plot4.png)

### Plot 5
![Baltimore Emissions from Vehicles](plot5.png)

### Plot 6
![Comparative Balitmore and Los Angeles emissions from Vehicles](plot6.png)

## Acknowledgements
The "readRDS" code lines were lifted directly from the project specification.

As well as the lectures and swirl tutorial, guidance on the use of specific functions was gained from:
<ul>
<li>"R in Action", 2nd Ed, R Kabacoff</li>
<li>"Cookbook for R", [online version](http://www.cookbook-r.com), W Chang</li>
<li>RStudio.com, especially the "R Markdown Cheat Sheet"</li>
<li>and syntax examples from various stackoverflow.com threads (via the mechanism of Google).</li></ul>


