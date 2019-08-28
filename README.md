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
The functioning of the package is based on other R packages: `tidyverse`, `lubridate`, `assertthat`, `magrittr` and they must be installed before using the functions in the `FluxCalR` package.

**Load data**

The format of data input are specialized to that from **Los Gatos Research (LGR) Ultraportable Gas Analyzers** 
    <http://www.lgrinc.com/analyzers/ultraportable/>. Use the the function **`Load_LGR()`** to load raw data from LGR; 
    it automatically removes the extra lines at the beginning and the end, and convert timestamps into the format that is readable in R. See details and examples ``?Load_LGR()``.
    
A function (**`Load_other()`**) is provided to load and convert data from other sources (e.g., LICOR) into the format that is 
    compliant with the flux calculation fuction. See details and examples ``?Load_other()``.

**Calculate fluxes**

The function **`FluxCal()`** calculates CO<sub>2</sub> and/or CH<sub>4</sub> flux rates based on the time cues provided for each measurement (i.e., either 
    start or end time). Two options are available to input the time cues: 
1. (default) after executing the function, manually clicking on a pop-up graph with CO<sub>2</sub> concentration time series to choose 
    the END time, which can usually be recognized as the local "peaks" or "valleys" in the time series; or 
2. loading a file (.csv) into the argument "Time_keys" with times (HH:MM:SS) indicating the start or end of each flux measurement. 
    The header for the time must be either "Start" or "End". 
    (see example files "Time & Ta_1.csv" and "Time & Ta_2.csv" at https://github.com/junbinzhao/FluxCalR/tree/master/inst/extdata)
    
Based on the time cues and window width provided for the calculation, the function will automatically scan over data that cover a *1.5x* length of the window width and calculate the fluxes based on the best linear regression (i.e., largest R<sup>2</sup>). After the
    calculations are done, a graph with regression lines plotted on the CO<sub>2</sub> and/or CH<sub>4</sub> concentration time series will pop up 
    for checkup purposes. See details and examples ``?FluxCal()``.

**Community Guidelines**
*To report problems, seek support or contribute, please contact the author Junbin Zhao (junbinzhao1985@gmail.com). Requests/suggestions for new features are welcome*

**Please cite the package as:**

Junbin Zhao (2018). FluxCalR: a R package for calculating CO<sub>2</sub> and CH<sub>4</sub> fluxes from static chambers. R package version 0.1.0. https://github.com/junbinzhao/FluxCalR/
