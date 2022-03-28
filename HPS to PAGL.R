### Transform HPS to PAGL

library(dplyr)
library(ggplot2)
hps <- read.csv("/Users/alfonso/Downloads/HPS_Week29_PUF_CSV/pulse2021_puf_29.csv")

### Keep the variables:

hps_c <- hps %>% select(TBIRTH_YEAR, EGENDER, RHISPANIC, RRACE, 
                        EEDUC, MS, THHLD_NUMPER, THHLD_NUMKID, THHLD_NUMADLT, 
                        HADCOVID, WRKLOSSRV, EXPCTLOSS, ANYWORK, 
                        KINDWORK, TW_YN, TW_COV, WKVOL, SETTING, ANXIOUS,
                        WORRY, INTEREST, DOWN, PRESCRIPT, MH_SVCS, MH_NOTGET, 
                        TENURE, LIVQTRRV, EVICT, TNUM_PS, PSCHNG1, PSCHNG2,
                        PSCHNG3, PSCHNG4, PSCHNG5, PSCHNG6, 
                        PSWHYCHG1, PSWHYCHG2,
                        PSWHYCHG3, PSWHYCHG4, PSWHYCHG5, PSWHYCHG6, 
                        PSWHYCHG7, PSWHYCHG8, PSWHYCHG9, EST_ST, EST_MSA, 
                        REGION)

hps_c <- hps_c %>% mutate(age = 2021 - TBIRTH_YEAR)
