cd /scripts
./configure.sh
./network-config.sh
./console-config.sh
./clock-config.sh
./release.sh
./fstab.sh
./grub.sh

read -p "Install XFCE 4? (y/N) " -r yn

if [ "$yn" == "y" ]; then
    ./xfce4.sh
fi

read -p "Install KDE? (y/N) " -r yn2

if [ "$yn2" == "y" ]; then
    ./kde.sh
fi


read -p "Enter sudo username: " -r suser

useradd -m $suser

echo "Enter passwork for sudo user"
passwd $suser

mkdir -p /etc/sudoers.d
echo "$suser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/plx

exit
