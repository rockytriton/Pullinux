echo ""
echo ""
echo "Installing $1..."
echo ""

rm -rf /_install
rm -rf /tmp/pullit

cd /
tar -xf $1

if test -d "/_install"; then
	echo "moving install..."
	mkdir -p /tmp/pullit/
	mv /_install /tmp/pullit/
fi

if test -f "/tmp/pullit/_install/preinstall.sh"; then
	echo "running pre-install..."
	chmod u+x /tmp/pullit/_install/preinstall.sh
	/tmp/pullit/_install/preinstall.sh
fi

if test -f "/tmp/pullit/_install/install.sh"; then
	echo "running install..."
	chmod u+x /tmp/pullit/_install/install.sh 
	/tmp/pullit/_install/install.sh
fi 

if test -d "/tmp/pullit/_install"; then
	rm -rf /tmp/pullit/_install
fi

echo ""
echo "DONE"
echo ""
echo ""

