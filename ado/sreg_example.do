clear all

* 1. Simulated data under the cluster-level treatment assignment.
sreg_rgen, n(1000) tau_vec("0.2,0.5") n_strata(2) cluster(true) is_cov(true)

sreg, y("Y") s("S") d("D") x("X1,X2") g_id("G_id") ng("Ng") hc1(true)

* 2. Empirical example from (Chong et al., 2016).

use "`c(sysdir_plus)'/s/sreg_AEJapp.dta", clear

** Create the new variable D by recoding the treatment variable:
gen D = treatment
replace D = 0 if treatment == 3

** Generate the new cleaned dataset with the variables Y, D, and S:
gen Y = gradesq34
gen S = class_level
gen X1 = pills
gen X2 = age

** Create the frequency table for D and S:
table D S

** Ensure D and S are integers:
gen int D_int = int(D)
gen int S_int = int(S)

** Drop the original D and S columns and rename the new columns:
drop D S
rename D_int D
rename S_int S

** Now we can call the sreg command (with and without covariates):
sreg, y("Y") s("S") d("D") hc1(false)
sreg, y("Y") s("S") d("D") x("X1, X2") hc1(true)

