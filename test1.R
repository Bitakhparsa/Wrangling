library(readr)
setwd("data")
read_lines("test.txt",n_max=3)
read_table("test.txt")
rt1 <- read_csv("test.txt")
rt2 <- read_csv("test.txt", col_names = TRUE)

race_times <- read.csv("test.txt")
class(race_times$initials)
class(rt1$initials)