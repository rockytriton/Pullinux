pck=$1

base=${PLXINST:?}/..

echo "Stripping ${pck:?} in $base..."

cd $base/stripped/tmp
rm -rf $base/stripped/tmp/* $base/stripped/tmp/.dep

tar -xhf ../../$pck

sizeb=$(du -sh .)

sudo rm -rf $base/stripped/tmp/usr/share/doc
sudo rm -rf $base/stripped/tmp/usr/share/man
sudo rm -rf $base/stripped/tmp/usr/share/info
sudo rm -rf $base/stripped/tmp/usr/include

sizea=$(du -sh .)

tar -cJf ../$(basename $pck) .

rm -rf $base/stripped/tmp/* $base/stripped/tmp/.dep

echo "Stripped docs/dev size change $sizeb to $sizea"
