#!/bin/bash
#SBATCH --clusters=htc
#SBATCH --gres=gpu:1 --constraint='gpu_sku:V100'
####SBATCH --gres=gpu:v100:1
###SBATCH --clusters=arc
#SBATCH --time=12:00:00
#SBATCH --job-name=Cl_D_sulf_PMF_water_deprot
#SBATCH --partition=short
#SBATCH --nodes=1
###SBATCH --exclusive
#SBATCH --mail-type=ALL
#SBATCH --array=0-29 #0-29
hostname
nvdia-smi

###    srun --gres=gpu:1 --pty /bin/bash
### srun --gres=gpu:1 --constraint='gpu_sku:V100' --pty /bin/bash
module load Tinker9
ls /apps/system/software/Tinker9/1.0.4-GIT-31839758/gpu-m/
module list

##### actual umbrella sampling
i=${SLURM_ARRAY_TASK_ID}
#i=$((-${SLURM_ARRAY_TASK_ID}))
r=2
mkdir restr$r
echo $i
fname=deprot_sulf_KCl
cp $fname.xyz restr$r/${fname}_$i.xyz
cd restr$r
dynamic9 ${fname}_${i}.xyz -k NPT_restr_${i}.key 6500000 2.0 1 4 298.15 1.0
cd ..
