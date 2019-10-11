#' @title Select the time cues
#'
#' @description Manually select the start or the end of each measurement as time cues for flux calculations.
#'
#'
#' @export
## function to manually select the time cues
Sel_cue <- function(data,
                    Flux = "X.CO2.d_ppm",
                    cue = "End",
                    spt = 1,
                    ylim = NULL,
                    save = "Time_cue.csv"){
  # define the pipe from the package "magrittr"
  `%>%` <- magrittr::`%>%`

  # creating a index for spiliting the window
  nr <- nrow(data) # number of rows
  # add one column as row index and one as time (HH:MM:SS)
  data <- cbind(Row=row(data)[,1],data) %>%
    dplyr::mutate(time=paste(lubridate::hour(Time),sprintf("%02d",lubridate::minute(Time)),sprintf("%02d",floor(lubridate::second(Time))),sep = ":"))

  ######## select the points to separate the measurements
  # plot CO2 vs index for locating the peaks and valleys
  In <- c() # create a variable as Index
  for (i in 1:spt){
    x11(width = 16,height = 10)
    if (is.null(ylim_CO2)){
      with(data[c(((i-1)*nr/spt)+1):c(i*nr/spt),],
           plot(Time,X.CO2.d_ppm,
                ylab = "CO2 in ppm",
                main = "Click on the peaks and valleys",
                cex.main=2.5, col.main="red",
                cex = 0.8, xaxt="n"
           ))
    } else {
      with(data[c(((i-1)*nr/spt)+1):c(i*nr/spt),],
           plot(Time,X.CO2.d_ppm,
                ylab = "CO2 in ppm",
                main = "Click on the peaks and valleys",
                cex.main=2.5, col.main="red",
                ylim = ylim_CO2, cex = 0.8, xaxt="n"
           ))
    }


    # add time interval ticks
    a <- lubridate::pretty_dates(data$Time[c(((i-1)*nr/spt)+1):c(i*nr/spt)],10)
    # which(minute(data$Time) %in% c(0,15,30,45) & floor(second(data$Time)) %in% c(0,1))
    axis.POSIXct(1, at= a,format = "%H:%M")
    abline(v=a, lty="dotted",col="grey")
    In_t <- with(data[c(((i-1)*nr/spt)+1):c(i*nr/spt),],identify(Time,X.CO2.d_ppm))
    In_t <- In_t + ((i-1)*nr/spt)
    In <- c(In,In_t)
    dev.off()
  }

  # sort the "In" in ascending order in case of click in the wrong order
  In <- sort(In)
  if (cue == "End"){ # selected cues are the end time
    End <- data$Time[In]
    Time_q <- data.frame(No=seq(1,length(In)), # number of measurements
                         End)
  } else { # selected cues are the start time
    Start <- data$Time[In]
    Time_q <- data.frame(Noseq(1,length(In)), # number of measurements
                         Start)
  }
  # output the time cues if necessary
  if (assertthat::is.string(save)){
    write.csv(Time_q,file = save,row.names = F)
  }
  return(Time_q)
}
