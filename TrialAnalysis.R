library(tidyverse)
install.packages("knitr")
library(knitr)
library(readxl)

AD_Trials <- read_excel("C:/Users/adamb/OneDrive/Documents/AtopicDerm-Trial-Analysis/AD_Trials.xlsx")

AD_Trials %>% 
  filter(Phases == "EARLY_PHASE1"| Phases == "PHASE1" | Phases == "PHASE1|PHASE2" | Phases == "PHASE2"
         | Phases == "PHASE2|PHASE3" | Phases == "PHASE3" | Phases == "PHASE4") %>%
  ggplot(aes(fill =  FunderType, x =  Phases)) + geom_bar()

AD_Trials %>% 
  filter(Phases == "EARLY_PHASE1"| Phases == "PHASE1" | Phases == "PHASE1|PHASE2" | Phases == "PHASE2"
         | Phases == "PHASE2|PHASE3" | Phases == "PHASE3" | Phases == "PHASE4") %>%
  filter(AgeRegroup == "ADULT"| AgeRegroup == "CHILD" | AgeRegroup == "ADULT AND CHILD") %>%
  ggplot(aes(fill =  AgeRegroup, x =  Phases)) + geom_bar()

AD_Trials %>% filter(Phases == "EARLY_PHASE1"| Phases == "PHASE1" | Phases == "PHASE1|PHASE2"
                     | Phases == "PHASE2"
                     | Phases == "PHASE2|PHASE3" | Phases == "PHASE3" | Phases == "PHASE4") %>% 
  ggplot(aes(x = Phases, y = Enrollment)) + geom_boxplot() +
  scale_y_continuous(limits = quantile(AD_Trials$Enrollment, c(0.1, 0.9), na.rm = TRUE))

AD_Trials %>% ggplot(aes (x = Enrollment)) + geom_histogram() + xlim(0,500)


AD_Trials %>% ggplot(aes (x = Enrollment, y = Months, color = FunderType)) + geom_point() +  scale_x_continuous(limits = quantile(AD_Trials$Enrollment, c(0.1, 0.9), na.rm = TRUE)) +
  scale_y_continuous(limits = quantile(AD_Trials$Enrollment, c(0.1, 0.9), na.rm = TRUE)) + ylim(0,50) + xlim(0,50)

AD_Trials$SSD = as.Date(paste0(AD_Trials$SSD, "-01"))
AD_Trials %>% ggplot(aes (x =  SSD, fill = StudyType)) + geom_histogram() + scale_x_date(date_breaks =  "5 years")

AD_Trials %>% filter(Phases == "EARLY_PHASE1"| Phases == "PHASE1" | Phases == "PHASE1|PHASE2"
                                   | Phases == "PHASE2"
                                   | Phases == "PHASE2|PHASE3" | Phases == "PHASE3" | Phases == "PHASE4") %>% 
  ggplot(aes(x = Phases, y = Months)) + geom_boxplot() + scale_y_continuous(limits = quantile(AD_Trials$Months, c(0.05, 0.95), na.rm = TRUE))