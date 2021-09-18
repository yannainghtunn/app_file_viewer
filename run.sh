echo "Selected File : $1"
package=$(aapt dump badging $1 | grep "package: name" | cut -d"'" -f 2)
echo "Package Name : $package"
outDir=$(echo $1 | cut -d"." -f 1)
java -jar apktool.jar d $1 -r -o $outDir
cp -rf ynh tmp
toR="/data/data/$package"
ss="s+replace+$toR+g"
sed -i "$ss" tmp/httpserver/MyServer.smali
cp -rf tmp $outDir/smali/
mv $outDir/smali/tmp $outDir/smali/ynh
rm -rf tmp
static_method="\\\n    invoke-static {}, Lynh\/httpserver\/MyServer;->run()V\\n"
activity=$(aapt dump badging $1 | grep "launchable-activity" | cut -d"'" -f2 | sed 's/\./\//g').smali
echo "Activity : $activity"
cd $outDir
IFS=" " read -r -a array <<< $(echo * )
for element in "${array[@]}"
do
  if [[ $element == *"smali"* ]]; then
	if [[ -f $element/$activity ]]; then
		patternm=";->onCreate(Landroid\/os\/Bundle;)V"
		echo "Appending static method to : $element/$activity"
		sed -i "/$patternm/a $static_method" $element/$activity
	fi
  fi
done
cd ..
echo "Building folder : $outDir"
java -jar apktool.jar b $outDir
zipalign -f -v 4 $outDir/dist/$outDir.apk $outDir/dist/$outDir_aligned.apk > /dev/null
apksigner sign --ks ~/.android/debug.keystore $outDir/dist/$outDir_aligned.apk
adb install $outDir/dist/$outDir_aligned.apk
