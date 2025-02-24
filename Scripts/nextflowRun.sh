#!/bin/bash
#SBATCH --job-name=Ceci_test
#SBATCH --time=24:00:00  # hh:mm:ss
#
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=4000  # megabytes
#SBATCH --partition=batch
#
#SBATCH --mail-user=henry.del.marmol@ulb.be
#SBATCH --mail-type=ALL

module purge
module load Java/11.0.20

WORKDIR=/globalscratch/ulb/mlg/hdmarmol/smalltest
#mkdir -p $WORKDIR
cd $WORKDIR

export SINGULARITY_CACHEDIR=/globalscratch/ulb/mlg/hdmarmol/caches
export APPTAINER_CACHEDIR=/globalscratch/ulb/mlg/hdmarmol/caches

/home/ulb/bctr/bbeahan/nextflow -c /home/ulb/mlg/hdmarmol/maestriNanolympicMod/myNanolympics/NanOlympicsMod/pipeline.conf run /home/ulb/mlg/hdmarmol/maestriNanolympicMod/myNanolympics/NanOlympicsMod/pipeline.nf