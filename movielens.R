library(dslabs)
library(lubridate)
data(movielens)
movielens
m1 <- movielens %>% mutate(m=as.numeric(timestamp)) %>%  mutate(mn=as_datetime(timestamp)) %>% mutate(y=year(mn)) %>% mutate(ho=hour(mn))
table(table(m1$y))
table(table(m1$ho))




