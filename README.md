## My project

The project is about examining the sequence composition of human genome and checking the overlap between CpG islands and transcriptional starting sites.  

The dataset to be used is CpG island for Human hg19, which is obtained from UCSC Table Browser (http://genome.ucsc.edu/cgi-bin/hgTables) and the gene list for Human hg19, which can be obtained from `R` package `GenomicFeatures`. 

Some `R` packages should be installed before the analysis. The required packages can be installed using `R` commands.

``` r
install.packages()
installed_pkgs <- row.names(installed.packages())
pkgs1 <- c("BiocManager", "knitr")
for(p in pkgs1){
	if(!(p %in% install_pkgs)){
		install.packages(p)
    }
}
pkgs2 <- c("BSgenome","BSgenome.Hsapiens.UCSC.hg19","AnnotationDbi","GenomicRanges")
for(p in pkgs1){
	if(!(p %in% install_pkgs)){
		BiocManager::install(p)
	}
}
```

## Execute the analysis

To execute the analysis, from the project folder you can run 

``` bash
Rscript -e "rmarkdown::render('project.Rmd')"
```

This will create a file called `project.pdf` output in your directory that contains the results.
