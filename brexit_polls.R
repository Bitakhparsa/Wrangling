library(dslabs)
library(lubridate)
data(brexit_polls)
brexit_polls_a <- brexit_polls %>% mutate(month=month(startdate)) %>% filter(month=="4")

x<- brexit_polls$enddate
brexit_polls %>% mutate(end = round_date(x,unit="week")) %>% filter(end=="2016-06-12")

sum(round_date(brexit_polls$enddate, unit = "week") == "2016-06-12")




n_brexit_polls <- brexit_polls %>% mutate(d=weekdays(enddate)) %>% filter(d=="Monday")
nrow(n_brexit_polls)
n_brexit_polls <- brexit_polls %>% mutate(d=weekdays(enddate)) %>% filter(d=="Tuesday")
nrow(n_brexit_polls)
n_brexit_polls <- brexit_polls %>% mutate(d=weekdays(enddate)) %>% filter(d=="Wednesday")
nrow(n_brexit_polls)
n_brexit_polls <- brexit_polls %>% mutate(d=weekdays(enddate)) %>% filter(d=="Thursday")
nrow(n_brexit_polls)
n_brexit_polls <- brexit_polls %>% mutate(d=weekdays(enddate)) %>% filter(d=="Friday")
nrow(n_brexit_polls)
n_brexit_polls <- brexit_polls %>% mutate(d=weekdays(enddate)) %>% filter(d=="Sunday")
nrow(n_brexit_polls)
n_brexit_polls <- brexit_polls %>% mutate(d=weekdays(enddate)) %>% filter(d=="Saturday")
nrow(n_brexit_polls)


table(weekdays(brexit_polls$enddate))