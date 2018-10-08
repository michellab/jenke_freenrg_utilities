#!/bin/bash
# this script assumes flare smol.sdf output

for file in *.sdf; do

	posename=$(echo "$file" | cut -f 1 -d '.')

	obabel $posename".sdf" -O $posename".pdb" &> stdout.err
	
	mkdir $posename
	mv $posename.pdb ./$posename/ligand.pdb
	echo "Created pose directory for:" $posename
done

rm *.sdf
rm stdout.err		# comment to view obabel stdout

# for file in poses/*/; do python setmeup.py $(basename $file); done		#run in fesetup/
# ignore setup-*.in; just run fesetup morph.in (with indicated morph pairs)



