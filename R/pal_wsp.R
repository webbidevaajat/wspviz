#' Get WSP hex color palette (or colors by name).
#'
#' @param ... One or multiple color names as character.
#'            If empty, all colors are returned.
#' @return A named vector of hex color codes.
#' @export
#'
#' @examples
#' pal_wsp("red", "blue", "gray")
#' pal_wsp()
pal_wsp <- function(...) {
  dots <- list(...)
  names_in <- sapply(dots, as.character)

  colors_df <- data.frame(stringsAsFactors=FALSE,
      name_engl = c("red", "lightred", "blue", "skyblue", "lightblue",
                    "steelblue", "midnightblue", "black", "gray",
                    "lightgray", "purple", "lightpurple"),
        hexcode = c("f9423a", "f8a28c", "859f57", "a3cfea", "d8e6f0", "008eb9",
                    "345f7e", "1e252b", "757679", "d9d9d6", "57439b",
                    "ccc2e0")
   )

  colors_df$hexcode <- paste0("#", colors_df$hexcode)
  colors_v <- colors_df$hexcode
  names(colors_v) <- colors_df$name_engl

  if (length(names_in) == 0) {
    return(colors_v)
  }

  colors_out <- colors_v[names_in]

  if (any(is.na(colors_out))) {
    names_causing_na <- names_in[is.na(colors_out)]
    warning(
      paste("No colors found by following names:",
            paste(names_causing_na, collapse = ", "),
            "Run names(pal_hsl()) to see available color names.",
            sep = "\n")
    )
  }

  return(colors_out[!is.na(colors_out)])
}
