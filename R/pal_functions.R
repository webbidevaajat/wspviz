#' Base function for color palette functions
#'
#' Wraps together the common parts for palette functions.
#' Different palettes are defined by the data frame argument.
#'
#' `namels` is meant to be produced by `...` in actual palette functions.
#'
#' @param colors_df  a data frame with cols `name_engl` and `hexcode`
#' @param namels     list of quoted names (in `name_engl`) of colors to return
#' @param with_names logical. Should color vector be returned with names?
#'
#' @return A character vector of hex colors, named depending on `with_names`
.pal_base <- function(namels, colors_df, with_names) {
  names_in <- sapply(namels, as.character)

  assertthat::assert_that(all(names(colors_df) == c("name_engl", "hexcode")))
  assertthat::assert_that(all(grepl("^#[A-Fa-f0-9]{6}$", colors_df$hexcode)))

  if (length(names_in) > 0) {
    colors_df <- colors_df[match(intersect(names_in, colors_df$name_engl), colors_df$name_engl), ]
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
            sep = "\n")
    )
  }

  return(colors_v)
}

#' Get WSP hex color palette (or colors by name)
#'
#' @param ... One or multiple color names as character.
#'            If empty, all colors are returned.
#' @param with_names Logical: return palette as named vector?
#'
#' @return A named vector of hex color codes.
#' @export
#'
#' @examples
#' pal_wsp("red", "blue", "gray")
#' pal_wsp("red", "blue", "gray", with_names = FALSE)
#' pal_wsp()
pal_wsp <- function(..., with_names = TRUE) {
  colors_df <- data.frame(stringsAsFactors=FALSE,
                          name_engl = c("red", "lightred", "blue", "skyblue", "lightblue",
                                        "steelblue", "midnightblue", "black", "gray",
                                        "lightgray", "purple", "lightpurple"),
                          hexcode = c("f9423a", "f8a28c", "859fbb", "a3cfea", "d8e6f0", "008eb9",
                                      "345f7e", "1e252b", "757679", "d9d9d6", "57439b",
                                      "ccc2e0")
  )
  colors_df$hexcode <- paste0("#", colors_df$hexcode)
  return(.pal_base(namels = list(...), colors_df = colors_df, with_names = with_names))
}

#' Get WSP basic + accent hex color palette (or colors by name)
#'
#' @param ... One or multiple color names as character.
#'            If empty, all colors are returned.
#' @param with_names Logical: return palette as named vector?
#'
#' @return A named vector of hex color codes.
#' @export
#'
#' @examples
#' pal_wsp("red", "green", "gold")
#' pal_wsp("red", "green", "gold", with_names = FALSE)
#' pal_wsp()
pal_wsp2 <- function(..., with_names = TRUE) {
  colors_df <- data.frame(stringsAsFactors=FALSE,
                          name_engl = c("red", "steelblue", "black", "purple",
                                        "green", "pink", "gold"),
                          hexcode = c("f9423a", "008eb9", "1e252b", "57439b",
                                      "32a852", "a61689", "f9a339")
  )
  colors_df$hexcode <- paste0("#", colors_df$hexcode)
  return(.pal_base(namels = list(...), colors_df = colors_df, with_names = with_names))
}

#' Get HSL hex color palette (or colors by name)
#'
#' @param ... One or multiple color names as character.
#'            If empty, all colors are returned.
#' @param with_names Logical: return palette as named vector?
#'
#' @return A named vector of hex color codes.
#' @export
#'
#' @examples
#' pal_hsl("train", "tram", "lightrail")
#' pal_hsl("train", "tram", "lightrail", with_names = FALSE)
#' pal_hsl()
pal_hsl <- function(..., with_names = TRUE) {
  colors_df <- data.frame(stringsAsFactors=FALSE,
                          name_engl = c("bus", "tram", "metro", "train", "ferry", "bike", "lightrail",
                                        "lightblue", "pink", "lightpink", "green", "lightgreen",
                                        "red", "yellow", "gray1", "gray2", "gray3", "gray4"),
                          hexcode = c("007ac9", "00985f", "ff6319", "8c4799", "00b9e4", "fcb919",
                                      "00b2a9", "bee4f8", "f092cd", "f4deec", "64be1e", "d0e6be",
                                      "dc0451", "fed100", "333333", "636363", "999999", "dddddd")
  )
  colors_df$hexcode <- paste0("#", colors_df$hexcode)
  return(.pal_base(namels = list(...), colors_df = colors_df, with_names = with_names))
}
