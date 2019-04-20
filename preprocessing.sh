echo "Ensure 'hadoop' command in PATH"
echo "1. Compiling sources............."
javac -cp `hadoop classpath` -d build/ src/preprocessing/*.java
if [ $? -ne 0 ]; then
	exit;
fi;
echo "2. Creating Manifest............."
echo "Main-Class: rdipreprocessing.ImagesToSequence" > build/rdipreprocessing/Manifest.txt
echo "3. Createing jar archive........."
cd build/
jar cfm RDIPreprocessing.jar rdipreprocessing/Manifest.txt rdipreprocessing/*.class
mv RDIPreprocessing.jar ../
echo "Finished"

