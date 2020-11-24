#ln -s /dev/null /etc/systemd/network/99-default.link

cat > /etc/adjtime << "EOF"
0.0 0 0.0
0
LOCAL
EOF

timedatectl set-local-rtc 1

timedatectl set-timezone TIMEZONE

cat > /etc/locale.conf << "EOF"
LANG=en_US.iso88591
EOF

cat > /etc/inputrc << "EOF"
# Begin /etc/inputrc
# Modified by Chris Lynn <roryo@roryo.dynup.net>

# Allow the command prompt to wrap to the next line
set horizontal-scroll-mode Off

# Enable 8bit input
set meta-flag On
set input-meta On

# Turns off 8th bit stripping
set convert-meta Off

# Keep the 8th bit for display
set output-meta On

# none, visible or audible
set bell-style none

# All of the following map the escape sequence of the value
# contained in the 1st argument to the readline specific functions
"\eOd": backward-word
"\eOc": forward-word

# for linux console
"\e[1~": beginning-of-line
"\e[4~": end-of-line
"\e[5~": beginning-of-history
"\e[6~": end-of-history
"\e[3~": delete-char
"\e[2~": quoted-insert

# for xterm
"\eOH": beginning-of-line
"\eOF": end-of-line

# for Konsole
"\e[H": beginning-of-line
"\e[F": end-of-line

# End /etc/inputrc
EOF

cat > /etc/shells << "EOF"
# Begin /etc/shells

/bin/sh
/bin/bash

# End /etc/shells
EOF

mkdir -pv /etc/systemd/system/getty@tty1.service.d

cat > /etc/systemd/system/getty@tty1.service.d/noclear.conf << EOF
[Service]
TTYVTDisallocate=no
EOF

cat > /etc/fstab << "EOF"
# Begin /etc/fstab

# file system  mount-point  type     options             dump  fsck
#                                                              order

/dev/sdb1     /            ext4    defaults            1     1

# End /etc/fstab
EOF

echo ""
echo "DETECT NETWORK"
echo ""
ip a
sleep 5

cat > /etc/systemd/network/10-eth-dhcp.network << "EOF"
[Match]
Name=enp2s1

[Network]
DHCP=ipv4

[DHCP]
UseDomains=true
EOF

ssh-keygen -A
chmod u+s /usr/bin/sudo

