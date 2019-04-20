script_name=`basename "$0"`
if [ $# -lt 1 ]; then
	echo "Using: ./$script_name directory_path"
	exit
fi;
directory_path=$1
cd $1
IFS=$'\n'
arr=(`ls`)
i=0
for j in ${arr[@]}; do
ext=${j##*.}
mv "$j" "$i.$ext"
#echo $j
i=$((i+1))
done;
unset IFS
unset script_name
unset directory_path
