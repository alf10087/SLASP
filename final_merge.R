## Final Merge

rm(list=ls())
library(dplyr)


hps <- read.csv("hps_clean.csv")
pagl <- read.csv("pagl.csv")


# Remove X primary key from HPS and PAGL
hps <- hps %>%
  select(-X) %>%
  rename(lives_alone = alone) %>%
  mutate(group = "National")

pagl <- pagl %>%
  select(-X) %>%
  mutate(group = "PAGL")

# Merge PAGL and HPS
full <- merge(hps, pagl, all = TRUE)

# Look at the data
z <- ncol(full)
for (i in 1:z) {
  print(colnames(full)[i])
  print(table(full[,i]))
}


#### Create mental health index

full <- full %>%
  mutate(mhealth_ind = anxious + WORRY + INTEREST + DOWN)

write.csv(full, "full.csv")
