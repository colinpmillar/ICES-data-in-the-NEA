ICES data in the NEA
================

### How to run / build

This code is built using ices TAF framework. To builld, install the
[icesTAF](https://github.com/ices-tools-prod/icesTAF) package from CRAN.

Then open R in the `ICES-data-in-the-NEA` directory and run:

``` r
library(icesTAF)
taf.bootstrap()
sourceAll()
```

To build the readme, run:

``` r
rmarkdown::render("README.Rmd")
```

### how this code was created

``` r
# make empty TAF analysis skeleton
taf.skeleton()

# select (non-standard packages) packages to use and create
# SOFTWARE.bib file
draft.software(c("icesDatras", "DATRAS"), file = TRUE)

# create surveyPositions.R file in the bootstrap folder

# create DATA.bib file
draft.data(file = TRUE)
```
