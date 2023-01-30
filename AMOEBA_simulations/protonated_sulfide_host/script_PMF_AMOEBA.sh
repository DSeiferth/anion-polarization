#!/bin/bash
#SBATCH --clusters=htc
#SBATCH --gres=gpu:1 --constraint='gpu_sku:V100'
#SBATCH --time=12:00:00
#SBATCH --job-name=PMF_Cl_water
#SBATCH --partition=short
#SBATCH --nodes=1
#SBATCH --array=1-29 #0-29
hostname
nvdia-smi

module load Tinker9
ls /apps/system/software/Tinker9/1.0.4-GIT-31839758/gpu-m/
module list

##### actual umbrella sampling
#i=${SLURM_ARRAY_TASK_ID}
i=$((-${SLURM_ARRAY_TASK_ID}))
r=2
mkdir restr$r
echo $i
cp bioNoMeth_KCl_aligned.xyz restr$r/bioNoMeth_KCl_$i.xyz
cd restr$r
dynamic9 bioNoMeth_KCl_${i}.xyz -k NPT_restr_${i}.key 6500000 2.0 1 4 298.15 1.0
cd ..

