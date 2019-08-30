library(wspviz)

test_that("Full color vector returned", {
  expect_length(pal_hsl(), 18)
})

test_that("Output is a vector", {
  expect_vector(pal_hsl())
})

test_that("Output has correct names", {
  expect_named(pal_hsl("tram", "bus"), c("tram", "bus"))
})

test_that("Selected colors returned", {
  expect_equal(pal_hsl("lightpink", "yellow"),
               c("lightpink" = "#f4deec", "yellow" = "#fed100"))
})

test_that("Warns about failing names", {
  expect_warning(pal_hsl("light"))
})

test_that("Returns colors with matching names only", {
  expect_equal(suppressWarnings(pal_hsl("bus", "tram", "light", "airplane")),
               c("bus" = "#007ac9", "tram" = "#00985f"))
})

test_that("Returns all without names if set so", {
  expect_named(pal_hsl(with_names = FALSE),
               NULL)
})

test_that("Returns filtered & without names if set so", {
  expect_named(pal_hsl("lightpink", "yellow", with_names = FALSE),
               NULL)
})
