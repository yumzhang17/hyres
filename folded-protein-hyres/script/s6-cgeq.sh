#!/bin/bash

# this charmm is required to run HyRes simulation
# @pikes, faster node
# -------------------
# GCC
module load gcc/6.1.0
export GCCTK=/cm/local/apps/gcc/6.1.0
export CC=$GCCTK/bin/gcc
export CXX=$GCCTK/bin/g++
# OPENMM
LOCAL=/home/ping/programs/openmm/build/7.5.0
export OPENMM_DIR=$LOCAL
export OPENMM_LIB_PATH=$LOCAL/lib
export OPENMM_INCLUDE_PATH=$LOCAL/include/
export OPENMM_PLUGIN_DIR=$LOCAL/lib/plugins
# CUDA
module load cuda/10.1.243
export CUDATK=/cm/shared/apps/cuda/10.1.243
export PATH=$CUDATK/lib64:$PATH
export PATH=$CUDATK/lib64/stubs:$PATH
export PATH=$CUDATK/bin:$PATH
export OPENMM_CUDA_COMPILER=$CUDATK/bin/nvcc

chmhyres='/home/ping/programs/charmm/build/hyres/charmm'

newdir=../s6-cgeq
mkdir -p $newdir

pdbid=p53
for i in 1
do
   $chmhyres run=$i pdbid=$pdbid newdir=$newdir nstep=10000 firstt=100 finalt=300 -i s6-cgeq.inp |tee $newdir/s6-cgeq-$i.out 
done
