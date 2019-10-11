#' @title Select the time cues
#'
#' @description Manually select the start or the end of each measurement as time cues for flux calculations.
#'
#'
#' @export
## function to manually select the time cues
Sel_cue <- function(data,
                    Flux = "CO2",
                    cue = "End",
                    spt = 1,
                    ylim = NULL,
                    save = "Time_cue.csv"){
  # define the pipe from the package "magrittr"
  `%>%` <- magrittr::`%>%`
  # creating a index for spiliting the window
  nr <- nrow(data) # number of rows
  # add one column as row index, one as time (HH:MM:SS) and one as the flux to be ploted (either "CO2" or "CH4")
  data <- cbind(Row=row(data)[,1],data) %>%
    dplyr::rowwise() %>%
    dplyr::mutate(flux_plot=ifelse(Flux=="CO2",X.CO2.d_ppm,X.CH4.d_ppm))

  ######## select the points to separate the measurements
  # define the ylab and ylim
  ylab <- paste0(ifelse(Flux=="CO2","CO2","CH4"),
                 " in ppm")
  if (is.null(ylim)){
    ylim <- range(data$flux_plot)
  } else {
    ylim <- ylim
  }

  # define the instructions
  exp1 <- paste0("1. Select time cues by clicking on the points at the ",cue," of each measurement;")
  exp2 <- "2. After finishing selecting, click 'Stop -> Stop locator' in the up-left corner..."

  # plot flux vs time for locating the peaks and valleys
  In <- c() # create a variable as Index
  for (i in 1:spt){
    x11(width = 16,height = 10)
    with(data[c(((i-1)*nr/spt)+1):c(i*nr/spt),],
         plot(Time,flux_plot,
              ylab = ylab,
              main = bquote(atop(.(exp1),.(exp2))), # add instruction
              cex.main=1.5, col.main="blue",
              ylim = ylim, cex = 0.8, xaxt="n"
         ))
    # add time interval ticks
    a <- lubridate::pretty_dates(data$Time[c(((i-1)*nr/spt)+1):c(i*nr/spt)],10)
    # which(minute(data$Time) %in% c(0,15,30,45) & floor(second(data$Time)) %in% c(0,1))
    axis.POSIXct(1, at= a,format = "%H:%M")
    abline(v=a, lty="dotted",col="grey")
    In_t <- with(data[c(((i-1)*nr/spt)+1):c(i*nr/spt),],identify(Time,flux_plot))
    In_t <- In_t + ((i-1)*nr/spt) # get the actual location in the whole dataset
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
    Time_q <- data.frame(No=seq(1,length(In)), # number of measurements
                         Start)
  }
  # output the time cues if necessary
  if (assertthat::is.string(save)){
    write.csv(Time_q,file = save,row.names = F)
  }
  return(Time_q)
}
