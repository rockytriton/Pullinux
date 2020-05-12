ln -s /dev/null /etc/systemd/network/99-default.link

for iface in $(ls /sys/class/net)
do
	if [ "$(cat /sys/class/net/$iface/type)" -eq "1" ]; then
		echo "[Match]" > /etc/systemd/network/10-eth-dhcp.network

		echo "Name=$iface" >> /etc/systemd/network/10-eth-dhcp.network
		echo "" >> /etc/systemd/network/10-eth-dhcp.network
		echo "[Network]" >> /etc/systemd/network/10-eth-dhcp.network
		echo "DHCP=ipv4" >> /etc/systemd/network/10-eth-dhcp.network
		echo "" >> /etc/systemd/network/10-eth-dhcp.network
		echo "[DHCP]" >> /etc/systemd/network/10-eth-dhcp.network
		echo "UseDomains=true" >> /etc/systemd/network/10-eth-dhcp.network

		break
	fi
done;

cat > /etc/resolv.conf << "EOF"
# Begin /etc/resolv.conf

domain local
nameserver 8.8.8.8 

# End /etc/resolv.conf
EOF

echo "pullinux-pc" > /etc/hostname

cat > /etc/hosts << "EOF"
# Begin /etc/hosts

127.0.0.1 localhost
::1       localhost ip6-localhost ip6-loopback
ff02::1   ip6-allnodes
ff02::2   ip6-allrouters
192.168.0.224 pullit.org

# End /etc/hosts
EOF

