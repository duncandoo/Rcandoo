#' An rmarkdown format for producing reveal.js slides
#'
#' This function allows you to render rmarkdown into reveal.js slide format.
#' @param keep_md Do you want to keep the .md intermediate file? Defaults to FALSE.
#' @param theme   Which reveal.js theme do you want: options are Black, White, League, Sky, Beige, Simple, Serif, Night, Moon, Solarized
#' @keywords reveal.js
#' @export
#' @examples
#' revealjs_format()
#' Put a YAML block at the top of your .rmd file
#' ---
#' title: "My Presentation"
#' output:
#'   Rcandoo::revealjs_format:
#'     theme: moon
#' ---
#' 
#' render('My Presentation.Rmd')

revealjs_format <- function(keep_md = FALSE, theme = 'moon') {
    #get theme
    theme <-  paste('-V theme=', theme, sep="")
    
    # get the revealjs template
    root <- system.file(package = "Rcandoo")
    template <- paste('--template=', root, "/rmarkdown/templates/revealjs_slides/resources/revealjs_template.html", sep="")
    
    require(rmarkdown)
    output_format(knitr = knitr_options(opts_chunk = list(dev = 'png')),
                  pandoc = pandoc_options(to = "revealjs", args = c('--standalone', theme, template)),
                  keep_md = TRUE, clean_supporting = FALSE)
}