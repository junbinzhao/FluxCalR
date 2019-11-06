---
title: 'FluxCalR: a R package for calculating CO2 and CH4 fluxes from static chambers'
tags:
  - CO2
  - CH4
  - greenhouse gas
  - static chamber
  - continuous measurement
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

# Summary

As the main drivers of climate change, greenhouse gas (e.g., CO~2~ and CH<sub>4</sub>) emissions have been monitored intensively across the globe. The static chamber is one of the most commonly used approaches for measuring greenhouse gas flux from ecosystems (e.g., stem/soil respiration, CH<sub>4</sub> emission, etc.) because of its easy implementation, high accuracy and low cost [@Pumpanen:2004]. To perform the measurements, an infrared gas analyzers (IRGA) are usually used to measure the changes of greenhouse gas concentrations within a closed chamber that covers an area of interest (e.g., soil surface) over a certain period of time (usually several minutes). The flux rates are, then, calculated from the recorded gas concentrations assuming that the changing rate is linear:

$$
F = vol/(R*Ta*area)*dG/dt
$$

where *vol* is the volume of the chamber (l), *R* is universal gas constant (l atm K^-1^ mol^-1^), *Ta* is the ambient temperature (K), *area* is the area of the chamber base (m^2^), and *dG/dt* is the rate (i.e., the slope of the linear regression) of the measured gas concentration change over time *t* (ppm s^-1^).

Even though the method itself appears to be straight forward, to calculate the fluxes from the raw gas concentration data can be tedious, which includes extracting the data for each measurement from an irregular mix of valid data and unwanted records and choosing a window that delivers the best regression for each measurement to ensure the quality and representativeness of the calculated flux. The R^2^ of the regression is usually taken to determine the quality of a flux measurement and a flux with low R^2^ is usually discarded [@Zhao:2016; @Zhao:2017]. Therefore, a tool that can calculate the gas concentration changes into fluxes in an efficient and objective fashion is needed. 

There are some software that calculate the fluxes measured using static chamber method. However, they are either compatible to only one designated system (e.g., [Li-Cor Trace Gas Analyzer Platform](https://www.licor.com/env/products/trace_gas/), [Flux Puppy](https://www.sciencedirect.com/science/article/pii/S0168192319301522)), unable to calculate fluxes for multiple gases (e.g., [Flux Puppy](https://www.sciencedirect.com/science/article/pii/S0168192319301522)), or hard to handle continuously measured gas concentrations (e.g., R package ['flux'](https://cran.r-project.org/web/packages/flux/index.html)). Therefore, there is still a need for a free, flexible and easy-to-use software that is designed to calculate ecosystem gas fluxes from continuously measured gas concentrations. 

This R package ``FluxCalR`` is designed to calculate CO<sub>2</sub> and CH<sub>4</sub> gas fluxes measured with static chamber method. It provides an easy solution to calculate all the fluxes in one single data file exported by most gas analyzers (e.g. LGR Ultraportable Gas Analyzers, etc.) that includes continuously measured gas concentrations for multiple measurements. Overall, users can complete the flux calculation following three simple steps that implement the build-in functions: 1) load the raw dataset and convert it to the required format; 2) define the time cues that correspond to the start and/or end of the measurements, and 3) calculate the fluxes based on the time cues. 

``FluxCalR`` has several features to facilitate the process of flux calculation. Particularly, it has multiple options of selecting the measurement windows which greatly improves the efficiency of processing the measured fluxes with irregular durations during and between measurements. It is also flexible in acquiring the inputs (e.g., ambient temperature, gases to be calculated, timing for identifying each measurement) for calculating the fluxes. It ensures the best quality and representativeness of each flux by choosing the greatest determination coefficient (R^2^) within the defined data range, making the calculated results more reproducible. In addition, the package also provides graphs to visualize the resulted linear regressions on top of the original data to ensure no mismatch occurs. 

``FluxCalR`` is meant to be used by, for example, ecosystem researchers who carry out greenhouse gas flux measurements using static chamber methods. It simplifies and shortens the process of tedious flux calculations and helps one focus more on data analysis with the ready calculated fluxes. The functions in the package can be integrated into users' data processing/analyzing workflow. At the same time, it also saves the calculated fluxes to a local file that can be loaded by R again later or used in other programs for non-R users. The original functions in the package have been used for flux calculations in the previous publications [@Zhao:2016; @Zhao:2017] and in other ongoing research projects performed in the Everglades.  


# Acknowledgements

I acknowledge the helps of Matthew J. Simon and Michal Gazovic for testing the code on their datasets.

# References
