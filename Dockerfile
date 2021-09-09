FROM alpine:latest

# # Install R package specific dependencies
RUN apk --no-cache add --update ca-certificates R R-dev git openssl-dev libsodium-dev libxml2-dev unixodbc-dev

# Install common R packages
RUN Rscript -e "install.packages(c('devtools', 'tidyverse', 'data.table', 'odbc', 'DBI', 'rmarkdown'), repos='http://cran.us.r-project.org')"

