pck=$1
pcklist=$2
pckname=${pck:?}

if [ "$pcklist" == "" ]; then
	pcklist=/usr/share/pullinux/pcklist.txt
fi

for f in $(cat $pcklist)
do
	if [ "$f" == "$pckname" ]; then
		exit 0
	fi
done;

exit 1
