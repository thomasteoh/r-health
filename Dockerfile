FROM alpine:latest

# # Install R package specific dependencies
RUN apk --no-cache add --update g++ gcc linux-headers libgit2-dev make ca-certificates R R-dev git openssl-dev libsodium-dev libxml2-dev unixodbc-dev

# Install common R packages
RUN Rscript -e "install.packages(c('devtools', 'data.table', 'odbc', 'DBI', 'rmarkdown'), repos='http://cran.us.r-project.org')"

# Some of the tidyverse packages on CRAN don't compile nicely
RUN Rscript -e "devtools::install_github('tidyverse/tidyverse')"

