library(wspviz)

test_that("Is a ggplot2 object", {
  expect_true(is.ggplot(show_palette(pal_hsl())))
})
