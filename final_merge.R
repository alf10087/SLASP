## Final Merge

rm(list=ls())
library(dplyr)

hps <- read.csv("C:/Users/Melanie/Documents/UT Austin/PAGL/SLAS/SLASP/hps_clean.csv")
pagl <- read.csv("C:/Users/Melanie/Documents/UT Austin/PAGL/SLAS/SLASP/pagl.csv")

# Remove X variable from CSV
hps <- hps %>%
  select(-X)

pagl <- pagl %>%
  select(-X)

full <- merge(hps, pagl, all = TRUE)


z <- ncol(full)
for (i in 1:z) {
  print(colnames(full)[i])
  print(table(full[,i]))
}

