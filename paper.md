---
title: 'FluxCalR: a R package for calculating CO~2~ and CH~4~ fluxes from static chambers'
tags:
  - CO~2~
  - CH~4~
  - greenhouse gas
  - static chamber
  - continuous measurement
  - Los Gatos Research 
  - soil respiration
  - ecosystem flux
authors:
  - name: Junbin Zhao
    orcid: 0000-0001-5142-4901
    affiliation: "1, 2" # (Multiple affiliations must be quoted)
affiliations:
 - name: Department of Biogeochemistry and Soil Quality, Division of Environment and Natural Resources, Norwegian Institute of Bioeconomy Research, Ås, Norway
   index: 1
 - name: Department of Biological Sciences, Florida International University, Miami, FL, USA
   index: 2
date: 07 November 2019
bibliography: paper.bib
---

# Summary

As the main drivers of climate change, greenhouse gas (e.g., CO~2~ and CH~4~) emissions have been monitored intensively across the globe. The static chamber is one of the most commonly used approaches for measuring greenhouse gas fluxes from ecosystems (e.g., stem/soil respiration, CH~4~ emission, etc.) because of its easy implementation, high accuracy and low cost [@Pumpanen:2004]. To perform the measurements, a gas analyzer is usually used to measure the changes of greenhouse gas concentrations within a closed chamber that covers an area of interest (e.g., soil surface) over a certain period of time (usually several minutes). The flux rates (*F*) are, then, calculated from the recorded gas concentrations assuming that the changing rate is linear:

$$
F = vol/(R \cdot Ta \cdot area) \cdot dG/dt
$$

where *vol* is the volume of the chamber (l), *R* is the universal gas constant (l atm K^-1^ mol^-1^), *Ta* is the ambient temperature (K), *area* is the area of the chamber base (m^2^), and *dG/dt* is the rate of the measured gas concentration change over time *t* (ppm s^-1^) (i.e., the slope of the linear regression).

Even though the method itself appears to be straightforward, to calculate the fluxes from the raw gas concentration data can be tedious, because one usually has to manually extract the data for each measurement from an irregular mix of valid data and unwanted records. After selecting the valid data, it is important to choose a window that delivers the best regression for each measurement to ensure the quality and representativeness of the calculated flux. The R^2^ of the regression is usually taken to determine the quality of a flux measurement and a regression with low R^2^ is usually discarded [@Zhao:2016; @Zhao:2017]. Therefore, a tool that calculates the gas concentration changes into fluxes in an efficient and objective fashion is needed. 

There are some programs that calculate the fluxes measured using static chamber method, such as the Trace Gas Analyzer Platform (LI‐COR Inc., Lincoln, NE, USA), the R package ``flux`` [@Jurasinski:2014], and Flux Puppy [@Carbone:2019]. However, they are either compatible to only one designated system, unable to calculate fluxes for multiple gases, or hard to handle continuously measured gas concentrations. Therefore, there is still a need for a free, flexible and easy-to-use software that is designed to calculate ecosystem gas fluxes from continuously measured gas concentrations. 

This R package ``FluxCalR`` is designed to calculate CO~2~ and CH~4~ gas fluxes measured with static chamber method. It provides an easy solution to calculate all the fluxes in one single data file exported by most gas analyzers that includes continuously measured gas concentrations for multiple measurements. Overall, users can complete the flux calculation following three simple steps that implement the build-in functions: 1) load the raw dataset and convert it to the required format; 2) define the time cues that correspond to the start and/or end of the measurements, and 3) calculate the fluxes based on the time cues. 

``FluxCalR`` has several features to facilitate the process of flux calculation. Particularly, it has multiple options to identify valid data for the measurements which greatly improves the flexibility and efficiency of flux calculation. It is also flexible in the inputs (e.g., ambient temperature, gas type) that can meet the needs of measurements with different protocols. It ensures the best quality and representativeness of each flux by choosing the regression with the greatest determination coefficient (R^2^) within the defined data range, making the calculated results more reproducible. In addition, the ``FluxCalR`` also provides graphs to visualize the linear regressions on top of the original data to ensure no mismatch occurs. 

``FluxCalR`` is meant to be used by, for example, ecosystem researchers who carry out greenhouse gas flux measurements using the static chamber method. It simplifies and shortens the process of tedious flux calculations and helps one focus more on data analysis with the ready calculated fluxes. The functions in the package can be integrated into users' data processing/analyzing workflow. At the same time, it also saves the calculated fluxes to a local file that can be loaded by R again later or further processed in other programs. The original functions in the package have been used for flux calculations in the previous publications [@Zhao:2016; @Zhao:2017] and in other ongoing research projects performed in the Everglades.  


# Acknowledgements

This work is partially supported by the U.S. Department of Energy's (DOE) National Institute for Climate Change Research (07‐SC‐NICCR‐1059) and National Science Foundation Division of Atmospheric & Geospace Sciences Atmospheric Chemistry Program (1561161, 1561139, 1233006 and 1807533). I also acknowledge the suggestions from Sparkle L. Malone and the helps of Matthew J. Simon and Michal Gazovic for testing the code on different datasets.

# References
