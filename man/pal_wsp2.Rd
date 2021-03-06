% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pal_functions.R
\name{pal_wsp2}
\alias{pal_wsp2}
\title{Get WSP basic + accent hex color palette (or colors by name)}
\usage{
pal_wsp2(..., with_names = TRUE)
}
\arguments{
\item{...}{One or multiple color names as character.
If empty, all colors are returned.}

\item{with_names}{Logical: return palette as named vector?}
}
\value{
A named vector of hex color codes.
}
\description{
Get WSP basic + accent hex color palette (or colors by name)
}
\examples{
pal_wsp("red", "green", "gold")
pal_wsp("red", "green", "gold", with_names = FALSE)
pal_wsp()
}
