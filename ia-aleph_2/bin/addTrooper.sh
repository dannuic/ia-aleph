#!/bin/bash

t=`mktemp`
echo '- ' > $t
for name in isc; do
	echo -n "  $name : "
	read value
	echo "  $name: $value" >> $t
done
code=`bin/nextDataCode.sh`
echo "  code: $code" >> $t
for name in faction logo name type classification mov cc bs ph wip arm bts w s ava cube irregular impetuous; do
        echo -n "  $name : "
        read value
	[ -z "$value" ] || echo "  $name: $value" >> $t
done
for name in skills equipments bsw ccw; do
        echo -n "  $name : "
        read value
        [ -z "$value" ] || echo "  $name: [ $value ]" >> $t
done
echo "  options:" >> $t

echo "## TROOPER DATA ##"
cat $t
echo "## TROOPER DATA ##"
echo "append data to troopers.yml?"
read
cat $t >> ./src/main/javascript/data/data/troopers.yml
rm $t

bin/addTrooperOption.sh 1

