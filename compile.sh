echo "Cleaning old files........................"

	rm -rf build/* output/* *.jar
#	./scripts/format_file_name.sh input/
echo "I. Compiling preprocessing program files............"

	./scripts/preprocessing.sh

echo "II. Compiling hadoop remove duplicates images program files.........."

	./scripts/build.sh

echo "III. Starting HDFS Service..........."
	echo 'y' | hdfs namenode -format
	start-dfs.sh
	start-yarn.sh

