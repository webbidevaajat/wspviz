#' Get HSL hex color palette (or colors by name).
#'
#' @param ... One or multiple color names as character.
#'            If empty, all colors are returned.
#' @param with_names Logical: return palette as named vector?
#' @return A named vector of hex color codes.
#' @export
#'
#' @examples
#' pal_hsl("train", "tram", "lightrail")
#' pal_hsl("train", "tram", "lightrail", with_names = FALSE)
#' pal_hsl()
pal_hsl <- function(..., with_names = TRUE) {
  dots <- list(...)
  names_in <- sapply(dots, as.character)

  # Using data.frame will later allow adding e.g. Finnish names
  # as another column which can be used as vector names by
  # named parameter if needed.
  colors_df <- data.frame(stringsAsFactors=FALSE,
      name_engl = c("bus", "tram", "metro", "train", "ferry", "bike", "lightrail",
                    "lightblue", "pink", "lightpink", "green", "lightgreen",
                    "red", "yellow", "gray1", "gray2", "gray3", "gray4"),
        hexcode = c("007ac9", "00985f", "ff6319", "8c4799", "00b9e4", "fcb919",
                    "00b2a9", "bee4f8", "f092cd", "f4deec", "64be1e", "d0e6be",
                    "dc0451", "fed100", "333333", "636363", "999999", "dddddd")
   )

  colors_df$hexcode <- paste0("#", colors_df$hexcode)
  if (length(names_in) > 0) {
    colors_df <- colors_df[colors_df$name_engl %in% names_in, ]
    colors_df <- colors_df[order(names_in), ]
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
            "Run names(pal_hsl()) to see available color names.",
            sep = "\n")
    )
  }

  return(colors_v)
}

