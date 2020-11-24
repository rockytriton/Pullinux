fullpck=$1
pck=$(basename $1)
p2=$2
dst=${p2:-/}
ending="-pullinux-1.1.0.tar.xz"
pckname=$(basename -s $ending $pck)
pcklist=/usr/share/pullinux/pcklist.txt

found=$(grep -E "^$pckname$" $pcklist)
scdir=$(dirname $0)

$scdir/checkinst.sh $pckname $pcklist

if [ $? -eq 0 ]; then
	echo "$pckname already installed."
        exit -1
else
	echo "Installing ${pck:?} to ${dst:?}..."
fi

if [ -d "/tmp/_plxinst" ]; then
	rm -rf /tmp/_plxinst
fi

mkdir /tmp/_plxinst
cp $fullpck /tmp/_plxinst

tar -xf /tmp/_plxinst/$pck -C /tmp/_plxinst ./.dep 2> /dev/null

if [ -f "/tmp/_plxinst/.dep" ]; then
	echo "    Dependencies:"
	deps=$(cat /tmp/_plxinst/.dep)
	rm /tmp/_plxinst/.dep

	for f in $deps
	do
		found=$(grep -E "^$f$" $pcklist)

		$scdir/checkinst.sh $f $pcklist

		if [ $? -eq 0 ]; then
			echo "        $f already installed."	
			continue
		fi

		$0 $(dirname $fullpck)/$f$ending $dst

		if [ $? -eq 0 ]; then
			echo "ok"
		else
			echo "Failed to install dependency!"
			exit -1
		fi
	done;

else
	echo "No Dependencies"
fi

cd $dst
tar -hxf $fullpck

if [ -f "_install/preinstall.sh" ]; then
	cd _install
	    if bash preinstall.sh ; then
                    echo "preinstalled..."
            else
                    echo "Failed to preinstall."
                    exit 1
            fi
	cd ..
fi

if [ -f "_install/install.sh" ]; then
        cd _install
	if bash install.sh ; then
                echo "installed."
        else
                echo "Failed to install."
                exit 1
        fi
	cd ..
fi

rm -rf .dep 2> /dev/null || true
rm -rf _install || true
rm -rf /tmp/_plxinst || true

echo $pckname >> $pcklist

echo "Installing $pckname complete."
