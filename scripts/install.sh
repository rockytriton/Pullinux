PLXINST=$1

echo "Installing to $PLXINST"
echo "Press any key to continue..."

read -n 1

echo "Copying tools..."
#cp -r ../tools $PLXINST/

echo "Copying scripts..."
cp -r ../scripts $PLXINST/

echo "Copying packages..."
#cp -r ../packages $PLXINST/

./prepare.sh

chroot "$PLXINST" /tools/bin/env -i HOME=/root TERM="$TERM" PS1='(plx chroot) \u:\w\$ ' \
	        PATH=/bin:/usr/bin:/sbin:/usr/sbin:/tools/bin \
		        /scripts/install-chroot-1.sh

chroot "$PLXINST" /usr/bin/env -i HOME=/root TERM="$TERM" PS1='<pullinx-chroot> \u:\w\$ ' \
	PATH=/bin:/usr/bin:/sbin:/usr/sbin \
	/scripts/install-chroot-2.sh

echo ""
echo "Installation Complete"
echo ""
