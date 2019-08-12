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

The forces on stars, galaxies, and dark matter under external gravitational
fields lead to the dynamical evolution of structures in the universe. The orbits
of these bodies are therefore key to understanding the formation, history, and
future state of galaxies. The field of "galactic dynamics," which aims to model
the gravitating components of galaxies to study their structure and evolution,
is now well-established, commonly taught, and frequently used in astronomy.
Aside from toy problems and demonstrations, the majority of problems require
efficient numerical tools, many of which require the same base code (e.g., for
performing numerical orbit integration).

``Gala`` is an Astropy-affiliated Python package for galactic dynamics. Python
enables wrapping low-level languages (e.g., C) for speed without losing
flexibility or ease-of-use in the user-interface. The API for ``Gala`` was
designed to provide a class-based and user-friendly interface to fast (C or
Cython-optimized) implementations of common operations such as gravitational
potential and force evaluation, orbit integration, dynamical transformations,
and chaos indicators for nonlinear dynamics. ``Gala`` also relies heavily on and
interfaces well with the implementations of physical units and astronomical
coordinate systems in the ``Astropy`` package [@astropy] (``astropy.units`` and
``astropy.coordinates``).

``Gala`` was designed to be used by both astronomical researchers and by
students in courses on gravitational dynamics or astronomy. It has already been
used in a number of scientific publications [@Pearson:2017] and has also been
used in graduate courses on Galactic dynamics to, e.g., provide interactive
visualizations of textbook material [@Binney:2008]. The combination of speed,
design, and support for Astropy functionality in ``Gala`` will enable exciting
scientific explorations of forthcoming data releases from the *Gaia* mission
[@gaia] by students and experts alike.



# Acknowledgements

I acknowledge the helps of Matthew J. Simon and Michal Gazovic for testing the code.

# References
