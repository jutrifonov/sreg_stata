{smcl}
{bf:sreg: Stratified Randomized Experiments}

{title:Title}

    {hi:sreg_rgen} {c -} Generate a pseudo-random sample under the stratified block randomization design
    
{title:Syntax}
{p 8 17 2}
{cmd:sreg_rgen}, {it:n(integer)} {it:tau_vec(string)} {it:n_strata(integer)} {it:cluster(boolean)} {it:is_cov(boolean)}
 
{title:Description}
{pstd}
{cmd:sreg_rgen} generates the observed outcomes, treatment assignments, strata indicators, cluster indicators, cluster sizes, and covariates for estimating the treatment effect following the stratified block randomization design under CAR.
{p_end}
{p 4 8}

{synoptset 22 tabbed}{...}
{synopthdr}
{synoptline}
{synopt:{opt n(varname)}} specifies the total number of observations in the sample. {p_end}
{synopt:{opt n_strata(varname)}} specifies the number of strata. {p_end}
{synopt:{opt tau_vec(string)}} specifies the list of treatment effects of length |A|, where |A| represents the number of treatments. {p_end}
{synopt:{opt cluster(boolean)}} specifies whether the data generating process (DGP) should use cluster-level treatment assignment (true) or individual-level treatment assignment (false). {p_end}
{synopt:{opt is_cov(boolean)}} specifies whether the DGP should include covariates (true) or not (false). {p_end}

{ul:{bf:Examples}}

. sreg_rgen, n(1000) tau_vec("0.2,0.5") n_strata(10) cluster(false) is_cov(true)

{ul:{bf:Authors}}

Authors: Juri Trifonov <jutrifonov@uchicago.edu>;
         Yuehao Bai <yuehao.bai@usc.edu>;
         Azeem Shaikh <amshaikh@uchicago.edu>;
         Max Tabord-Meehan <maxtm@uchicago.edu>
Maintainer: Juri Trifonov <jutrifonov@uchicago.edu>

For additional instructions and examples, please visit the {browse "https://github.com/jutrifonov/sreg_stata":sreg (Stata® Edition) GitHub Repository}.

{title:Saved Results}

{phang}
{cmd:sreg_rgen} generates a data set of the following form:{p_end}

{synoptset 15 tabbed}{...}             Y  S  D  G_id  Ng        X1        X2

{synoptset 15 tabbed}{...}0     1.733520  6  1     1  30 -0.141660  0.491757

{synoptset 15 tabbed}{...}1     1.500786  6  1     1  30 -0.141660  0.491757

{synoptset 15 tabbed}{...}2     1.653878  6  1     1  30 -0.141660  0.491757

{synoptset 15 tabbed}{...}3     0.372387  6  1     1  30 -0.141660  0.491757

{synoptset 15 tabbed}{...}4     0.161457  6  1     1  30 -0.141660  0.491757

{synoptset 15 tabbed}{...}...        ... .. ..   ...  ..       ...       ...

{synoptset 15 tabbed}{...}2365 -1.676291  3  0   100  40 -0.149203 -1.558078

{synoptset 15 tabbed}{...}2366 -2.677169  3  0   100  40 -0.149203 -1.558078

{synoptset 15 tabbed}{...}2367 -1.520893  3  0   100  40 -0.149203 -1.558078

{synoptset 15 tabbed}{...}2368 -2.423779  3  0   100  40 -0.149203 -1.558078

{synoptset 15 tabbed}{...}2369 -1.656202  3  0   100  40 -0.149203 -1.558078


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
