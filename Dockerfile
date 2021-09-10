FROM ubuntu:20.04

USER root

# Updates and upgrades
RUN apt-get update -y
RUN apt-get upgrade -y

# Install dependencies to install R
RUN apt install -y apt-transport-https ca-certificates software-properties-common

# Add R CRAN repository
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'

# Install R
RUN apt-get install -y r-base r-base-dev

# Install R package specific dependencies
RUN apt-get install -y \
      git \
      libcurl4-openssl-dev \
      libfontconfig1-dev \
      libfreetype6-dev \
      libfribidi-dev \
      libharfbuzz-dev \
      libjpeg-dev \
      libpng-dev \
      libsecret-1-dev \
      libsodium-dev\
      libssl-dev \
      libtiff5-dev \
      libxml2-dev \
      unixodbc-dev

# Install common R packages
RUN Rscript -e "install.packages(c('devtools', 'pkgdown', 'tidyverse', 'data.table', 'odbc', 'DBI', 'rmarkdown'))"

