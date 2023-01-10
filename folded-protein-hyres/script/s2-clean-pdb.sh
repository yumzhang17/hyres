#!/bin/bash

old=../s1-pdb
newdir=../s2-clean
mkdir -p $newdir

i=p53
inp=$old/$i.pdb
outp=$newdir/$i-clean.pdb
#This command will clean the pdb file to the format that can be easily recognized by CHARMM
convpdb.pl -model 1 -nohetero -renumber 1 -out charmm22 $newdir/$inp > $outp



