#' An rmarkdown format for producing reveal.js slides
#'
#' This function allows you to render rmarkdown into reveal.js slide format.
#' @param toc Do you want a Table of Contents? Defaults to FALSE.
#' @keywords reveal.js
#' @export
#' @examples
#' reveal.js_format()
#' Put a YAML block at the top of your .rmd file
#' ---
#' title: "My Presentation"
#' output:
#'   Rcandoo::reveal.js_format:
#'     toc: false
#' ---
#' 
#' render('My Presentation.Rmd')

reveal.js_format <- function(toc = FALSE) {
    require(rmarkdown)
    output_format(knitr = knitr_options(opts_chunk = list(dev = 'png')),
                  pandoc = pandoc_options(to = "html"),
                  clean_supporting = FALSE)
}