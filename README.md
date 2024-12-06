<!-- README.md is generated from README.Rmd. Please edit that file -->

# mariage <img src="figures/readme/compendium-sticker.png" align="right" style="float:right; height:120px;"/>

<!-- badges: start -->

[![License: GPL (&gt;=
2)](https://img.shields.io/badge/License-GPL%20%28%3E%3D%202%29-blue.svg)](https://choosealicense.com/licenses/gpl-2.0/)
<!-- badges: end -->

<p align="left">
• <a href="#overview">Overview</a><br> • <a href="#data-sources">Data
sources</a><br> • <a href="#workflow">Workflow</a><br> •
<a href="#content">Content</a><br> •
<a href="#installation">Installation</a><br> •
<a href="#usage">Usage</a><br> • <a href="#citation">Citation</a><br> •
<a href="#contributing">Contributing</a><br> •
<a href="#acknowledgments">Acknowledgments</a><br> •
<a href="#references">References</a>
</p>

## Overview

This project is dedicated to analyse wedding data from 2021.

## Data sources

This project uses the following databases:

**{{ DESCRIBE THE DATA SOURCES }}**

<!--
| Database        | Usage                                                | Reference                 | Link      |
| :-------------- | :--------------------------------------------------- | :------------------------ | :-------: |
| Database name   | Explain the purpose of this database in the analysis | Database reference        | [link](#) |
-->

## Workflow

The analysis pipeline follows these steps:

**{{ DESCRIBE THE PIPELINE }}**

## Content
## Content

This project is structured as follow:

```
.
├─ README.md                                  # Presentation of the project
├─ DESCRIPTION                                # Project metadata
├─ LICENSE.md                                 # License of the project
|
├─ data/                                      # Contains raw data
|  ├─ data_two_csv/                              # INSEE weddings database
|  |  ├─ varmod_mariages_2021.csv			# variables description
|  |  └─ mar2021.csv					# used dataframe
|  |
|  └─ departments/                             # french departments limits database
|     └─ departements.geojson
|
├─ R/                                         # Contains R functions (only)
|  ├─ count_ecoregions.R                      # Function to count ecoregions per species
|  ├─ dl_wildfinder_data.R                    # Function to download WildFinder data
|  ├─ dl_pantheria_data.R                     # Function to download PanTHERIA data
|  ├─ join_tables.R                           # Function to merge WildFinder tables
|  ├─ plot_counts.R                           # Function to make the barplot
|  ├─ read_data.R                             # Function to import WildFinder tables
|  └─ select_species.R                        # Function to subset WildFinder species
|
├─ analyses/                                  # Contains R scripts
|  └─ download-data.R                         # Script to download raw data
|
├─ index.qmd                                  # Quarto report
├─ index.html                                 # Quarto result (html page)
|
└─ make.R                                     # Script to setup & run the project
```


**{{ LIST ADDITIONAL FILES/FOLDER }}**

## Installation

To install this compendium:

-   [Fork](https://docs.github.com/en/get-started/quickstart/contributing-to-projects)
    this repository using the GitHub interface.
-   [Clone](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository)
    your fork using `git clone fork-url` (replace `fork-url` by the URL
    of your fork). Alternatively, open [RStudio
    IDE](https://posit.co/products/open-source/rstudio/) and create a
    New Project from Version Control.

## Usage

Launch the
[`make.R`](https://github.com/anelimct/mariage/tree/main/make.R) file
with:

    source("make.R")

**Notes**

-   All required packages listed in the `DESCRIPTION` file will be
    installed (if necessary)
-   All required packages and R functions will be loaded
-   Some analyses listed in the `make.R` might take time

## Citation

Please use the following citation:

> **{{ ADD A CITATION }}**

## Contributing

All types of contributions are encouraged and valued. For more
information, check out our [Contributor
Guidelines](https://github.com/anelimct/mariage/blob/main/CONTRIBUTING.md).

Please note that this project is released with a [Contributor Code of
Conduct](https://contributor-covenant.org/version/2/1/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.

## Acknowledgments

**{{ OPTIONAL SECTION }}**

## References

**{{ OPTIONAL SECTION }}**
