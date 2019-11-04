context("flux calculation")
library(FluxCalR)
library(lubridate)

# flux data
example_data <- system.file("extdata", "Flux_example_1_LGR.txt", package = "FluxCalR")
Flux_lgr <- LoadLGR(file = example_data,
                    time_format = "mdy_HMS")
# time cues
Time_Ta <- read.csv(system.file("extdata",
                                "Time & Ta_1.csv",
                                package = "FluxCalR"))
# calculate
Flux_output <- FluxCal(data = Flux_lgr,
                        win = 3,
                        vol = 208, area = 0.26,
                        cal = "CO2_CH4",
                        df_cue = Time_Ta,
                        cue_type = "Start_End",
                        df_Ta = Time_Ta,
                        check_plot = FALSE,
                        output = FALSE)

test_that("the output is in line with input",{
  expect_equal(length(which(is.na(Flux_output))),0) # no NAs
  expect_equal(nrow(Flux_output),nrow(Time_Ta)*2) # same number of measurements as input from time cue df
  expect_equal(unique(Flux_output$Gas),c("CO2","CH4")) # both CO2 and CH4 are calculated
  expect_equal(round(as.numeric(difftime(ymd_hms(paste(Flux_output$Date,Flux_output$End)),
                                         ymd_hms(paste(Flux_output$Date,Flux_output$Start)),
                                         units = "min"))),
               rep(3,nrow(Time_Ta)*2)) # the time used to calculate the flux is the input window size
ts})

# when temperature is not provided by df_Ta
Flux_output1 <- FluxCal(data = Flux_lgr,
                        win = 3,
                        vol = 208, area = 0.26,
                        df_cue = Time_Ta,
                        cue_type = "Start_End",
                        df_Ta = NULL, # default
                        check_plot = FALSE,
                        output = FALSE)

test_that("temperature output/used is correct when not specified",{
  expect_false(identical(Flux_output1$Ta,rep(Time_Ta$Ta,2)))
})

# test errors
test_that("error can be triggered",{
  # 'ext' argument < 1
  expect_warning(FluxCal(data = Flux_lgr,
                         win = 3,
                         vol = 208, area = 0.26,
                         df_cue = Time_Ta,
                         ext = 0.5,
                         check_plot = FALSE,
                         output = FALSE),
                 "'ext' argument can not be < 1")

  # windows size too big
  expect_warning(FluxCal(data = Flux_lgr,
                         win = 20,
                         vol = 208, area = 0.26,
                         df_cue = Time_Ta,
                         check_plot = FALSE,
                         output = FALSE),
                 "differences between start and end time")

  # no data provided for CH4
  expect_warning(FluxCal(data = Flux_lgr[,-"X.CH4.d_ppm"],
                         win = 3,
                         vol = 208, area = 0.26,
                         df_cue = Time_Ta,
                         check_plot = FALSE,
                         output = FALSE),
                 "provided and specified in the correct way")

  # column names for 'other' augument can't be found
  expect_warning(FluxCal(data = Flux_lgr,
                         win = 3,
                         vol = 208, area = 0.26,
                         df_cue = Time_Ta,
                         other = "Others",
                         check_plot = FALSE,
                         output = FALSE),
                 "please check the 'other' argument")



})
