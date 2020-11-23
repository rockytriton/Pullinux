export KF5_PREFIX=/opt/kf5
export QT5BINDIR=/opt/qt5/bin
export QT5DIR=/opt/qt5
export QT5PREFIX=/opt/qt5
export QT_PLUGIN_PATH=/opt/kf5/lib/plugins:/opt/kf5/lib/plugins/kcms:/opt/qt5/plugins

for f in $(cat /scripts/kde_packages.txt)
do
	echo "Installing $f..."

	if bash /scripts/pckinst.sh /packages/$f ; then
		echo "      success"
	else
		echo "FAILED"
		exit 1
	fi	
done;

