#!/bin/bash
releasePath="ZoneTemplate/"
LogFileName="tmp"

files="startflashpolicyd restart FlashPolicy svnupdate.sh log_config.xml stoplocal "
apps="GateServer LogServer RecordServer RegServer SceneServer SessionServer SuperServer"
rm -r $releasePath
mkdir $releasePath

for file in $files
do

cp -avx -r $file $releasePath
echo $file $releasePath
done

cp -rf CenterTools $releasePath
cp -rf Services $releasePath

for app in $apps
do 
mkdir $releasePath$app
cp -avx $app/$app $releasePath$app/$app
echo $app/$app $releasePath$app/$app
done
chmod -Rf 777 $releasePath
#rm -r "./"$releasePath$LogFileName
mkdir "./"$releasePath$LogFileName
cp "./"$LogFileName"/clean.sh" "./"$releasePath"/"$LogFileName"/clean.sh"

cd $releasePath
mkdir log
