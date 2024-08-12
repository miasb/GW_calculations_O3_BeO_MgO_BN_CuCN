from pyscf import tools
from pyscf import gto, dft, gw, tdscf, scf
from pyscf.gw import gw_exact
from pyscf.tdscf import rhf_slow
import numpy as np
import numpy 
import matplotlib.pyplot as plt
from functools import reduce
from pyscf import lib
einsum = lib.einsum

if __name__ == "__main__":
    # Geometry
    mgo = "Mg 0 0 0; O 0 0 1.749" 
    # HOMO and LUMO level
    idx1 = 9
    idx2 = 10

    # Basis set
    mol = gto.M(
        atom = mgo,
        basis = "def2qzvp",
        )

    # Mean-Field Calculation
    mf = dft.RKS(mol)
    mf.xc = 'pbe0'
    mf.kernel()
    # Exact excitations for the propagator
    # Can be skipped for default RPA  calculation
    n_occ = mol.nelectron//2
    n_vir = mf.mo_energy.size - n_occ
    
     
    #Uncomment for TDDFT
    tdmf = tdscf.TDDFT(mf)
    tdmf.positive_eig_threshold  =  1e-4
    tdmf.kernel(nstates=n_occ * n_vir)

    print("DFT MO energy [eV]:",  mf.mo_energy[idx1]*27.2114)
