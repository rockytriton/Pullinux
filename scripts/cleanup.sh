echo "Installing in ${PLXINST:?}"

chown root:root $PLXINST/
chown -R root:root $PLXINST/lib64

umount -v $PLXINST/dev/pts
umount -v $PLXINST/dev
umount -v $PLXINST/run
umount -v $PLXINST/proc
umount -v $PLXINST/sys

