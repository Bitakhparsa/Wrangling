library(rvest)
library(tidyverse)
library(stringr)
library(dplyr)

url <- "https://en.wikipedia.org/w/index.php?title=Opinion_polling_for_the_United_Kingdom_European_Union_membership_referendum&oldid=896735054"
tab <- read_html(url) %>% html_nodes("table")
polls <- tab[[5]] %>% html_table(fill = TRUE)

#mine only keeping rows that have a percent sign (%) in the remain column

col_names <- c("dates", "remain", "leave", "undecided", "lead", "samplesize", "pollster", "poll_type", "notes")
pnew <- polls %>% set_names(col_names)
sum(str_detect(pnew$remain,"%"))

#tdx only keeping rows that have a percent sign (%) in the remain column
names(polls) <- c("dates", "remain", "leave", "undecided", "lead", "samplesize", "pollster", "poll_type", "notes")
polls <- polls[str_detect(polls$remain, "%"),-9]
nrow(polls)

#converts the remain vector to a proportion between 0 and 1 both correct

as.numeric(str_replace(polls$remain, "%", ""))/100
parse_number(polls$remain)/100

 #extract the end day and month from dates
pat<- "\\d+\\s[a-zA-Z]{3,5}"
temp <- str_extract_all(polls$dates, pat)
end_date <- sapply(temp, function(x) x[length(x)]) # take last element (handles polls that cross month boundaries)

# All of them works

"\\d+\\s[a-zA-Z]+"
"[0-9]+\\s[a-zA-Z]+"
"\\d{1,2}\\s[a-zA-Z]+"
"\\d+\\s[a-zA-Z]{3,5}"