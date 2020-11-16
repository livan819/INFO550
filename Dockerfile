FROM rocker/tidyverse

# make a project directory in the container
# we will mount our local project directory to this directory
RUN mkdir /project
RUN mkdir /project/output

# copy contents of local folder to project folder in container
COPY ./ /project/

# make R scripts executable
RUN chmod +x /project/R/*.R

# install R packages
RUN make -C project install

# make container entry point bash
CMD make -C project report