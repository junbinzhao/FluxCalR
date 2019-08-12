# FluxCalR
This R package is used to calculate CO<sub>2</sub> and CH<sub>4</sub> gas fluxes measured with static chamber method. It provides an 
    easy way to calculate multiple flux measurements from one data file. 
    
**Package installation**

First, make sure the package `devtools` is installed in R. If not, install the package by: 
```R
install.packages("devtools")
```
Then, install the `FluxCalR` package in R by:
```R
devtools::install_github("junbinzhao/FluxCalR")
```
The functioning of the package is based on other R packages: `tidyverse`, `lubridate`, `assertthat`, `magrittr` and they have to be installed before using the functions in the `FluxCalR` package.

**Load data**

The format of data input are specialized to that of from **Los Gatos Research (LGR) Ultraportable Gas Analyzers** 
    <http://www.lgrinc.com/analyzers/ultraportable/>. Use the the function **`Load_LGR()`** to load raw data from LGR; 
    it automatic removes the extra rows at the beginning and the end, and convert timestamps into the format that is readable in R. 
    
A function (**`Load_other()`**) is also provided to load and convert data from other sources (e.g., LICOR) into the format that is 
    compliant with the flux calculation fuction. 

**Calculate fluxes**

The function **`FluxCal()`** calculates CO2 and/or CH4 flux rates based on the time cues provided for each measurement (i.e. either 
    start or end time). Two options are available to input the time cues: 
1. (default) after executing the function, manually clicking on a pop-up graph with CO2 concentration time series to choose 
    the END time, which could be identified by the "peaks" or "valleys"; or 
2. loading a file (.csv) into the argument "Time_keys" with times (HH:MM:SS) indicating start or end of each flux measurement. 
    The header for the time must be either "Start" or "End". 
    (see an example file "Time & Ta.csv" at https://github.com/junbinzhao/FluxCalR/tree/master/inst/extdata)
    
Based on the time cues and window width provided for the calculation, the function will automatically scan over data that cover
    *1.5x* length of the window width and calculate the fluxes based on the best linear regression (i.e. largest R2). After the
    calculations are done, a graph with regression lines plotted on the CO2 and/or CH4 concentration time series will pop up 
    for checkup purposes. 

*To report problems, seek support or contribute, please contact the author Junbin Zhao (junbinzhao1985@gmail.com).*

**Please cite the package as:**

Junbin Zhao (2018). FluxCalR: a R package for calculating CO<sub>2</sub> and CH<sub>4</sub> fluxes from static chambers. R package version 0.1.0. https://github.com/junbinzhao/FluxCalR/
