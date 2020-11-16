.PHONY: report
# rule for making report  
report: R/report.Rmd data/wholegenome.RData rawdata/hg19_CGI.txt figs/fig1.png figs/fig2.png 
	Rscript -e "rmarkdown::render('R/report.Rmd', quiet = TRUE,output_file ='../report.html')"

# rule for analysis of human sequence compositions 
data/wholegenome.RData: R/wholegenome.R
	chmod +x R/wholegenome.R && \
	Rscript R/wholegenome.R
data/TSS.RData: rawdata/hg19_knownGenes.sqlite R/TSS.R
	chmod +x R/TSS.R && \
	Rscript R/TSS.R
	
# making images
figs/fig1.png: R/make_fig1.R data/wholegenome.RData
	chmod +x R/make_fig1.R && \
	Rscript R/make_fig1.R
figs/fig2.png: R/make_fig2.R data/wholegenome.RData data/TSS.RData
	chmod +x R/make_fig2.R && \
	Rscript R/make_fig2.R

# install required packages
.PHONY: install
install:
	Rscript R/packages.R

.PHONY: help
help: 
	@echo "report.html : Generate final analysis report."
	@echo "wholegenome.RData: analysis of CG content in whole human genome."
	@echo "TSS.RData   : analysis of CG content in transcriptional starting site."
	@echo "install     : install required R packages."