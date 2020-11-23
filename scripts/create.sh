echo "Installing in ${PLXINST:?}"

mkdir -pv $PLXINST/{bin,boot,etc/{opt,sysconfig},home,lib/firmware,mnt,opt}
mkdir -pv $PLXINST/{media/{floppy,cdrom},sbin,srv,var}
install -dv -m 0750 $PLXINST/root
install -dv -m 1777 $PLXINST/tmp $PLXINST/var/tmp
mkdir -pv $PLXINST/usr/{,local/}{bin,include,lib,sbin,src}
mkdir -pv $PLXINST/usr/{,local/}share/{color,dict,doc,info,locale,man}
mkdir -v  $PLXINST/usr/{,local/}share/{misc,terminfo,zoneinfo}
mkdir -v  $PLXINST/usr/libexec
mkdir -pv $PLXINST/usr/{,local/}share/man/man{1..8}
mkdir -v  $PLXINST/usr/lib/pkgconfig

case $(uname -m) in
 x86_64) mkdir -v $PLXINST/lib64 ;;
esac

mkdir -v $PLXINST/var/{log,mail,spool}
ln -sv /run $PLXINST/var/run
ln -sv /run/lock $PLXINST/var/lock
mkdir -pv $PLXINST/var/{opt,cache,lib/{color,misc,locate},local}

