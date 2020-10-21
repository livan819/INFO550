library(AnnotationDbi)
library(BSgenome)
library(BSgenome.Hsapiens.UCSC.hg19)
chroms<-c(paste0("chr",1:22),"chrX","chrY")
txdb = loadDb("data/hg19_knownGenes.sqlite")
genes.hg19 = genes(txdb)
tss=start(genes.hg19)
idx=which(strand(genes.hg19)=="-")
tss[idx]=end(genes.hg19)[idx]
allchrs = as.character(seqnames(genes.hg19))
idx=c(grep("random", allchrs),grep("hap", allchrs))
tss[idx]=end(genes.hg19)[idx]
allchrs = as.character(seqnames(genes.hg19))
idx=c(grep("random", allchrs),grep("hap", allchrs))
TSS=GRanges(seqnames=Rle(allchrs[-idx]),ranges=IRanges(tss[-idx]-500,tss[-idx]+500))
CorG=c()
allbase=c()
CandG=c()
for (i in seq(length(chroms)))
{
    Seq=Hsapiens[[chroms[i]]]
    idx=seqnames(TSS)==chroms[i]
    Seq.set=DNAStringSet(Seq, start=start(TSS[idx]), end=end(TSS[idx]))
    ff=alphabetFrequency(Seq.set, baseOnly=TRUE)
    CorG=c(CorG,ff[,"C"]+ff[,"G"])
    allbase=c(allbase,rowSums(ff))
    CandG=c(CandG,vcountPattern("CG", Seq.set))
}
save(CandG,CorG,allbase,TSS,file = "data/TSS.RData")