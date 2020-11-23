pck=$1
p2=$2
dst=${p2:-/}

echo "Installing ${pck:?} to ${dst:?}..."

cd $dst
tar -hxf $pck

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

