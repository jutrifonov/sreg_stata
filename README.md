# Stratified Randomized Experiments (Stata® Edition) <img src="https://github.com/jutrifonov/sreg.dev/blob/main/logo.png" align="right" height="250" /></a>
![version](https://img.shields.io/badge/sreg-v.1.0.0.9000-green?style=flat&logo=github&labelColor=2A2523)
[![codecov](https://codecov.io/github/jutrifonov/sreg/graph/badge.svg?token=KAUXB0ETCA)](https://app.codecov.io/github/jutrifonov/sreg)

The `sreg` package offers a toolkit for estimating average treatment effects (ATEs) in stratified randomized experiments. The package is designed to accommodate scenarios with multiple treatments and cluster-level treatment assignments, and accomodates optimal linear covariate adjustment based on baseline observable characteristics. The package computes estimators and standard errors based on Bugni, Canay, Shaikh (2018); Bugni, Canay, Shaikh, Tabord-Meehan (2023); and Jiang, Linton, Tang, Zhang (2023).

**Dependencies:** `numpy`, `pandas`, `scipy`

⚠️ **WARNING:** The `sreg Stata® Edition` relies on a `Python™ Edition`. You must have Python installed along with the `sreg` package to use the `Stata` version. Please see installation instructions below.

## Authors
- Juri Trifonov jutrifonov@uchicago.edu

- Yuehao Bai yuehao.bai@usc.edu

- Azeem Shaikh amshaikh@uchicago.edu

- Max Tabord-Meehan maxtm@uchicago.edu

## Supplementary files 
-  Sketch of the derivation of the ATE variance estimator under cluster-level treatment assignment: [Download PDF](https://github.com/jutrifonov/sreg.dev/blob/main/cluster.pdf)

-  Expressions for the multiple treatment case (with and without clusters): [Download PDF](https://github.com/jutrifonov/sreg.dev/blob/main/multiple.pdf)

## Installation
1. Make sure that you have a Python enviroment installed on your computer. If not, you can download it from https://www.python.org/downloads/. Then open a terminal and install the python version of the `sreg` package by running:
```
pip install sreg
```
2. The latest development version for Stata can be installed from `GitHub`:
```
net install sreg, from("https://raw.githubusercontent.com/jutrifonov/sreg_stata/main/")
```

## The command `sreg`
Estimates the ATE(s) and the corresponding standard error(s) for a (collection of) treatment(s) relative to a control.

### Syntax
```
sreg, y() s() d() x() g_id() ng() hc1(true)
```
### Arguments
- **`y` -** a variable representing the observed outcomes;
- **`s` -** a variable representing strata indicators $\\{0, 1, 2, \ldots\\}$; if not provided, then the estimation is performed assuming no stratification;
- **`d` -** a variable representing treatments indexed by $\\{0, 1, 2, \ldots\\}$, where `d = 0` denotes the control;
- **`g_id` -** a variable representing cluster indicators; if not provided, then estimation is performed assuming treatment is assigned at the individual level;
- **`ng` -** a variable representing cluster sizes; if not provided, then `ng` is assumed to be equal to the number of available observations in every cluster;
- **`x` -** a (collection of) covariate(s) ; if not provided, then the estimator without linear adjustments is applied [^*];
- **`hc1` -** a `true/false` logical argument indicating whether the small sample correction should be applied to the variance estimator.
[^*]: *Note: sreg cannot use individual-level covariates for covariate adjustment in cluster-randomized experiments. Any individual-level covariates will be aggregated to their cluster-level averages.*

### Data Structure
Here we provide an example of a data frame that can be used with `sreg`.
``` r
|       Y      | S | D | G_id | Ng |     X1     |      X2       |
|--------------|---|---|------|----|------------|---------------|
| -0.57773576  | 2 | 0 |  1   | 10 |  1.5597899 |  0.03023334   |
|  1.69495638  | 2 | 0 |  1   | 10 |  1.5597899 |  0.03023334   |
|  2.02033740  | 4 | 2 |  2   | 30 |  0.8747419 | -0.77090031   |
|  1.22020493  | 4 | 2 |  2   | 30 |  0.8747419 | -0.77090031   |
|  1.64466086  | 4 | 2 |  2   | 30 |  0.8747419 | -0.77090031   |
| -0.32365109  | 4 | 2 |  2   | 30 |  0.8747419 | -0.77090031   |
|  2.21008191  | 4 | 2 |  2   | 30 |  0.8747419 | -0.77090031   |
| -2.25064316  | 4 | 2 |  2   | 30 |  0.8747419 | -0.77090031   |
|  0.37962312  | 4 | 2 |  2   | 30 |  0.8747419 | -0.77090031   |
```
### Summary

`sreg` prints a *"Stata-style"* table containing the ATE estimates, corresponding standard errors, $t$-statistics, $p$-values, $95$% asymptotic confidence intervals, and significance indicators for different levels $\alpha$. The example of the printed output is provided below.
```stata
Saturated Model Estimation Results under CAR with clusters and linear adjustments
Observations: 24910
Clusters: 1000
Number of treatments: 2
Number of strata: 10
Covariates used in linear adjustments: X1, X2
---
Coefficients:
    Tau   As.se   T-stat  P-value  CI.left(95%)  CI.right(95%) Significance
0.13026 0.04220  3.08637  0.00203       0.04754        0.21297           **
0.47389 0.04558 10.39719  0.00000       0.38456        0.56322          ***
---
Signif. codes:  0 `***` 0.001 `**` 0.01 `*` 0.05 `.` 0.1 ` ` 1
```
### Empirical Example

Here, we provide the empirical application example using the data from (Chong et al., 2016), who studied the effect of iron deficiency anemia on school-age children's educational attainment and cognitive ability in Peru. The example replicates the empirical illustration from (Bugni et al., 2019). For replication purposes, the data is included in the package (please, look for a file `sreg_AEJapp.dta`).

We can upload the `sreg_AEJapp` dataset to Stata manually or by running (please, check the path to the file on your machine):
```
use "`c(sysdir_plus)'/s/sreg_AEJapp.dta", clear
```
It is pretty straightforward to prepare the data to fit the package syntax.
```
// Create the new variable D by recoding the treatment variable:
gen D = treatment
replace D = 0 if treatment == 3
// Generate the new cleaned dataset with the variables Y, D, S, X1, X2:
gen Y = gradesq34
gen S = class_level
gen X1 = pills
gen X2 = age
```
Create the frequency table for `D` and `S`:
```
table D S
```
```
-----------------------------------------
        |                 S              
        |   1    2    3    4    5   Total
--------+--------------------------------
D       |                                
  0     |  15   19   16   12   10      72
  1     |  16   19   15   10   10      70
  2     |  17   20   15   11   10      73
  Total |  48   58   46   33   30     215
-----------------------------------------

```
Ensure `D` and `S` are integers:
```
gen int D_int = int(D)
gen int S_int = int(S)

// Drop the original D and S columns and rename the new columns:
drop D S
rename D_int D
rename S_int S
```
Now, it is straightforward to replicate the results from (Bugni et al, 2019) using `sreg`:
```
sreg, y("Y") s("S") d("D")
```
```
Saturated Model Estimation Results under CAR
Observations: 215
Number of treatments: 2
Number of strata: 5
---
Coefficients:
     Tau   As.se   T-stat  P-value  CI.left(95%)  CI.right(95%) Significance
-0.05113 0.20645 -0.24766  0.80440      -0.45577        0.35351             
 0.40903 0.20651  1.98065  0.04763       0.00427        0.81379            *
---
Signif. codes:  0 `***` 0.001 `**` 0.01 `*` 0.05 `.` 0.1 ` ` 1
```
Besides that, `sreg` allows adding linear adjustments (covariates) to the estimation procedure:
```
sreg, y("Y") s("S") d("D") x("X1, X2") hc1(true)
```
```
Saturated Model Estimation Results under CAR with linear adjustments
Observations: 215
Number of treatments: 2
Number of strata: 5
Covariates used in linear adjustments: X1,  X2
---
Coefficients:
     Tau   As.se   T-stat  P-value  CI.left(95%)  CI.right(95%) Significance
-0.02862 0.17964 -0.15929  0.87344      -0.38071        0.32348             
 0.34609 0.18362  1.88477  0.05946      -0.01381        0.70598            .
---
Signif. codes:  0 `***` 0.001 `**` 0.01 `*` 0.05 `.` 0.1 ` ` 1
```

## The command `sreg_rgen`
Generates the observed outcomes, treatment assignments, strata indicators, cluster indicators, cluster sizes, and covariates for estimating the treatment effect following the stratified block randomization design under covariate-adaptive randomization (CAR).

### Syntax
```
sreg_rgen, n(1000) tau_vec("0.2,0.5") n_strata(10) cluster(true) is_cov(true)
```
### Arguments
- **`n` -** The total number of observations in the sample;
- **`n_strata` -** The number of strata;
- **`tau_vec` -** A `list` of treatment effects of length |A|, where |A| represents the number of treatments;
- **`cluster` -** A `boolean` indicating whether the data generation process (DGP) should use cluster-level treatment assignment (`true`) or individual-level treatment assignment (`false`);
- **`is_cov` -** A `boolean` indicating whether the DGP should include covariates (`true`) or not (`false`).

### Return Value
A sample of `n` observations containing the generated values of the following variables:
- **`Y` -** Observed outcomes;
- **`S` -** Strata indicators;
- **`D` -** Treatment assignments, indexed by $\{0, 1, 2, ...\}$, where `D = 0` denotes the control group;
- **`G_id` -** Cluster indicators;
- **`Ng` -** Cluster sizes;
- **`X` -** Covariate values.

### Example
```
sreg_rgen, n(1000) tau_vec("0.2,0.5") n_strata(10) cluster(false) is_cov(true)
```
```
            Y  S  D        X1        X2
0    1.166101  2  0  6.747262  1.434879
1    3.303377  9  0  6.114300  1.735095
2    0.677787  5  0  4.798843  1.314747
3    3.136298  3  2  4.144932  2.145634
4    4.044962  4  0  5.443766  3.516459
..        ... .. ..       ...       ...
995  2.408046  7  0  3.543350  1.063359
996  2.878681  4  0  3.780182  3.375438
997  4.351384  8  0  3.193739  2.195819
998  5.165974  5  0  2.599999  4.029998
999  3.003909  7  0  4.317746  2.287155

[1000 rows x 5 columns]
```

## References
Bugni, F. A., Canay, I. A., and Shaikh, A. M. (2018). Inference Under Covariate-Adaptive Randomization. *Journal of the American Statistical Association*, 113(524), 1784–1796, doi:10.1080/01621459.2017.1375934.

Bugni, F., Canay, I., Shaikh, A., and Tabord-Meehan, M. (2024+). Inference for Cluster Randomized Experiments with Non-ignorable Cluster Sizes. *Forthcoming in the Journal of Political Economy: Microeconomics*, doi:10.48550/arXiv.2204.08356.

Jiang, L., Linton, O. B., Tang, H., and Zhang, Y. (2023+). Improving Estimation Efficiency via Regression-Adjustment in Covariate-Adaptive Randomizations with Imperfect Compliance. *Forthcoming in Review of Economics and Statistics*, doi:10.48550/arXiv.2204.08356.
