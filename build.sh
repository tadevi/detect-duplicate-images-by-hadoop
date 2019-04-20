echo "Ensure 'hadoop' command in PATH"
echo "1. Compiling sources............."
javac -cp `hadoop classpath` -d build src/*.java
if [ $? -ne 0 ]; then
	exit;
fi;
echo "2. Creating Manifest............."
echo "Main-Class: rdi.RDIDriver" > build/rdi/Manifest.txt
echo "3. Createing jar archive........."
cd build/
jar cfm RemoveDuplicateImages.jar rdi/Manifest.txt rdi/*.class
mv RemoveDuplicateImages.jar ../
echo "Finished"


