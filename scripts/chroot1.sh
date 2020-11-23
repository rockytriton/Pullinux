echo "Installing in ${PLXINST:?}"

cp -r scripts $PLXINST

chroot "$PLXINST" /usr/bin/env -i \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin \
    /bin/bash /scripts/chroot_config.sh

