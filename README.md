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

## Data


###<b>Description</b>: 


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
<li>and uses ggplot to generate a plot of the normed differential emissions, with cities differentiated by colour</li></ol>

## Results

### Plot 1
![plot](plot1.png) 

### Plot 2
![plot](plot2.png) 

### Plot 3
![plot](plot3.png) 

### Plot 4
![plot](plot4.png)

### Plot 5
![plot](plot5.png)

### Plot 6
![plot](plot6.png)

## Acknowledgements
As well as the lectures and swirl tutorial, guidance on the use of specific functions was gained from:
<ul>
<li>"R in Action", 2nd Ed, R Kabacoff</li>
<li>"Cookbook for R", online version, W Chang</li>
<li>RStudio.com, especially the "R Markdown Cheat Sheet"</li>
<li>and syntax examples from various stackoverflow.com threads (via the mechanism of Google).</li></ul>


