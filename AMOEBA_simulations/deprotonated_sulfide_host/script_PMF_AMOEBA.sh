#!/bin/bash
#SBATCH --clusters=htc
#SBATCH --gres=gpu:1 --constraint='gpu_sku:V100'
#SBATCH --time=12:00:00
#SBATCH --partition=short
#SBATCH --job-name=PMF_Cl_water
#SBATCH --nodes=1
#SBATCH --array=1-29 #0-29 #0-29
hostname
nvdia-smi

###    srun --gres=gpu:1 --pty /bin/bash
### srun --gres=gpu:1 --constraint='gpu_sku:V100' --pty /bin/bash
module load Tinker9
ls /apps/system/software/Tinker9/1.0.4-GIT-31839758/gpu-m/
module list

##### actual umbrella sampling
i=$((-${SLURM_ARRAY_TASK_ID}))
#i=${SLURM_ARRAY_TASK_ID}
r=2
mkdir restr$r
echo $i
cp bioDeProt_solvated_KCl_min.200 restr$r/deprot_KCl_$i.xyz
cd restr$r
dynamic9 deprot_KCl_${i}.xyz -k NPT_restr_${i}.key 6500000 2.0 1 4 298.15 1.0
cd ..

