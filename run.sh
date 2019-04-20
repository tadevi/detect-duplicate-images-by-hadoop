echo "1. Starting HDFS Service..........."
#start-dfs.sh
#start-yarn.sh
echo "2. Copy input to DFS......."
hdfs dfs -rm -r -f /user/rdi/input/ /user/rdi/output /user/rdi/seq
hdfs dfs -mkdir -p /user/rdi/input
hdfs dfs -put input/* /user/rdi/input
echo "3. Preprocessing data......"
hadoop jar RDIPreprocessing.jar /user/rdi/input/ /user/rdi/seq
hdfs dfs -rm -r -f /user/rdi/seq/_SUCCESS
echo "4. Running hadoop......."
hadoop jar RemoveDuplicateImages.jar /user/rdi/seq/ /user/rdi/output
echo "4. Get result from DFS........"
hdfs dfs -copyToLocal /user/rdi/output/* output
