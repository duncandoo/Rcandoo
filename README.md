---
title: Rcandoo
author: Duncan McPherson
---

Copyright 2014, Duncan McPherson.
All rights reserved.

My personal R package to contain stuff I use like functions etc. The first thing in is a template to convert .Rmd files to reveal.js slides.

The template is for making presentations that use my [presentation](https://github.com/duncandoo/presentation) server.

## Installation

```r
install.packages('devtools')
library(devtools)
install_github('duncandoo/Rcandoo')
```

## Usage

```r
rmarkdown::draft("my_pres.Rmd", template = "revealjs_format", package = "Rcandoo")
```

Then start writing your presentation following the guidelines for [pandoc presentations](http://johnmacfarlane.net/pandoc/demo/example9/producing-slide-shows-with-pandoc.html).

