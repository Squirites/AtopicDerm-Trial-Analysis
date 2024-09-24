library(tidyverse)

AD_Trials %>% 
  filter(Phases == "EARLY_PHASE1"| Phases == "PHASE1" | Phases == "PHASE1|PHASE2" | Phases == "PHASE2"
         | Phases == "PHASE2|PHASE3" | Phases == "PHASE3" | Phases == "PHASE4") %>%
  ggplot(aes(fill =  FunderType, x =  Phases)) + geom_bar()

