## Final Merge

rm(list=ls())
library(dplyr)

hps <- read.csv("hps_clean.csv")
pagl <- read.csv("pagl.csv")

# Remove X variable from CSV
hps <- hps %>%
  select(-X) %>%
  rename(lives_alone = alone)

pagl <- pagl %>%
  select(-X)

full <- merge(hps, pagl, all = TRUE)


z <- ncol(full)
for (i in 1:z) {
  print(colnames(full)[i])
  print(table(full[,i]))
}

#### Create mental health index

full <- full %>%
  mutate(mhealth_ind = anxious + WORRY + INTEREST + DOWN)

