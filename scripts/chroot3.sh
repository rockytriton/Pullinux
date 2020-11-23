echo "Installing in ${PLXINST:?}"

chroot "$PLXINST" /usr/bin/env -i \
    HOME=/                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin \
    /bin/bash /scripts/chroot_post_install.sh

