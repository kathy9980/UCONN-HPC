#!/bin/sh
#$ -V
#$ -cwd
#$ -S /bin/bash
#$ -N DownS2
#$ -q omni
#$ -pe sm 1
#$ -P quanah
#$ -t 1-1:1


. $HOME/miniconda3/etc/profile.d/conda.sh
conda activate


cd /scratch/kes20012/S2_CT/TOA/2019/
python /home/kes20012/API2DownloadSentinelData/batchDownloadSentinel2_S2MSI1C.py \;exit\;
