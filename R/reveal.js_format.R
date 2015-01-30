#' A rmarkdown format
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
#'   candoo::reveal.js_format:
#'     toc: false
#' ---
#' 
#' render('My Presentation.Rmd')

reveal.js_format <- function(toc = FALSE) {
    require(rmarkdown)
    output_format(knitr = knitr_options(opts_chunk = list(dev = 'png')),
                  pandoc = pandoc_options(to = "html"),
                  clean_supporting = FALSE)
    # get the locations of resource files located within the package
    css <- system.file("reports/styles.css", package = "mypackage")
    header <- system.file("reports/quarterly/header.html", package = "mypackage")
    
    # call the base html_document function
    rmarkdown::html_document(toc = toc,
                             fig_width = 6.5,
                             fig_height = 4,
                             theme = NULL,
                             css = css,
                             includes = includes(before_body = header))
}