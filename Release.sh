#!/bin/bash
releasePath="plat2/"
files="SceneServer/log.xml SceneServer/config.xml SceneServer/pluglist.xml LogServer/log_config.xml startflashpolicyd stop stoplocal FlashPolicy SceneServer/Config SceneServer/map SceneServer/svnupdate.sh"
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
cp "Run_release.sh" $releasePath"Run.sh"
mkdir -p $releasePath"tmp"
cp "SceneServer/tmp/clean.sh" $releasePath"tmp"
chmod -Rf 777 $releasePath

cd $releasePath
mkdir log
