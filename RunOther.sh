#!/bin/bash
ulimit -c unlimited
ulimit -n 65535


scont=$(ps -aux|grep Services |grep -v grep|grep -v vim|wc -l)
echo "scont:"$scont
while [ $cont -le 0 ]
do
	cd Services/
	./srun.sh
	cd ..	
	scont=$(($scont+1))
	sleep 1
done



cont=$(ps -aux|grep CenterServer |grep -v grep|grep -v vim|wc -l)
echo "cont:"$cont
while [ $cont -le 0 ]
do
	cd CenterTools/
	./CenterServer -d
	cd ..	
	cont=$(($cont+1))
	sleep 1
done


cd CenterTools/
./CenterClient -z 1
cd ..
#./svnupdate.sh
sleep 1
cd RegServer
./RegServer -d -nRegServer
cd ..
echo "Start RegServer Ok!"

cd SuperServer
./SuperServer -d  -nSuperServer
cd ..
echo "Start SuperServer Ok!"

cd LogServer
./LogServer -d -nLogServer
cd ..
echo "Start LogServer Ok!"

cd RecordServer
./RecordServer -d -nRecordServer
cd ..
echo "Start RecordServer Ok!"

sleep 1
cd SessionServer
./SessionServer -d -nSessionServer
cd ..
echo "Start SessionServer Ok!"

sleep 1
cd GateServer
./GateServer -d -nGateServer1
cd ..
echo "Start GateServer Ok!"

#sleep 1
#cd SceneServer
#./SceneServer -d -nSceneServer1
#cd ..
#echo "Start SceneServer Ok!"

sleep 1
cd SceneServer
./SceneServer -d -nSceneServerQuest1
cd ..
echo "Start SceneServerQuest1 Ok!"
