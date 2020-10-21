png("figs/fig1.png")
load("data/wholegenome.RData")
pCG=CorG_1000bp/allbase_1000bp
obsExp=CandG_1000bp*1000/CorG_1000bp
par(mfrow=c(1,2))
hist(pCG[pCG>0],100,main="GC content")
hist(obsExp,100, main="Observed to expected CG ratio")
dev.off()