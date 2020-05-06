#!/tools/bin/bash

echo "Creating..."

/scripts/create.sh

cd /packages

echo "Installing..."
echo "PATH: $PATH"
echo "P" > a
mv a b
rm b

/packages/install.sh

exit

