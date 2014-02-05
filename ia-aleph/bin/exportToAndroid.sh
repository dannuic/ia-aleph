#!/bin/bash

target=~/svn/ia-aleph/ia-aleph_android_2/res/raw/

cd ~/svn/ia-aleph/ia-aleph/src/main/javascript/data/

echo "packaging data to $target"
{
	echo '['
	for file in ia-data_36_* ia-data_37*; do
		cat $file
		echo ','
	done
	cat ia-data_38*
	echo ']'
} > $target/armylist_data.json

#cat ia-data_*_specs.js > $target/specs_data.js
cat ia-data_*_weapons_data.json > $target/weapons_data.json
cat ia-data_*_sectorials_data.json > $target/sectorials_data.json

echo "copying icons"
{
	for file in ~/svn/ia-aleph/ia-aleph/src/main/webapp/images/*_logo.png; do
		newName="unitlogo_`basename "$file" | sed 's#_logo##'`"
		cp -l "$file" ~/svn/ia-aleph/ia-aleph_android_2/res/drawable/"$newName"
	done
}



#pushd src/main/webapp/ || exit
#rsync -crv data images "${target}"/
#popd

#cd  target/ia-aleph/ || exit
#rm "${target}"/wiki*/*
#rsync -crv js/data/ "${target}"/


