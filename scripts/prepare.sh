PLXINST=/mnt/plx

echo "DOING THIS ON $PLXINST"

mkdir -pv $PLXINST/{dev,proc,sys,run}
mknod -m 600 $PLXINST/dev/console c 5 1
mknod -m 666 $PLXINST/dev/null c 1 3
mount -v --bind /dev $PLXINST/dev
mount -vt devpts devpts $PLXINST/dev/pts -o gid=5,mode=620
mount -vt proc proc $PLXINST/proc
mount -vt sysfs sysfs $PLXINST/sys
mount -vt tmpfs tmpfs $PLXINST/run

