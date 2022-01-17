library (tidyverse)
rvu <- read.csv("rvu.csv")

rvu <-rename(rvu, CPT = HCPCS)

colnames(rvu) <- c('ID', 'CPT', 'Description', 'Work_RVU', 'Facility_PE_RVU', 'MP_RVU', 'Facility_Total')

rvu <- subset(rvu, select = -c(ID))

Names <- c("#", names(rvu), "Total")

FooterName <- c(rep("", length(Names)))
