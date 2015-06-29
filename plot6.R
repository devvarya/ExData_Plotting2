#Read the files

NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

#Subset the data appropriately

subset <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

#Load ggplot2 package

library(ggplot2)

#Specify global graphics parameter(here: the margins for the plot)

par("mar"=c(5.1, 4.5, 4.1, 2.1))

#Launch the graphics device(file device:PNG)

png("plot6.png", width = 480, height = 480, units = "px")

#Build up the ggplot in layers

g <- ggplot(subset, aes(year, Emissions, color = fips))

g + geom_line(stat = "summary", fun.y = "sum") +
    xlab("Year") +
    ylab(expression('Total PM'[2.5]*"Emissions")) + 
    ggtitle("Comparison of Total Emissions from Motor\n Vehicle sources in Baltimore City\n and Los Angeles County from 1999 to 2008") +
    scale_colour_discrete(name = "County", label = c("LA California","Baltimore"))

#Close the graphics device

dev.off()