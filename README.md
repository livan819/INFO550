## My project

The project is about examining the sequence composition of human genome and checking the overlap between CpG islands and transcriptional starting sites.  

The dataset to be used is CpG island for Human hg19, which is obtained from UCSC Table Browser (http://genome.ucsc.edu/cgi-bin/hgTables) and the gene list for Human hg19, which can be obtained from `R` package `GenomicFeatures`. 


## Execute the analysis

Some `R` packages should be installed before the analysis. The required packages can be installed using `make install`.

To execute the analysis, from the project folder you can run `make`. This will create a file called `project.html` output in your directory that contains the results.

Or `docker pull ivan0819/info550proj:latest` to download the built docker image. The report will be in /project.

## File structure

INFO550/ <br>
&nbsp;&nbsp;&nbsp; raw_data/ <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rawdata/hg19_CGI.txt <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rawdata/hg19_knownGenes.sqlite <br>
&nbsp;&nbsp;&nbsp; data/ <br>
&nbsp;&nbsp;&nbsp; R/ <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; R/packages.R  <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; R/wholegenome.R <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; R/TSS.R <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; R/make_fig1.R <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; R/make_fig2.R <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; R/report.Rmd <br>
&nbsp;&nbsp;&nbsp; figs/ <br>
&nbsp;&nbsp;&nbsp; Makefile <br>
&nbsp;&nbsp;&nbsp; Dockerfile <br>
&nbsp;&nbsp;&nbsp; README.md
