## My project

The project is about examining the sequence composition of human genome and checking the overlap between CpG islands and transcriptional starting sites.  

The dataset to be used is CpG island for Human hg19, which is obtained from UCSC Table Browser (http://genome.ucsc.edu/cgi-bin/hgTables) and the gene list for Human hg19, which can be obtained from `R` package `GenomicFeatures`. 

Some `R` packages should be installed before the analysis. The required packages can be installed using `make install`.


## Execute the analysis

To execute the analysis, from the project folder you can run `make`.

This will create a file called `project.html` output in your directory that contains the results.

## File structure

rawdata/  

	data/hg19_CGI.txt  
	
	data/hg19_knownGenes.sqlite  
	
R/  

	R/packages.R  
	
	R/make_fig1.R
	
	R/make_fig2.R
	
	R/report.Rmd
data/	

figs/

Makefile

README.md
