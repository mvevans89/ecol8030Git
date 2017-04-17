#This document analyzes house elves
library(stringr)
ears <- read.csv("data/houseelf-earlength-dna-data_1.csv", stringsAsFactors = F)

calcGC <- function(sequence){
  sequence <- str_to_upper(sequence)
  GCcontent <- (str_count(sequence, "C") + str_count(sequence, "G"))/str_length(sequence)
  return(GCcontent)
}

calcGC(ears$dnaseq[1])

test <- calcGC(ears$dnaseq[3])
