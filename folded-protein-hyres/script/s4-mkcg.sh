#!/bin/bash


newdir=../s4-mkcg
mkdir -p $newdir
for i in p53 
do
    echo $i
    inp=../s3-mkat/$i.pdb
    out=$newdir/$i.pdb
    python at2cg.py $inp $out
    sed -i 's/_/ /g' $out
done
