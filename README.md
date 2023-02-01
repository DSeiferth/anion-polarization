# anion-polarization
Effects of induced polarization on the nanoscale behaviour of anions in synthetic carriers

This repositiory contains all files to reproduce the PMF simulations with different ion carriers in different solvents with two different force fields (nonpolarisable parsley force field and polarisable AMOEBA force field):
1) biotin[6]uril
2) biotin-D-sulfoxide
3) biotin-L-sulfoxide

Anion binding shows strong solvent dependency.  In water, the binding strengths are in the order iodide > bromide > chloride, whereas in acetonitrile this trend is reversed. 
In acetonitrile, the carboyxl groups of the side chains are methylated (biotin[6]uril hexamethyl ester). In water, the carboxyl groups of the side chain can be either protonated or deprotonated (biotin[6]uril hexaacid).
### AMOEBA_simulations
- the xyz-file contains the simulation box (ion carrier, solvent, ions) with chloride placed centrally in the cavity
- the key-file contains all simulation paramters for a tinker9 simulation. The line with the keyword "RESTRAIN-PLANE X" can be updated by the perl script for each umbrella window.
- the perl script 'write_key2.pl' can be used to create the key file for each umbrella window and updates the "RESTRAIN-PLANE X"-line
- the prm-file contains all AMOEBA parameter for the respective system
- the sh-file is a script for job submission on a computing cluster
### parsley_simulations
- the itp folder contains all force field parameters needed for the respective system
- the MDP folder contains all simualtion paramters and a perl script to update the mdp-files for each umbrella window
- the gro-file contains the simulation box (ion carrier, solvent, ions) with chloride placed centrally in the cavity
- the file "carbon_cav.itp" defines which atoms are position restrained to retain the orientation of the ion carrier
- the index-file defined all index groups for gromacs simulations
- the sh-file is a script for job submission on a computing cluster
- the "topol.top" file loads force field parameter from the itp folder and dfinesthe sysyem and molecules
