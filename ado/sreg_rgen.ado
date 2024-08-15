*! version 1.0.0 Aug2024
program define sreg_rgen
    syntax, n(integer) n_max(integer) tau_vec(string) n_strata(integer) cluster(string) is_cov(string)

    python: import sys; from sreg_rgen_script import run_sreg_rgen; n = int("`n'"); n_max = int("`n_max'"); tau_vec = [float(i) for i in "`tau_vec'".split(",")]; n_strata = int("`n_strata'"); cluster = "`cluster'".lower() == "true"; is_cov = "`is_cov'".lower() == "true"; data_sim = run_sreg_rgen(n, 50, n_strata, tau_vec, [0.4, 0.2, 1], cluster, is_cov); print(data_sim); data_sim.to_stata("sim_data.dta")
	use sim_data.dta, clear
    erase sim_data.dta
end



