library (tidyverse)
rvu <- read.csv("rvu.csv")

rvu <-rename(rvu, CPT = HCPCS)

colnames(rvu) <- c('ID', 'CPT', 'Description', 'Work_RVU', 'Facility_PE_RVU', 'MP_RVU', 'Facility_Total')

rvu <- filter(rvu, CPT != "") %>% select(-c(ID))


Names <- c("#", names(rvu), "QTY","Total")

FooterName <- c(rep("", length(Names)))
