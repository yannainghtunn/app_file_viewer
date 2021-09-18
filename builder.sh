echo "Building folder : $1"
java -jar apktool.jar b $1
zipalign -f -v 4 $1/dist/$1.apk $1/dist/$1_aligned.apk
apksigner sign --ks ~/.android/debug.keystore $1/dist/$1_aligned.apk
adb install $1/dist/$1_aligned.apk
