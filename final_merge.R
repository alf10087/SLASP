## Final Merge

rm(list=ls())
library(dplyr)

# Load Files
hps <- read.csv("C:/Users/Melanie/Documents/UT Austin/PAGL/SLAS/SLASP/hps_clean.csv")
pagl <- read.csv("C:/Users/Melanie/Documents/UT Austin/PAGL/SLAS/SLASP/pagl.csv")

# Remove X primary key from HPS and PAGL
hps <- hps %>%
  select(-X)

pagl <- pagl %>%
  select(-X)

# Merge PAGL and HPS
full <- merge(hps, pagl, all = TRUE)

# Look at the data
z <- ncol(full)
for (i in 1:z) {
  print(colnames(full)[i])
  print(table(full[,i]))
}

write.csv(full, "full.csv")
