echo "Installing Base: ${PLXINST:?}"

mkdir -p $PLXINST/packages

cp scripts/base_packages.txt $PLXINST/packages/
cp scripts/base_chroot.txt $PLXINST/packages/

if [[ "yes" == "$SKIPCOPY" ]]; then
	echo "Skipping copy."
else
	echo "Copy"

	for f in $(ls -1 packages/*.xz)
	do
        	cp -v $f $PLXINST/packages/
	done;
fi

cd $PLXINST

if [[ "yes" == "$SKIPINST" ]]; then
	exit
fi

for f in $(cat $PLXINST/packages/base_packages.txt)
do
	echo $f
	tar -xhf $PLXINST/packages/$f
done;

ln -sv bash $PLXINST/bin/sh

