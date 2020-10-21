library(BSgenome)
library(BSgenome.Hsapiens.UCSC.hg19)
chroms<-c(paste0("chr",1:22),"chrX","chrY")
CandG=rep(NA,length(chroms))
CorG=rep(NA,length(chroms))
cgratio=rep(NA,length(chroms))
CorG_1000bp=c()
allbase_1000bp=c()
CandG_1000bp=c()
for (i in seq(length(chroms)))
{
    Seq=Hsapiens[[chroms[i]]]
    bases=alphabetFrequency(Seq,baseOnly=TRUE)
    ntotBases=sum(bases[1:4])
    baseFreq=bases[1:4]/ntotBases
    GCcontent=baseFreq["C"]+baseFreq["G"]
    cg=matchPattern("CG", Seq)
    CandG[i]=length(cg)
    CorG[i]=baseFreq["C"]*baseFreq["G"]*ntotBases
    cgratio[i]=length(cg)/(baseFreq["C"]*baseFreq["G"]*ntotBases)
    ss=seq(1, length(Seq), by=1000)
    ss=ss[-length(ss)] ## remove the last one
    Seq.set=DNAStringSet(Seq, start=ss, end=ss+999)
    ff=alphabetFrequency(Seq.set, baseOnly=TRUE)
    CorG_1000bp=c(CorG_1000bp,ff[,"C"]+ff[,"G"])
    allbase_1000bp=c(allbase_1000bp,rowSums(ff))
    CandG_1000bp=c(CandG_1000bp,vcountPattern("CG", Seq.set))
}
save(CandG,CorG,cgratio,CorG_1000bp,allbase_1000bp,CandG_1000bp,file = "data/wholegenome.RData")