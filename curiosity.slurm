#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=3-00:00:00
#SBATCH --partition=bii-gpu
#SBATCH --account=bii_dsc_community
#SBATCH --gres=gpu:a100:4
#SBATCH --reservation=bi_fox_dgx
#SBATCH --job-name=small-training
#SBATCH --output=%u-%j.out
#SBATCH --error=%u-%j.err
#SBATCH --mem=256G
#SBATCH --exclusive

date
nvidia-smi
module purge
module load apptainer anaconda

conda deactivate
conda activate redteam
export PYTHONPATH=$(pwd):$PYTHONPATH
which python
which pip 
pip show experiments
GPUS='0,1,2,3'
USER_SCRATCH=/scratch/$USER
HOME=$USER_SCRATCH/NLPproject/curiosity_redteam
cd $HOME
python nltk_download.py
python experiments/imdb_toxicity_response/run_ppo.py --mode local --gpus $GPUS
