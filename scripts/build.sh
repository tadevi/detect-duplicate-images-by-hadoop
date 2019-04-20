BUILD_PATH=../build
SOURCE_PATH=../src/
PACKAGE_NAME=rdi
JAR_PATH=jar
JAR_NAME=RemoveDuplicateImages.jar

echo "Ensure 'hadoop' command in PATH"
echo "1. Compiling sources............."
javac -cp `hadoop classpath` -d $BUILD_PATH $SOURCE_PATH/*.java
if [ $? -ne 0 ]; then
	exit;
fi;
echo "2. Creating Manifest............."
echo "Main-Class: rdi.RDIDriver" > $BUILD_PATH/$PACKAGE_NAME/Manifest.txt
echo "3. Createing jar archive........."
cd $BUILD_PATH
mkdir -p $JAR_PATH
jar cfm $JAR_NAME $PACKAGE_NAME/Manifest.txt $PACKAGE_NAME/*.class
mv $JAR_NAME $JAR_PATH
echo "Finished"


