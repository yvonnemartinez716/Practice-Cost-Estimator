library (tidyverse)
rvu <- read.csv("rvu.csv")
 
colnames(rvu) <- c('ID', 'HCPS', 'Description', 'Work RVU', 'Facility PE RVU', 'MP RVU', 'FacilityTotal')


rvu <- filter(rvu, HCPS != "") %>% select(-c(ID))


Names <- c("#", names(rvu), "QTY","Total")

FooterName <- c(rep("", length(Names)))

#ggplot(rvu, aes(x=cpt, y = Total)) +
  #geom_bar()

  # scale_fill_brewer(palette = "Set1") +
  # theme(legend.position="none")