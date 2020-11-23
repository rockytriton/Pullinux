echo "Installing in ${PLXINST:?}"

scripts/create.sh
scripts/prepare.sh
scripts/base_install.sh

echo ""
echo "Doing chroot 1"
echo ""
scripts/chroot1.sh

echo ""
echo "Doing chroot 2"
echo ""
scripts/chroot2.sh

echo ""
echo "Doing chroot 3"
echo ""
scripts/chroot3.sh

echo "Cleaning up..."
scripts/cleanup.sh


