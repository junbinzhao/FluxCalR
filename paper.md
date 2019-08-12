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
 - name: Department of Terrestrial Ecology, Division of Environment and Natural Resources, Norwegian Institute of Bioeconomy Research, Ås, Norway
   index: 1
 - name: Department of Biological Sciences, Florida International University, Miami, FL, USA
   index: 2
date: 13 August 2019
bibliography: paper.bib
---

# Summary

As the main drivers of climate change, greenhouse gas (e.g., CO<sub>2</sub> and CH<sub>4</sub>) emissions have been monitored intensively across the globe. Static chamber is one of the most commonly used approach for measuring greenhouse gas flux from ecosystems (e.g., stem/soil respiration, CH<sub>4</sub> emission, etc.) for its easy implementation, high accuracy and low cost [@Pumpanen:2004]. To perform the measurements, commercial infrared gas analyzers (IRGA) are usually used to record the changes of greenhouse gas concentrations within the chamber at a certain temporal resolution (e.g., 1s). However, to calculate the fluxes from the measured gas concentrations can be tedious and subjective considering that the original dataset usually includes large amount of unwanted records for the periods between the measurements and the window for calculating each flux has to be defined manually. Therefore, a tool that can efficiently calculate the concentrations into fluxes in a more objective fashion is needed. 

The R package ``FluxCalR`` calculates CO<sub>2</sub> and CH<sub>4</sub> gas fluxes measured with static chamber method. It provides an easy way to calculate multiple measurements from one data file. In particularly, it greatly improves the efficiency of processing the manually measured fluxes with irregular durations during and between measurements. It is flexible in the required environmental variables for calculating the fluxes and has multiple options of selecting the measurement window. It optimizes the calculation of each flux by choosing the greatest determination coefficient (R<sup>2</sup>) within defined data range, making the calculation repeatable. The package automates the flux calculation to the degree that it can be integrated into the workflow of further data analyses. At the same time, the package also provides graphs to visualize the linear regressions on top of the original data to ensure no mismatch occurs. 

The package is meant to be used by ecosystem researchers who carry out flux measurements using static chamber methods. It simplifies and shortens the process of tedious flux calculations and helps one focus more on the post-data-analysis with the ready calculated fluxes. The original functions in the package have been used for flux calculations in the previous publications [@Zhao:2016; @Zhao:2017] and in other ongoing research projects performed in the Everglades.  



# Acknowledgements

I acknowledge the helps of Matthew J. Simon and Michal Gazovic for testing the code on the their datasets.

# References
