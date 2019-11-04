context("load other data")
library(FluxCalR)

# data directory
example_data2 <- system.file("extdata", "Flux_example_2_other.csv", package = "FluxCalR")

# load the data
Flux_other <- LoadOther(file = example_data2,
                        time = "Date_time",
                        time_format = "mdy_HMS",
                        CO2 = "CO2_PPM",
                        Ta = "Tem_C")

test_that("convert data into correct format",{
  expect_equal(length(which(is.na(Flux_other))),0) # no NA included
  expect_equal(nrow(Flux_other),7350) # successfully deleted unwanted lines
  expect_equal(ncol(Flux_other),3) # all the columns are loaded
  expect_equal(class(Flux_other$Time),c("POSIXct","POSIXt")) # time format
  expect_equal(names(Flux_other),
               c("Time","X.CO2.d_ppm","AmbT_C")) # column names
})

# load data with specific temperature
Flux_other_25 <- LoadOther(file = example_data2,
                           time = "Date_time",
                           time_format = "mdy_HMS",
                           CO2 = "CO2_PPM",
                           Ta = 25)

test_that("pass the correct temperature",{
  expect_equal(unique(Flux_other_25$AmbT_C),25)
})

# test errors
test_that("error can be triggered",{
  # date formate
  expect_error(LoadOther(file = example_data2,
                         time = "Date_time",
                         time_format = "dmy_HMS",
                         CO2 = "CO2_PPM"),
               "time_format")

  # no column for either CH4 or CO2 is provided
  expect_error(LoadOther(file = example_data2,
                         time = "Date_time",
                         time_format = "mdy_HMS"),
               "at least one column for CO2 or CH4")

  # wrong column name is provided
  expect_error(LoadOther(file = example_data2,
                         time = "Date_time",
                         time_format = "mdy_HMS",
                         CH4 = "mehane"),
               "check if column name")
})

