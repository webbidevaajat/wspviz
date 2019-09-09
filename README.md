
<!-- README.md is generated from README.Rmd. Please edit that file -->
wspviz
======

<!-- badges: start -->
<!-- badges: end -->
Utilities for common R visualization tasks at WSP Finland. Current features:

-   Color palettes for WSP and [HSL](https://hsl.fi/tyyliopas) colors

Planned features:

-   Tailored [`ggplot2`](https://github.com/tidyverse/ggplot2) themes for WSP and other common contexts

Installation
------------

Ensure you have [`devtools`](https://github.com/r-lib/devtools) installed. To get the latest development version of `wspviz`, run the following command:

``` r
devtools::install_github("webbidevaajat/wspviz")
```

Current version depends on `ggplot2` library (because of `show_palettes()` function).

Functions currently
-------------------

-   `pal_wsp()`: standard WSP colors
-   `pal_wsp2()`: strong WSP colors + some ad-hoc accent colors, meant for visualizations where several distinct colors are needed
-   `pal_hsl()`: color palette defined by Helsinki Region Transport style guide

Examples
--------

Get all the HSL colors as a named vector:

``` r
library(wspviz)
pal_hsl()
#>        bus       tram      metro      train      ferry       bike 
#>  "#007ac9"  "#00985f"  "#ff6319"  "#8c4799"  "#00b9e4"  "#fcb919" 
#>  lightrail  lightblue       pink  lightpink      green lightgreen 
#>  "#00b2a9"  "#bee4f8"  "#f092cd"  "#f4deec"  "#64be1e"  "#d0e6be" 
#>        red     yellow      gray1      gray2      gray3      gray4 
#>  "#dc0451"  "#fed100"  "#333333"  "#636363"  "#999999"  "#dddddd"
```

Get selected WSP colors:

``` r
library(wspviz)
pal_wsp("red", "blue", "gray")
#>       red      blue      gray 
#> "#f9423a" "#859fbb" "#757679"
```

Plot a color palette:

``` r
library(wspviz)
show_palette(pal_wsp())
```

<img src="man/figures/README-example3-1.png" width="50%" style="display: block; margin: auto;" />

**NEW:** a palette with basic WSP colors + a couple of roughly matching accent colors:

``` r
library(wspviz)
show_palette(pal_wsp2())
```

<img src="man/figures/README-example4-1.png" width="50%" style="display: block; margin: auto;" />

If you are for some reason running the palette functions several times, say, generating 1000 different plots, you can extract the color codes and just use named vector subsetting for a slight performance benefit (comparison has not been made so far), like this:

``` r
library(wspviz)
pal <- pal_hsl()
show_palette(pal[c("bus", "tram", "train", "metro", "ferry")])
```

<img src="man/figures/README-example5-1.png" width="50%" style="display: block; margin: auto;" />

``` r
# Instead of show_palette(pal_wsp("purple", "midnightblue"))
```

Contributing
------------

If you have any ideas or questions, feel free to submit an issue or even make a pull request!

### Author

Arttu Kosonen ([datarttu](https://github.com/datarttu)), arttu (dot) kosonen (at) wsp (dot) com
