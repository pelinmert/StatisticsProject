#!/usr/bin/env Rscript

library(moments)

printf <- function(...) {
	print(sprintf(...))
}

fractile <- function(data_set, n) {
	name <- "Fractile"
	if (n ==   3) name <- "Tertile"
	if (n ==   4) name <- "Quartile"
	if (n ==   5) name <- "Quintile"
	if (n ==   6) name <- "Sextile"
	if (n ==   7) name <- "Septile"
	if (n ==   8) name <- "Octile"
	if (n ==  10) name <- "Decile"
	if (n ==  12) name <- "Duo-decile"
	if (n ==  16) name <- "Hexadecile"
	if (n ==  20) name <- "Ventile"
	if (n == 100) name <- "Percentile"
	for (i in 2:n-1) {
		printf("%s %s = %s", name, i, quantile(data_set, i * (1/n)))
	}
}

basic_descriptive <- function(data_set) {
	printf("Variance = %s", var(data_set))
	printf("Standard Deviation = %s", sd(data_set))
	range <- range(data_set)
	printf("Range = %s - %s", range[1], range[2])
	fractile(data_set, 4)
	fractile(data_set, 100)
	printf("Skewness = %s", skewness(data_set))
}

avocado_data <- read.csv("avocado.csv")

atlanta <- avocado_data[avocado_data[,"region"] == "Atlanta",]
atlanta_total <- atlanta[,"Total.Volume"]

printf("Variables :")
printf("Date         - Interval")
printf("AveragePrice - Interval")
printf("Total Volume - Interval")
printf("4046         - Interval")
printf("4225         - Interval")
printf("4770         - Interval")
printf("Total Bags   - Interval")
printf("Small Bags   - Interval")
printf("Large Bags   - Interval")
printf("XLarge Bags  - Interval")
printf("type         - Nominal")
printf("year         - Interval")
printf("region       - Nominal")

basic_descriptive(atlanta_total)
plot(atlanta_total, atlanta[,"AveragePrice"])
boxplot(atlanta_total)
