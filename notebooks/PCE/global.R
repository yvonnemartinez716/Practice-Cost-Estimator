library (tidyverse)
rvu <- read.csv("rvu.csv")

rename(rvu, CPT = HCPCS)
 
colnames(rvu) <- c('ID', 'CPT', 'Description', 'Work RVU', 'Facility PE RVU', 'MP RVU', 'FacilityTotal')


rvu <- filter(rvu, CPT != "") %>% select(-c(ID))

options(digits = 4)  


Names <- c("#", names(rvu), "QTY","Revenue")

FooterName <- c(rep("", length(Names)))

#ggplot(rvu, aes(x=cpt, y = Total)) +
  #geom_bar()

  # scale_fill_brewer(palette = "Set1") +
  # theme(legend.position="none")