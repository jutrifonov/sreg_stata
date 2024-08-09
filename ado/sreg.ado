// program define sreg
//     syntax, Y(string) S(string) D(string) X(string) [Gid(string) Ng(string) HC1(string)]
//
//     python print("HELLO we are chillin!"); import sys; import pandas as pd; sys.path.append("/Users/trifonovjuri/Library/Application Support/Stata/ado/plus/sreg_script.py"); from sreg_script import run_sreg; Y = "`Y'"; S = "`S'"; D = "`D'"; X = "`X'"; Y = [st.data(i) for i in Y.split()]; S = [st.data(i) for i in S.split()]; D = [st.data(i) for i in D.split()]; X = pd.DataFrame({col: [st.data(i) for i in X.split()] for col in X.split(",")}); print(Y); result = run_sreg(Y=Y, S=S, D=D, X=X);print(result)
// end
*! version 1.0.0 20Aug2023
*! version 1.0.0 20Aug2023
// program define sreg
//     syntax, y(string) s(string) d(string) x(string)
//
//     python: import sys; sys.path.append("/Users/trifonovjuri/Library/Application Support/Stata/ado/plus"); from sreg_script import run_sreg; import numpy as np; import pandas as pd; from sfi import Data; Y = np.array(Data.get("`y'")); S = np.array(Data.get("`s'")) if "`s'" != "" else None; D = np.array(Data.get("`d'")); X = pd.DataFrame(np.array(Data.get("`x'")).reshape((-1, len("`x'".split()))), columns="`x'".split()) if "`x'" != "" else None; result = run_sreg(Y, S=S, D=D, X=X); print(result)
// end

// *! version 1.0.0 20Aug2023
// program define sreg
//     syntax, y(string) s(string) d(string) x(string)
//
//     python: import sys; sys.path.append("/Users/trifonovjuri/Library/Application Support/Stata/ado/plus"); from sreg_script import run_sreg; import numpy as np; import pandas as pd; from sfi import Data; Y = np.array(Data.get("`y'")); S = np.array(Data.get("`s'")) if "`s'" != "" else None; D = np.array(Data.get("`d'")); X_vars = "`x'".split(","); X = pd.DataFrame({var: Data.get(var) for var in X_vars}) if "`x'" != "" else None; result = run_sreg(Y, S=S, D=D, X=X); print(result)
// end

*! version 1.0.0 20Aug2023
// program define sreg
//     syntax, y(string) s(string) d(string) x(string) [gid(string) ng(string) hc1(string)]
//
//     python: import sys; sys.path.append("/Users/trifonovjuri/Library/Application Support/Stata/ado/plus"); from sreg_script import run_sreg; import numpy as np; import pandas as pd; from sfi import Data; Y = np.array(Data.get("`y'")); S = np.array(Data.get("`s'")) if "`s'" != "" else None; D = np.array(Data.get("`d'")); X_vars = "`x'".split(","); X = pd.DataFrame({var: Data.get(var) for var in X_vars}) if "`x'" != "" else None; G_id = np.array(Data.get("`gid'")) if "`gid'" != "" else None; Ng = np.array(Data.get("`ng'")) if "`ng'" != "" else None; HC1 = True if "`hc1'" == "" else "`hc1'".lower() == "true"; result = run_sreg(Y, S=S, D=D, G_id=G_id, Ng=Ng, X=X, HC1=HC1); print(result)
// end

// *! version 1.0.0 20Aug2023
// program define sreg
//     syntax, y(string) [s(string) d(string) x(string) gid(string) ng(string) hc1(string)]
//
//     python: import sys; sys.path.append("/Users/trifonovjuri/Library/Application Support/Stata/ado/plus"); from sreg_script import run_sreg; import numpy as np; import pandas as pd; from sfi import Data; Y = np.array(Data.get("`y'")); S = np.array(Data.get("`s'")) if "`s'" != "" else None; D = np.array(Data.get("`d'")); X_vars = "`x'".split(",") if "`x'" != "" else []; X = pd.DataFrame({var: Data.get(var) for var in X_vars}) if X_vars else None; G_id = np.array(Data.get("`gid'")) if "`gid'" != "" else None; Ng = np.array(Data.get("`ng'")) if "`ng'" != "" else None; HC1 = "`hc1'" if "`hc1'" != "" else "true"; HC1 = HC1.lower() == "true"; result = run_sreg(Y, S=S, D=D, G_id=G_id, Ng=Ng, X=X, HC1=HC1); print(result)
// end

*! version 1.0.0 20Aug2023
program define sreg
    syntax, y(string) d(string) [s(string) x(string) gid(string) ng(string) hc1(string)]

    python: import sys; sys.path.append("/Users/trifonovjuri/Library/Application Support/Stata/ado/plus"); from sreg_script import run_sreg; import numpy as np; import pandas as pd; from sfi import Data; Y = np.array(Data.get("`y'")); S = np.array(Data.get("`s'")) if "`s'" != "" else None; D = np.array(Data.get("`d'")); X_vars = "`x'".split(",") if "`x'" != "" else []; X = pd.DataFrame({var: Data.get(var) for var in X_vars}) if X_vars else None; G_id = np.array(Data.get("`gid'")) if "`gid'" != "" else None; Ng = np.array(Data.get("`ng'")) if "`ng'" != "" else None; HC1 = "`hc1'" if "`hc1'" != "" else "true"; HC1 = HC1.lower() == "true"; result = run_sreg(Y, S=S, D=D, G_id=G_id, Ng=Ng, X=X, HC1=HC1); print(result)
end
