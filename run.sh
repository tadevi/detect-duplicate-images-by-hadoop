echo "Cleaning old files........................"

	rm -rf build/* output/* *.jar
	./scripts/format_file_name.sh input/
echo "I. Compiling preprocessing program files............"

	./scripts/preprocessing.sh

echo "II. Compiling hadoop remove duplicates images program files.........."

	./scripts/build.sh

echo "III. Starting HDFS Service..........."

	start-dfs.sh
	start-yarn.sh

echo "IV. Copy input to DFS......."
	hdfs dfs -rm -r -f /user/rdi/*
	hdfs dfs -mkdir -p /user/rdi/input
	hdfs dfs -put input/* /user/rdi/input

echo "V. Preprocessing data......"
	hadoop jar build/jar/RDIPreprocessing.jar /user/rdi/input/ /user/rdi/seq
	hdfs dfs -rm -r -f /user/rdi/seq/_SUCCESS

echo "VI. Running hadoop......."
	hadoop jar build/jar/RemoveDuplicateImages.jar /user/rdi/seq/ /user/rdi/output

echo "VII. Get result from DFS........"
	hdfs dfs -copyToLocal /user/rdi/output/* output
echo "View output/ directory to get result"
