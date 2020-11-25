echo ${P:?}

cpwd=${PWD##*/}
tar -cJf $P/../$cpwd-pullinux-1.1.0.tar.xz -C $P .
rm -rf $P/* $P/.dep
ls -lstrh $P/..

