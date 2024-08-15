*! version 1.0.0 Aug2024
program define sreg
    syntax, Y(string) D(string) [s(string) x(string) gid(string) ng(string) hc1(string)]

    python: import sys; from sreg_script import run_sreg; import numpy as np; import pandas as pd; from sfi import Data; Y = np.array(Data.get("`Y'")); S = np.array(Data.get("`s'")) if "`s'" != "" else None; D = np.array(Data.get("`D'")); X_vars = "`x'".split(",") if "`x'" != "" else []; X = pd.DataFrame({var: Data.get(var) for var in X_vars}) if X_vars else None; G_id = np.array(Data.get("`gid'")) if "`gid'" != "" else None; Ng = np.array(Data.get("`ng'")) if "`ng'" != "" else None; HC1 = "`hc1'" if "`hc1'" != "" else "true"; HC1 = HC1.lower() == "true"; result = run_sreg(Y, S=S, D=D, G_id=G_id, Ng=Ng, X=X, HC1=HC1); print(result)
end
