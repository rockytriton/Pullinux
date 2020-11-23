echo "Configuring glibc..."
/scripts/glibc_config.sh

mv -v /etc/bash_completion.d/grub /usr/share/bash-completion/completions

echo "Installing packages..."

for f in $(cat /packages/base_chroot.txt)
do
	/scripts/pckinst.sh packages/$f
done;

chown root:root /

passwd root



exit

