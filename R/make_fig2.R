png("figs/fig2.png")
load("data/wholegenome.RData")
load("data/TSS.RData")
pCG=CorG_1000bp/allbase_1000bp
obsExp=CandG_1000bp*1000/CorG_1000bp
pCG.TSS=CorG/allbase
obsExp.TSS=CandG*1000/CorG
par(mfrow=c(1,2))
d1=density(pCG[pCG>0])
d2=density(pCG.TSS[pCG.TSS>0])
plot(d1, lwd=2,main="density distribution of GC content")
lines(d2, col="red",lwd=2)
legend("topright", legend=c("Genome", "TSS"), lwd=2, col=c("black", "red"))
d1=density(obsExp[!is.na(obsExp)])
d2=density(obsExp.TSS[!is.na(obsExp.TSS)])
plot(d1, lwd=2, main="density distribution of Observed to expected CG ratio")
lines(d2, col="red",lwd=2)
legend("topright", legend=c("Genome", "TSS"), lwd=2, col=c("black", "red"))
dev.off()