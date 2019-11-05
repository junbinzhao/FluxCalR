---
title: 'FluxCalR: a R package for calculating CO2 and CH4 fluxes from static chambers'
tags:
  - greenhouse gas
  - chamber method
  - Los Gatos Research 
  - Soil respiration
  - Ecosystem flux
authors:
  - name: Junbin Zhao
    orcid: 0000-0001-5142-4901
    affiliation: "1, 2" # (Multiple affiliations must be quoted)
affiliations:
 - name: Department of Biogeochemistry and Soil Quality, Division of Environment and Natural Resources, Norwegian Institute of Bioeconomy Research, Ås, Norway
   index: 1
 - name: Department of Biological Sciences, Florida International University, Miami, FL, USA
   index: 2
date: 05 November 2019
bibliography: paper.bib
---

# Statement of need

As the main drivers of climate change, greenhouse gas (e.g., CO<sub>2</sub> and CH<sub>4</sub>) emissions have been monitored intensively across the globe. The static chamber is one of the most commonly used approaches for measuring greenhouse gas flux from ecosystems (e.g., stem/soil respiration, CH<sub>4</sub> emission, etc.) because of its easy implementation, high accuracy and low cost [@Pumpanen:2004]. To perform the measurements, commercial infrared gas analyzers (IRGA) are usually used to measure the changes of greenhouse gas concentrations within a chamber that covers an area of interest (e.g., soil surface) over a centain period of time (usually several minutes). The flux rates are, then, calculated from the recorded gas concentraion changes based on linear regressions:

$$
F = vol/(R*Ta*area)*dG/dt
$$

where *vol* is the volumn of the chamber (l), *R* is universal gas constant (l atm K^-1^ mol^-1^), *Ta* is the ambient temperature (K), *area* is the chamber base area (m^2^), and *dG/dt* is the linear slope of the measured gas concentration change over time *t* (ppm s^-1^).

Eventhough the method itself is straight forward to conduct, to calculate the fluxes from the recorded gas concentration data can be tedious considering that the original dataset usually includes a mix of valid data and unwanted records irregularly placed between each other. In addtion, since the calculated flux rate is largely determined by the slope of the regression, choosing a window that delivers a better regression is important to to achieve the highest representativeness of the fluxes. The R^2^ of the regression is usually used to determine the quality of a flux measurement [@Zhao:2016; @Zhao:2017]. This leads to another problem when one selects fixed valid data windows for calculations based on his/her own judgement that may actually not be representive for the flux measurement. that covers the because that the data that is valid for calculation  and the window location for calculating each flux is fixed. Therefore, a tool that can efficiently calculate the concentration changes into fluxes in a more efficient and objective fashion is needed. 

To my knowledge, there are already some softwares that has the function to calculate the fluxes measured using static chamber method. However, they are either compatible to only one designated system (e.g., [Licor Trace Gas Analyzer Platform](https://www.licor.com/env/products/trace_gas/), [Flux Puppy](https://www.sciencedirect.com/science/article/pii/S0168192319301522)), unable to calculate fluxes for multiple gases (e.g., [Flux Puppy](https://www.sciencedirect.com/science/article/pii/S0168192319301522)), or hard to handle continously measured concentrations (e.g., R package ['flux'](https://cran.r-project.org/web/packages/flux/index.html)). Therefore, there is still a need for a free, flexible and easy-to-use software that is designed to calculate ecosystem gas fluxes from continously measured concentrations. 

# Summary

The R package ``FluxCalR`` calculates CO<sub>2</sub> and CH<sub>4</sub> gas fluxes measured with the static chamber method. It provides an easy solution to calculate multiple measurements from one data file based on the defined start and/or end time of each measurement (i.e., time cues). In particularly, it has multiple options of selecting the measurement windows, which greatly improves the efficiency of processing the measured fluxes with irregular durations during and between measurements. It is also flexible in acquiring the input of the air temperature variable for calculating the fluxes. It optimizes the calculation for each flux by choosing the greatest determination coefficient (R^2^) within the defined data range, making the calculated results more reproducible. The package automates the flux calculation to the degree that it could be integrated into the workflow of further data analyses. At the same time, the package also provides graphs to visualize the resulted linear regressions on top of the original data to ensure no mismatch occurs. 

This R package `FluxCalR` is used to calculate CO<sub>2</sub> and CH<sub>4</sub> gas fluxes measured with static chamber method. It provides an easy way to calculate multiple flux measurements from one continuously measured data file exported by most gas analyzers (e.g. LGR Ultraportable Gas Analyzers). Specifically, users can use the function `LoadLGR()` or `LoadOther()` to load the raw data file that includes the gas concentration records. Then, create a separate data frame by `SelCue()` that includes the time cues that each measurement starts and/or ends corresponding to the time in the raw data file. Based on the time cues, the fluxes of all the measurements can be calculated and exported using the function `FluxCal()`. In addition, this package highlights several features that facilitate the process of flux calculation:

* **An interactive way of selecting the measurement time cues** - The package includes the function `SelCue()` that one can use to select the time cues (start or end of each measurement) manually by clicking on an interactive graph of the entire gas concentration time series from the raw data file. The data frame returned from the function can be directly used as the argument `df_cue` of `FluxCal()` for the flux calculation. The time cue data frame can also be saved (default) and used again to get reproducible results.   

* **Flexible input** - Depending on the measurement protocol and requirement of the users, the `FluxCal()` function is flexible in the sense that 1) it takes either "Start", "End" or both "Start_End" of each measurement (argument `cue_type`) as time cues to identify each measurement; 2) it calculates "CO2", "CH4" or both "CO2_CH4" fluxes at the same time (argument `cal`). 

* **A dynamic measurement window** - The flux calculation automatically scans through a range of 1.5x (default) of the measurement window and the best linear regression (largest R<sup>2</sup>) is used to calculate the final fluxes. This protocol optimize the representative and reproducibility of the calculated flux. This dynamic range can be changed in the argument `ext` of the function `FluxCal()`. 

* **A checkup graph after the calculation** - By default (argument `check_plot`), a graph is plotted after the calculation with regression lines plotted on the CO2 and/or CH4 concentration time series for checkup purposes. This post-calculation feature will help users identify any flux calculation that is based on the unwanted section of the data. 

* **Easy to be integrated into workflows** - The `FluxCal()` returns a data frame with the calculated flux and identifier of each measurement (e.g., plot ID, see argument `Other`) that can be integrated into users' data processing/analyzing workflow. At the same time, it also saves the data frame to a ".csv" file that can be loaded by R again later or used in other programs for non-R users. 

The package is meant to be used by, for example, ecosystem researchers who carry out greenhouse gas flux measurements using static chamber methods. It simplifies and shortens the process of tedious flux calculations and helps one focus more on data analysis with the ready calculated fluxes. The original functions in the package have been used for flux calculations in the previous publications [@Zhao:2016; @Zhao:2017] and in other ongoing research projects performed in the Everglades.  



# Acknowledgements

I acknowledge the helps of Matthew J. Simon and Michal Gazovic for testing the code on their datasets.

# References
