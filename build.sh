echo "Ensure 'hadoop' command in PATH"
echo "1. Compiling sources............."
javac -cp `hadoop classpath` -d build RemoveDuplicates/*.java
if [ $? -ne 0 ]; then
	exit;
fi;
echo "2. Creating Manifest............."
echo "Main-Class: RemoveDuplicates.RDIDriver" > build/Manifest.txt
echo "3. Createing jar archive........."
jar cfm RemoveDuplicateImages.jar build/Manifest.txt build/RemoveDuplicates/*.class
echo "Finished"


