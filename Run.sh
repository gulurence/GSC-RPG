#!/bin/bash
#./svnupdate.sh

#####################################
#cd RegServer
#RegServer
#./RegServer -d  -nRegServer
#cd ..
#echo "Start RegServer Ok!"
#####################################
cd SuperServer
#SuperServer
./SuperServer -d -nSuperServer
cd ..
echo "Start SuperServer Ok!"
#####################################
sleep 1
#MatchServer
cd MatchServer
./MatchServer -d -nMatchServer
cd ..
echo "Start MatchServer Ok!"
#####################################
cd LobbyServer
#LobbyServer
./LobbyServer -d  -nLobbyServer1
cd ..
echo "Start LobbyServer Ok!"
#####################################
cd LogServer
./LogServer -d -nLogServer
cd ..
echo "Start LogServer Ok!"
#####################################
cd RecordServer
./RecordServer -d -nRecordServer
cd ..
echo "Start RecordServer Ok!"
#####################################
cd SessionServer
./SessionServer -d -nSessionServer
cd ..
echo "Start SessionServer Ok!"
#####################################
sleep 1
#BattleServer
cd BattleServer
./BattleServer -d -nBattleServer1 > BattleServer.log 2>&1
cd ..
echo "Start BattleServer Ok!"
