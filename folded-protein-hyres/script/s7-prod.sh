#!/bin/bash

CHARMM=/home/xrliu/program/charmm/c35b2m-mpi/exec/em64t/charmm
mpi=/home/xrliu/program/openmpi/openmpi-3.0.0/build-intel/bin/mpirun



newdir=../s7-prod
mkdir -p $newdir


$mpi -np 8 $CHARMM pdbid=p53 nstep=500000 run=1 -i s7-prod.inp |tee $newdir/s7-prod-1.out  




                                                                                                             
                                                                                                             
                                                                                                             


