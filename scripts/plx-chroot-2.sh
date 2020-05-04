chroot "$PLXINST" /usr/bin/env -i          \
    HOME=/root TERM="$TERM"            \
    PS1='<pullinx-chroot> \u:\w\$ '        \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin \
    /bin/bash --login
