export PLXINST=/mnt/sdb1
exec env -i HOME=$HOME TERM=$TERM PS1='\u:\w\$ ' /bin/bash
set +h
umask 022
LC_ALL=POSIX
LFS_TGT=$(uname -m)-lfs-linux-gnu
PATH=/tools/bin:/bin:/usr/bin
export PLX LC_ALL LFS_TGT PATH
export MAKEFLAGS='-j 8'
