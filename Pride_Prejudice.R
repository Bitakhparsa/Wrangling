library(tidyverse)
library(gutenbergr)
library(tidytext)
options(digits = 3)

gutenberg_metadata %>%  filter(str_detect(title, "Pride and Prejudice")) 

gutenberg_works(title == "Pride and Prejudice")$gutenberg_id


book <- gutenberg_download(1342)
words <- book %>%
  unnest_tokens(word, text)
nrow(words)



words <- words %>% anti_join(stop_words)
nrow(words)

words <- words %>% anti_join(stop_words) %>% filter(!str_detect(word, "\\d"))
nrow(words)

words_count <- words %>%
  group_by( word) %>%
  count()
sum(words_count$n >100)

max(words_count$n)

words_count <- words %>%
  group_by( word) %>%
  count()%>% filter(n==597)

words %>%
  count(word) %>%
  top_n(1, n) %>%
  pull(n)

words <- words %>%
  inner_join(get_sentiments("afinn"))
nrow(words)

mean(words$value>0)

sum(words$value==4)
