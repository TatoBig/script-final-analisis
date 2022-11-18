library(dplyr)
tabla <- read.csv(file = 'table.csv')
by_id <- tabla %>% group_by(id)
print(by_id %>% summarise(open = mean(open)), n=500)