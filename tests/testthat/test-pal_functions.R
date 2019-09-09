library(wspviz)

test_that("Error with invalid colors_df names", {
  expect_error(
    .pal_base(namels = list("a", "b"),
              colors_df = data.frame(stringsAsFactors = FALSE,
                                     a = c("a", "b"),
                                     hexcode = c(0, 0)),
              with_names = TRUE)
  )
})

test_that("Error with invalid hex color codes", {
  expect_error(
    .pal_base(namels = list("a", "b"),
              colors_df = data.frame(stringsAsFactors = FALSE,
                                     name_engl = c("a", "b"),
                                     hexcode = c("ffffff", "#f1f4")),
              with_names = TRUE)
  )
})

test_that("Full color vector returned", {
  expect_length(pal_wsp(), 12)
  expect_length(pal_hsl(), 18)
})

test_that("Output is a vector", {
  expect_vector(pal_wsp())
  expect_vector(pal_hsl())
})

test_that("Output has correct names in input order", {
  expect_named(pal_wsp("red", "skyblue"), c("red", "skyblue"))
  expect_named(pal_hsl("pink", "metro"), c("pink", "metro"))
})

test_that("Selected colors returned in input order", {
  expect_equal(pal_wsp("red", "skyblue"),
               c("red" = "#f9423a", "skyblue" = "#a3cfea"))
  expect_equal(pal_hsl("gray4", "metro"),
               c("gray4" = "#dddddd", "metro" = "#ff6319"))
})

test_that("Warns about failing names", {
  expect_warning(pal_wsp("light"))
  expect_warning(pal_hsl("foo"))
})

test_that("Returns colors with matching names only", {
  expect_equal(suppressWarnings(pal_wsp("red", "skyblue", "light", "green")),
               c("red" = "#f9423a", "skyblue" = "#a3cfea"))
  expect_equal(suppressWarnings(pal_hsl("red", "metro", "light")),
               c("red" = "#dc0451", "metro" = "#ff6319"))
})

test_that("Returns all without names if set so", {
  expect_named(pal_wsp(with_names = FALSE),
               NULL)
  expect_named(pal_hsl(with_names = FALSE),
               NULL)
})

test_that("Returns filtered & without names if set so", {
  expect_named(pal_wsp("red", "skyblue", with_names = FALSE),
               NULL)
  expect_named(pal_hsl("red", "pink", with_names = FALSE),
               NULL)
})
