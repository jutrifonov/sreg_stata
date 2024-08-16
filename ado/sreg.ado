*! version 1.0.0 Aug2024
// program define sreg
//     syntax, y(string) d(string) [s(string) x(string) g_id(string) ng(string) hc1(string)]
//
//     python: import sys; from sreg_script import run_sreg; import numpy as np; import pandas as pd; from sfi import Data; Y = np.array(Data.get("`y'")); S = np.array(Data.get("`s'")) if "`s'" != "" else None; D = np.array(Data.get("`d'")); X_vars = "`x'".split(",") if "`x'" != "" else []; X = pd.DataFrame({var: Data.get(var) for var in X_vars}) if X_vars else None; G_id = np.array(Data.get("`g_id'")) if "`g_id'" != "" else None; Ng = np.array(Data.get("`ng'")) if "`ng'" != "" else None; HC1 = "`hc1'" if "`hc1'" != "" else "true"; HC1 = HC1.lower() == "true"; result = run_sreg(Y, S=S, D=D, G_id=G_id, Ng=Ng, X=X, HC1=HC1); print(result)
// end

*! version 1.0.0 Aug2024
program define sreg 
	syntax, y(string) d(string) [s(string) x(string) g_id(string) ng(string) hc1(string)] 
	
	python: import sys; from sreg_script import run_sreg; import numpy as np; import pandas as pd; from sfi import Data, Scalar, Matrix, Macro; Y = np.array(Data.get("`y'")); S = np.array(Data.get("`s'")) if "`s'" != "" else None; D = np.array(Data.get("`d'")); X_vars = "`x'".split(",") if "`x'" != "" else []; X = pd.DataFrame({var: Data.get(var) for var in X_vars}) if X_vars else None; G_id = np.array(Data.get("`g_id'")) if "`g_id'" != "" else None; Ng = np.array(Data.get("`ng'")) if "`ng'" != "" else None; HC1 = "`hc1'" if "`hc1'" != "" else "true"; HC1 = HC1.lower() == "true"; result = run_sreg(Y, S=S, D=D, G_id=G_id, Ng=Ng, X=X, HC1=HC1); print(result); Scalar.setValue("e(N)", Y.shape[0]); Matrix.store("e(tau)", np.array(result['tau_hat']).tolist()); Matrix.store("e(se)", np.array(result['se_rob']).tolist()); Matrix.store("e(t)", np.array(result['t_stat']).tolist()); Matrix.store("e(pval)", np.array(result['p_value']).tolist()); Matrix.store("e(ci)", np.array(result['as_CI']).tolist())
end



