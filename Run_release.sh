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

flashpy=$(ps -aux|grep flashpolicyd |grep -v grep|grep -v vim|wc -l)
while [ $flashpy -le 0 ]
do
	./startflashpolicyd
	flashpy=$(($flashpy+1))
done

cd CenterTools/
./CenterClient -z 1
cd ..
./svnupdate.sh
sleep 1
RegServer/RegServer -d -nRegServer
echo "Start RegServer Ok!"
SuperServer/SuperServer -d  -nSuperServer
echo "Start SuperServer Ok!"
LogServer/LogServer -d -nLogServer
echo "Start LogServer Ok!"
RecordServer/RecordServer -d -nRecordServer
echo "Start RecordServer Ok!"
sleep 1
SessionServer/SessionServer -d -nSessionServer
echo "Start SessionServer Ok!"
sleep 1
GateServer/GateServer -d -nGateServer1
echo "Start GateServer Ok!"
sleep 1
SceneServer/SceneServer -d -nSceneServer1
echo "Start SceneServer Ok!"
sleep 1
SceneServer/SceneServer -d -nSceneServerQuest1
echo "Start SceneServer Ok!"
