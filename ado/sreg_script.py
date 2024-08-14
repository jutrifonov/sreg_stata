import pandas as pd
import numpy as np
from sreg import sreg

def run_sreg(Y=None, S=None, D=None, G_id=None, Ng=None, X=None, HC1=True):
    if Y is not None:
        Y = np.array(Y)
    if S is not None:
        S = np.array(S)
    if D is not None:
        D = np.array(D)
    if G_id is not None:
        G_id = np.array(G_id)
    if Ng is not None:
        Ng = np.array(Ng)
    if X is not None:
        X = pd.DataFrame(X)
    result = sreg(Y=Y, S=S, D=D, G_id=G_id, Ng=Ng, X=X, HC1=HC1)
    return result
