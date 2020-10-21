installed_pkgs <- row.names(installed.packages())
pkgs1 <- c("BiocManager", "knitr","xml2")
for(p in pkgs1){
    if(!(p %in% installed_pkgs)){
        install.packages(p,repos = "http://cran.us.r-project.org",INSTALL_opts = '--no-lock')
    }
}
pkgs2 <- c("BSgenome","BSgenome.Hsapiens.UCSC.hg19","AnnotationDbi","GenomicRanges","GenomicFeatures")
for(p in pkgs2){
    if(!(p %in% installed_pkgs)){
        BiocManager::install(p)
    }
}