cat > /etc/adjtime << "EOF"
0.0 0 0.0
0
LOCAL
EOF

systemctl disable systemd-timesyncd

cat > /etc/locale.conf << "EOF"
LANG=en_US.UTF-8
EOF

