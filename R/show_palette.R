#' Plot palette colors
#'
#' @param pal named character vector of hex color codes,
#' e.g. result of a `pal_*()` function
#'
#' @return a `ggplot` object
#' @export
#'
#' @examples
#' show_palette(pal_hsl())
#'
#' @import ggplot2
show_palette <- function(pal) {
  if (!is.character(pal)) {
    stop("pal must be a character vector of hex color codes")
  }
  if (length(pal) == 0) {
    stop("Cannot plot empty palette")
  }
  if (is.null(names(pal)) | any(nchar(names(pal)) == 0)) {
    stop("All elements of pal must have names")
  }
  if (!all(grepl("^#[0-9A-Fa-f]{6}$", pal))) {
    stop("All elements of pal must be valid hex color codes")
  }
  n <- length(pal)
  dimlen <- ceiling(sqrt(n)) # Plot will have (max) this many rows and cols
  df <- data.frame(stringsAsFactors = FALSE,
                   hexcode = pal,
                   clrname = names(pal))
  df$ri <- rep(1:dimlen, each = dimlen, length.out = nrow(df))
  df$ci <- rep(1:dimlen, times = dimlen, length.out = nrow(df))
  p <- ggplot(df) +
    geom_tile(aes(x = ci, y = ri, fill = clrname),
              width = 0.8, height = 0.8) +
    geom_label(aes(x = ci, y = ri + 0.1, label = clrname)) +
    geom_label(aes(x = ci, y = ri - 0.1, label = hexcode)) +
    scale_y_reverse() +
    scale_fill_manual(values = pal, guide = FALSE) +
    theme_void()
  return(p)
}

