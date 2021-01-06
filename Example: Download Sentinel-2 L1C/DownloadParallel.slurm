#!/bin/bash
#SBATCH --ntasks 20
#SBATCH --cpus-per-task 2
#SBATCH --output output.out


parallel_opts=$(/home/kes20012/parallel-slurm/parallel_opts.sh)

module load parallel


# Run parameter index set by the SLURM array index.
# SLURM_NTASKS will give us the core ID at seq, like 1, 2, 3, 4, ....
# parallel ${parallel_opts} bash trigerMatlab.bash ::: $(seq $SLURM_NTASKS) ::: $SLURM_NTASKS
parallel ${parallel_opts} bash batchDownloadSentinel2_S2MSI1C.sh ::: $(seq $SLURM_NTASKS) ::: $SLURM_NTASKS



# ----------------------------------------------------------------------------------
# This page desribe how to run Matlab function at SLURM Parallel in UCONN HPC
# Created by Shi Qiu (shi.qiu@uconn.edu) (Sept. 9, 2020)
# Other Contributions: Tian Li (provide the script example)
# More information at https://slurm.schedmd.com/sbatch.html
# ----------------------------------------------------------------------------------
#
# How to use?
# Step 1: Clone parallel-slurm.git from https://github.uconn.edu/HPC/parallel-slurm @ your home directory
# Step 2: Replace the file path in parallel_opts using the upper parallel-slurm.git
# Step 3: Set the working directory and/or other parameters of matlab function in trigerMatlab.bash (in which you would like to set the matlab function)
# Step 4: sbatch DownloadParallel1.slurm
# Note: --ntasks is to label how many cores you want to require, and you change it, but not exceed 192.
