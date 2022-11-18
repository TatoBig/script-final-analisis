library(dplyr)
tabla <- read.csv(file = 'table.csv')
tabla %>% group_by(id,sector) %>% summarise(total_count=n(),.groups = 'drop') %>% as.data.frame() %>% count(sector)