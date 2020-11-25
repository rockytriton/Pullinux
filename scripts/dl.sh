fn=$(echo $1 | awk -F "/" '{print $NF}')
dr=$(echo $fn | awk 'END{print substr($0,1,index($0, ".t")-1)}')

echo "Filname: $fn"
echo "Dir: $dr"

wget $1
tar -xf $fn
cd ./$dr

