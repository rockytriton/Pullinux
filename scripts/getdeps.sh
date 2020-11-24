pck=$1

echo "Dependencies for ${pck:?}:"
deps=$(tar -O -xf $pck ./.dep 2> /dev/null)

if [ "$deps" == "" ]; then
	echo "None."
else
	for d in $deps
	do
		echo "    $d"
	done;
fi

