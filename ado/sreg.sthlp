{smcl}
{bf:sreg: Stratified Randomized Experiments}

{title:Title}

    {hi:sreg} {c -} Estimate average treatment effects (ATEs) and corresponding standard errors
    
{title:Syntax}
{p 8 17 2}
{cmd:sreg} {it:y(varname)} {it:d(varname)} [{it:s(varname)}] [{it:x(varlist)}] [{it:g_id(varname)}] [{it:ng(varname)}] [{it:hc1(string)}]
 
{title:Description}
{pstd}
{cmd:sreg} estimates the ATE(s) and the corresponding standard error(s) for a (collection of) treatment(s) relative to a control within the context of a stratified block randomization design under the covariate-adaptive randomization.
{p_end}
{p 4 8}

{synoptset 22 tabbed}{...}
{synopthdr}
{synoptline}
{synopt:{opt y(varname)}} specifies the observed outcomes (dependent variable). {p_end}
{synopt:{opt d(varname)}} specifies the treatment variable indexed by {0, 1, 2, ...}, where d = 0 denotes the control.{p_end}
{synopt:{opt s(varname)}} (optional) specifies the strata variable (strata indicators indexed by {1, 2, 3, ...}); if not provided, then the estimation is performed assuming no stratification. {p_end}
{synopt:{opt x(varname)}} (optional) specifies a (collection of) covariate(s); if not provided, then the estimator without linear adjustments is applied. {it:(Note: {bf:sreg} cannot use individual-level covariates for covariate} {it:adjustment in cluster-randomized experiments. Any individual-level covariates will be aggregated to their} {it:cluster-level averages).} {p_end}
{synopt:{opt g_id(varname)}} (optional) specifies cluster identifiers; if not provided, then estimation is performed assuming treatment is assigned at the individual level. {p_end}
{synopt:{opt ng(varname)}} (optional) specifies the cluster sizes; if not provided, then {bf:ng} is assumed to be equal to the number of available observations in every cluster. {p_end}
{synopt:{opt hc1(string)}} (optional) specifies ({it:true/false}) whether the small sample correction should be applied to the variance estimator (HC1).

{ul:{bf:Examples}}

. sreg, y("Y") s("S") d("D") x("X1, X2") hc1(true)
. sreg, y("outcome") s("strata") d("treatment") x("age,exper") g_id("cluster_id") ng("Ng")

{ul:{bf:Authors}}

Authors: Juri Trifonov <jutrifonov@uchicago.edu>;
         Yuehao Bai <yuehao.bai@usc.edu>;
         Azeem Shaikh <amshaikh@uchicago.edu>;
         Max Tabord-Meehan <maxtm@uchicago.edu>
Maintainer: Juri Trifonov <jutrifonov@uchicago.edu>

For additional instructions and examples, please visit the {browse "https://github.com/jutrifonov/sreg_stata":sreg (Stata® Edition) GitHub Repository}.

{title:Saved Results}

{phang}
{cmd:sreg} saves the following in {cmd:e()}:{p_end}

{synoptset 15 tabbed}{...}
{p2col 5 15 19 2: Scalars}{p_end}

{synopt:{cmd:e(N)}}sample size{p_end}
{p2colreset}{...}

{synoptset 15 tabbed}{...}
{p2col 5 15 19 2: Matrices}{p_end}
{synopt:{cmd:e(tau)}}vector of ATE estimates{p_end}
{synopt:{cmd:e(se)}}vector of standard errors{p_end}
{synopt:{cmd:e(t)}}vector of t-statistics{p_end}
{synopt:{cmd:e(pval)}}vector of p-values{p_end}
{synopt:{cmd:e(ci)}}matrix of as. confidence intervals{p_end}
{p2colreset}{...}



{title:References}

{phang}
Bugni, F. A., Canay, I. A., and Shaikh, A. M. (2018). Inference Under Covariate-Adaptive Randomization. {it:Journal of the American Statistical Association}, 113(524), 1784–1796, doi:10.1080/01621459.2017.1375934.
{p_end}
{phang}
Bugni, F., Canay, I., Shaikh, A., and Tabord-Meehan, M. (2024+). Inference for Cluster Randomized Experiments with Non-ignorable Cluster Sizes. {it:Forthcoming in the Journal of Political Economy: Microeconomics}, doi:10.48550/arXiv.2204.08356.
{p_end}
{phang}
Jiang, L., Linton, O. B., Tang, H., and Zhang, Y. (2023+). Improving Estimation Efficiency via Regression-Adjustment in Covariate-Adaptive Randomizations with Imperfect Compliance. {it:Forthcoming in Review of Economics and Statistics},  doi:10.48550/arXiv.2204.08356.
{p_end}
