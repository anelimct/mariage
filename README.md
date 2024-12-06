
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mariage <img src="figures/readme/compendium-sticker.png" align="right" style="float:right; height:120px;"/>

<!-- badges: start -->

[![License: GPL
(\>= 2)](https://img.shields.io/badge/License-GPL%20%28%3E%3D%202%29-blue.svg)](https://choosealicense.com/licenses/gpl-2.0/)
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

This project was developed during the *Recherche Reproductible* workshop
hosted by CESAB.

## Data sources

This project uses the database accessible in the [“Naissances, décès et
mariages en
2021”](https://www.insee.fr/fr/statistiques/7453878?sommaire=6652160)
document of INSEE.

<!--
| Database        | Usage                                                | Reference                 | Link      |
| :-------------- | :--------------------------------------------------- | :------------------------ | :-------: |
| Database name   | Explain the purpose of this database in the analysis | Database reference        | [link](#) |
-->

## Content

This repository is structured as follow:

  - [`DESCRIPTION`](https://github.com/anelimct/mariage/tree/main/DESCRIPTION):
    contains project metadata (authors, date, dependencies, etc.)

  - [`make.R`](https://github.com/anelimct/mariage/tree/main/make.R):
    main R script to run the entire project

  - [`R/`](https://github.com/anelimct/mariage/tree/main/R): contains R
    functions developed especially for this project

## Usage

Launch the
[`make.R`](https://github.com/anelimct/mariage/tree/main/make.R) file
with:

``` r
source("make.R")
```

**Notes**

  - All required packages listed in the `DESCRIPTION` file will be
    installed (if necessary)
  - All required packages and R functions will be loaded
  - Some analyses listed in the `make.R` might take time

## Citation

Please use the following citation:

> **RPZ à Anaëlle, Miléna et Nathan**

followed by a bllllah sound avec un “l” claqué.

## Contributing

All types of contributions are encouraged and valued. For more
information, check out our [Contributor
Guidelines](https://github.com/anelimct/mariage/blob/main/CONTRIBUTING.md).

Please note that this project is released with a [Contributor Code of
Conduct](https://contributor-covenant.org/version/2/1/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
