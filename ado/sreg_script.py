import pandas as pd
import numpy as np
from sreg import sreg # Ensure these imports work in your Python environment

print("sreg_script is being imported")

#def run_sreg(Y=None, S=None, D=None, G_id=None, Ng=None, X=None, HC1=True):
#    result = sreg(Y=Y, S=S, D=D, G_id=G_id, Ng=Ng, X=X, HC1=HC1)
#    return result
def run_sreg(Y=None, S=None, D=None, G_id=None, Ng=None, X=None, HC1=True):
    print('WE ARE HERE!')
    # Convert inputs to NumPy arrays if they are not None
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
        X = pd.DataFrame(X)  # Assuming X is passed as a dictionary of lists
    result = sreg(Y=Y, S=S, D=D, G_id=G_id, Ng=Ng, X=X, HC1=HC1)
    return result