context("load LGR data")
library(FluxCalR)

# data directory
example_data1 <- system.file("extdata", "Flux_example_1_LGR.txt", package = "FluxCalR")
# load data
Flux_lgr <- LoadLGR(file = example_data1,
                    time_format = "mdy_HMS")

test_that("convert LGR data into correct format",{
  expect_equal(length(which(is.na(Flux_lgr))),0) # no NA included
  expect_equal(nrow(Flux_lgr),5371) # successfully deleted unwanted lines
  expect_equal(ncol(Flux_lgr),23) # all the columns are loaded
  expect_equal(class(Flux_lgr$Time),c("POSIXct","POSIXt")) # time format
  expect_equal(names(Flux_lgr)[c(1,8,10,16)],
               c("Time","X.CH4.d_ppm","X.CO2.d_ppm","AmbT_C")) # column names
})

test_that("error if wrong format is provided",{
  expect_error(LoadLGR(file = example_data1,
                       time_format = "dmy_HMS"),
               "time_format")
})
