#' Get WSP hex color palette (or colors by name).
#'
#' @param ... One or multiple color names as character.
#'            If empty, all colors are returned.
#' @param with_names Logical: return palette as named vector?
#' @return A named vector of hex color codes.
#' @export
#'
#' @examples
#' pal_wsp("red", "blue", "gray")
#' pal_wsp("red", "blue", "gray", with_names = FALSE)
#' pal_wsp()
pal_wsp <- function(..., with_names = TRUE) {
  dots <- list(...)
  names_in <- sapply(dots, as.character)

  colors_df <- data.frame(stringsAsFactors=FALSE,
      name_engl = c("red", "lightred", "blue", "skyblue", "lightblue",
                    "steelblue", "midnightblue", "black", "gray",
                    "lightgray", "purple", "lightpurple"),
        hexcode = c("f9423a", "f8a28c", "859fbb", "a3cfea", "d8e6f0", "008eb9",
                    "345f7e", "1e252b", "757679", "d9d9d6", "57439b",
                    "ccc2e0")
   )

  colors_df$hexcode <- paste0("#", colors_df$hexcode)
  if (length(names_in) > 0) {
    colors_df <- colors_df[colors_df$name_engl %in% names_in, ]
  }

  colors_v <- colors_df$hexcode
  if (with_names == TRUE) {
    names(colors_v) <- colors_df$name_engl
  }

  if (length(names_in) > 0 & length(names_in) != length(colors_v)) {
    invalid_names <- setdiff(names_in, colors_df$name_engl)
    warning(
      paste("No colors found by following names:",
            paste(invalid_names, collapse = ", "),
            "Run names(pal_wsp()) to see available color names.",
            sep = "\n")
    )
  }

  return(colors_v)
}
