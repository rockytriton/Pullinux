ending="-pullinux-1.1.0.tar.xz"

for p in $(cat kde_packages.txt)
do
	pckname=$(basename -s $ending $p)

	g=$(grep $pckname $PLXINST/usr/share/pullinux/pcklist.txt)

	if [ "$g" == "" ]; then
		echo "     NOT FOUND: $pckname"
	fi

done;
