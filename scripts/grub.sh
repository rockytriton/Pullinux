echo "Intalling grub: /dev/$BLKDEV"

grub-install /dev/$BLKDEV

cat > /boot/grub/grub.cfg << "EOF"
set default=0
set timeout=30

set gfxmode=1600x1200x24
set gfxpayload=keep

menuentry "Pullinux 1.0.0" {
	set root='hd0,msdos1'
	linux /boot/vmlinuz-5.5.3-pullinux-0.1.4 root=/dev/sda1 ro
}

EOF

