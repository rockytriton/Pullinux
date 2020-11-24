fullpck=$1
pck=$(basename $1)
p2=$2
dst=${p2:-/}

echo "Installing ${pck:?} to ${dst:?}..."

if [ -d "/tmp/_plxinst" ]; then
	rm -rf /tmp/_plxinst
fi

mkdir /tmp/_plxinst
cp $fullpck /tmp/_plxinst

tar -xf /tmp/_plxinst/$pck -C /tmp/_plxinst ./.dep 2> /dev/null

if [ -f "/tmp/_plxinst/.dep" ]; then
	echo "Has Dependencies:"
	cat /tmp/_plxinst/.dep
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

rm -rf _install

