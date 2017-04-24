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

#I plot ear length
pdf("figures/reniplots.pdf")
plot(ears$earlength, ylab="ear length (units)", xlab="Individual", xaxt="n", col=ifelse(calcGC(ears$dnaseq)<.5,1,2), pch=19)
axis(1, labels = ears$id, at=c(1:dim(ears)[1]))
legend(x=1,y=17,title = "GC content", legend=c("<50%", ">50%"), col=c(1,2), pch=19, bty="n")
dev.off() 
# Adding a comment