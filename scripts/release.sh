echo "0.2.0-systemd" > /etc/plx-release
cat > /etc/lsb-release << "EOF"
DISTRIB_ID="Pullinux"
DISTRIB_RELEASE="0.2.0-systemd"
DISTRIB_CODENAME="Pulley OS"
DISTRIB_DESCRIPTION="Pullinux"
EOF

cat > /etc/os-release << "EOF"
NAME="Pullinux"
VERSION="0.2.0"
ID=plx
PRETTY_NAME="Pullinux 0.2.0"
VERSION_CODENAME="Genesis"
EOF

