library(Lahman)

top <- Batting %>% 
  filter(yearID == 2016) %>%
  arrange(desc(HR)) %>%    # arrange by descending HR count
  slice(1:10)    # take entries 1-10
top %>% as_tibble()
Master %>% as_tibble()
top_names <- top %>% right_join(Master) %>%
  select(playerID, nameFirst, nameLast, HR)


top_salary <- Salaries %>% filter(yearID == 2016) %>%
  right_join(top_names) %>% select(nameFirst, nameLast, teamID, HR, salary)


top_id <- top %>% select(playerID)
award_2016Awards_id <- AwardsPlayers %>% filter(yearID == 2016) %>% select(playerID)

  dplyr::intersect(award_2016Awards_id,top_id)
  dplyr::setdiff(award_2016Awards_id,top_id)