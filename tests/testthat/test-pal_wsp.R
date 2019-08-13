library(wspviz)

test_that("Full color vector returned", {
  expect_length(pal_wsp(), 12)
})

test_that("Output is a vector", {
  expect_vector(pal_wsp())
})

test_that("Output has correct names", {
  expect_named(pal_wsp("red", "skyblue"), c("red", "skyblue"))
})

test_that("Selected colors returned", {
  expect_equal(pal_wsp("red", "skyblue"),
               c("red" = "#f9423a", "skyblue" = "#a3cfea"))
})

test_that("Warns about failing names", {
  expect_warning(pal_wsp("light"))
})

test_that("Returns colors with matching names only", {
  expect_equal(suppressWarnings(pal_wsp("red", "skyblue", "light", "green")),
               c("red" = "#f9423a", "skyblue" = "#a3cfea"))
})
