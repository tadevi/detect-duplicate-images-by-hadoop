echo "1. Starting HDFS Service..........."
start-dfs.sh
start-yarn.sh
echo "2. Copy input to DFS......."
hdfs namenode -format
hdfs dfs -mkdir -p /user/rdi/input
hdfs dfs -put input/* /user/rdi/input
echo "3. Running hadoop program......"
hadoop jar RemoveDuplicateImages.jar /user/rdi/input /user/rdi/output
echo "4. Get result from DFS........"
hdfs dfs -copyToLocal /user/rdi/output output
