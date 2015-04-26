
plot2 <- function() {
  setwd("d:/Coursera/Module04/CourseProject03/exdata_data_NEI_data")
  ##Read data
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  
  # Subset data  
  baltimore_NEI <- subset(NEI, NEI$fips == "24510")
  
  # plot2
  with(baltimore_NEI, {    
    png("plot2.png", width=480, height=480, units="px")
    
    y <- baltimore_NEI$Emissions
    x <- baltimore_NEI$year
    plot_data <- tapply(y, x, sum)
    barplot(plot_data, main = expression("Emissions of PM"[2.5] ~ " in Baltimore"), ylab = expression("Total PM"[2.5] ~ "emission (tons)"), xlab = "Year")
    lines(plot_data * 0.8, col = "green", lwd = 4)
    points(plot_data * 0.8, col = "green", lwd = 8)
    
    dev.off()
    
  })
  
}
