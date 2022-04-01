### Transform HPS to PAGL

library(dplyr)
library(ggplot2)
hps <- read.csv("C:/Users/Melanie/Documents/UT Austin/PAGL/SLAS/SLASP/pulse2021_puf_29.csv")

### Keep the variables:

hps_c <- hps %>% select(TBIRTH_YEAR, EGENDER, RHISPANIC, RRACE, 
                        EEDUC, THHLD_NUMPER, 
                        HADCOVID, ANYWORK, EVICT,
                        ANXIOUS, WORRY, INTEREST, DOWN, PRESCRIPT, MH_SVCS, MH_NOTGET, 
                       PSWHYCHG2, EST_ST, EST_MSA, 
                        REGION)

hps_c <- hps_c %>% mutate(age = 2021 - TBIRTH_YEAR)

# Cleaning 

hps_c <- hps_c %>%
  rename(hispanic = RHISPANIC, race = RRACE, alone = THHLD_NUMPER, 
         female = EGENDER, educ = EEDUC, had_covid = HADCOVID, 
         anxious = ANXIOUS, prescription = PRESCRIPT, region = REGION, 
         employed = ANYWORK) %>%
  select(-TBIRTH_YEAR) %>%
  mutate(female = female - 1) %>%
  mutate(hispanic = hispanic - 1) %>%
  mutate(alone = ifelse(alone == 1, 1, 0)) %>%
  mutate(had_covid = ifelse(had_covid == 2, 0, had_covid)) %>%
  mutate(had_covid = ifelse(had_covid == 3, 0, had_covid)) %>%
  mutate(employed = ifelse(employed == 2, 0, employed)) %>%
  mutate(id = row_number()) %>%
  mutate(source = "HPS") %>%
  mutate(prescription = ifelse(prescription == 2, 0, prescription)) %>%
  mutate(id = paste(source, id, sep = "_")) %>%
  select(-source) %>%
  rename(state = EST_ST)


write.csv(hps_c, "hps_clean.csv")

table(hps$prescription)
