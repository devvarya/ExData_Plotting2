#Read the files

NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

#Subset the data appropriately

subset <- NEI[NEI$fips == "24510", ] 

#Load ggplot2 package

library(ggplot2)

#Specify global graphics parameter(here: the margins for the plot)

par("mar"=c(5.1, 4.5, 4.1, 2.1))

#Launch the graphics device(file device:PNG)

png("plot3.png", width = 480, height = 480, units = "px")

#Build up the ggplot in layers

g <- ggplot(subset, aes(year, Emissions, color = type))

g + geom_line(stat = "summary", fun.y = "sum") +
    xlab("Year") +
    ylab(expression('Total PM'[2.5]*"Emissions")) + 
    ggtitle("Total Emissions in Baltimore City, Maryland from 1999 to 2008")

#Close the graphics device

dev.off()