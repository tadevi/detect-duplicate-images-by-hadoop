BUILD_PATH=build
SOURCE_PATH=src/preprocessing
PACKAGE_NAME=rdipreprocessing
JAR_PATH=jar
JAR_NAME=RDIPreprocessing.jar
echo -e "\tEnsure 'hadoop' command in PATH"

echo -e "\t1. Compiling sources............."

	javac -cp `hadoop classpath` -d $BUILD_PATH $SOURCE_PATH/*.java

	if [ $? -ne 0 ]; then
		exit;
	fi;
echo -e "\t2. Creating Manifest............."

	echo "Main-Class: rdipreprocessing.ImagesToSequence" > $BUILD_PATH/$PACKAGE_NAME/Manifest.txt

echo -e "\t3. Createing jar archive........."
	cd $BUILD_PATH
	mkdir -p $JAR_PATH
	jar cfm $JAR_NAME $PACKAGE_NAME/Manifest.txt $PACKAGE_NAME/*.class
	mv $JAR_NAME $JAR_PATH

echo -e "Finished"

