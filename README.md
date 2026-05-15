# Genetic Code Analysis Toolkit for R - Conductance package (gcatconductance)

This project contains the source code for the R version of the Genetic Code Analysis Toolkit (GCAT) conductance project. It provides some functions to calculate the __conductance__ of a set of tuples (like codons). This can be used to compute a robustness of the genetic code against point mutations (see references). Please refer also to the [cammbio homepage](https://www.cammbio.hs-mannheim.de/research/software/gcatconductance-r) for more information.

![Genetic Code Analysis Toolkit Logo](./man/resources/bio/gcat/logo.png?raw=true)

## Installation

`gcatconductance` is available for R version 4.0 or higher. Starting a new R console and run:
```R
install.packages("devtools")
devtools::install_github("informatik-mannheim/gcatconductance")
```

## Usage

Once you installed `gcatconductance`, you may read its help pages. The file [./example/Tutorial.Rmd](./example/Tutorial.Rmd) is a good start for an introduction and a tutorial. This markdown document can be executed. The executed tutorial is available [online](https://oc.informatik.hs-mannheim.de/s/AwFk4Fq7wzWBtLE/download).

## References

 * Błażej, P., Kowalski, D.R., Mackiewicz, D., Wnetrzak, M., Aloqalaa, D.A., Mackiewicz, P., 2018. The structure of the genetic code as an optimal graph clustering problem (preprint). Systems Biology. https://doi.org/10.1101/332478

 * Fimmel, E., Gumbel, M., Starman, M., Strüngmann, L., 2021. Robustness against point mutations of genetic code extensions under consideration of wobble-like effects. Biosystems 208, 104485. https://doi.org/10.1016/j.biosystems.2021.104485

  * Fimmel, E., Gumbel, M., Starman, M., Strüngmann, L., 2021. Computational Analysis of Genetic Code Variations Optimized for the Robustness against Point Mutations with Wobble-Like Effects 17. https://www.mdpi.com/2075-1729/11/12/1338

## Copyright and license

Code and documentation copyright 2018-2022 Mannheim University of Applied Sciences. Code released under the Apache License, Version 2.0.
