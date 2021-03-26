library(rvest)
url <- "https://web.archive.org/web/20181024132313/http://www.stevetheump.com/Payrolls.htm"
h <- read_html(url)

nodes <- html_nodes(h, "table")

html_text(nodes[[8]])

html_table(nodes[[8]])

Table1 <- html_table(nodes[[1]])
Table2 <- html_table(nodes[[2]])
Table3 <-html_table(nodes[[3]])
Table4 <-html_table(nodes[[4]])

tab_1 <- html_table(nodes[[10]])
tab_1 <- as.data.frame(tab_1)
tab_1 <- tab_1[-1, -1]

tab_2 <- html_table(nodes[[19]])
tab_2 <- as.data.frame(tab_2)
tab_2 <- tab_2[-1,]


names(tab_1) <- c("Team", "Payroll", "Average")
names(tab_2) <- c("Team", "Payroll", "Average")

full_join(tab_1, tab_2, by="Team" ) %>% nrow()