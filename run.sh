	rm -rf output/*
echo "I. Copy input to DFS......."
	hdfs dfs -rm -r -f /user/rdi/*
	hdfs dfs -mkdir -p /user/rdi/input
	hdfs dfs -put input/* /user/rdi/input
	
echo "II. Preprocessing data......"
	hadoop jar build/jar/RDIPreprocessing.jar /user/rdi/input/ /user/rdi/seq
	hdfs dfs -rm -r -f /user/rdi/seq/_SUCCESS

echo "III. Running hadoop......."
	hadoop jar build/jar/RemoveDuplicateImages.jar /user/rdi/seq/ /user/rdi/output

echo "VI. Get result from DFS........"
	hdfs dfs -copyToLocal /user/rdi/output/* output
echo "View output/ directory to get result"
