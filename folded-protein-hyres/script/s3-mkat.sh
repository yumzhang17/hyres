#!/bin/bash

newdir=../s3-mkat

## This is the charmm version that can run mpi run (use multiple CPUs)
## (Atomistic CHARMM)
charmm=/home/xrliu/program/charmm/c35b2m-mpi/exec/em64t/charmm
mpi=/home/xrliu/program/openmpi/openmpi-3.0.0/build-intel/bin/mpirun

mkdir -p $newdir
inpdir=../s2-clean
for i in p53
do
     echo $i
     ## you can change the number 4 (after -np) to any others to apply different numbers of CPUs
     $mpi -np 4 $charmm pdbid=$i  segid=$i inpdir=$inpdir -i s3-mkat.inp |tee  $newdir/$i.out 
done

