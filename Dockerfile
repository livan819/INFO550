FROM rocker/tidyverse

# install R packages like this
# put as close to top of script as possible to make best 
# use of caching and speed up builds
RUN R -e "install.packages(c('BiocManager','knitr','xml2'))"
RUN R -e "BiocManager::install(c('BSgenome','BSgenome.Hsapiens.UCSC.hg19','AnnotationDbi','GenomicRanges','GenomicFeatures'))"

# make a project directory in the container
# we will mount our local project directory to this directory
RUN mkdir /project
RUN mkdir /project/output

# copy contents of local folder to project folder in container
COPY ./ /project/

# make R scripts executable
RUN chmod +x /project/R/*.R

# make container entry point bash
CMD make -C project report
