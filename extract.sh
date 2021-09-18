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
echo "  invoke-static {}, Lynh/httpserver/MyServer;->run()V" | xclip -i -selection c
echo "Text Copied, You just need to paste in sutable place"

