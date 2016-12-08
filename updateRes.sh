#!/bin/bash
echo "更新场景配置"
cd SceneServer/Config;
svn up;
cd ../../SceneServer/map;
svn up;
echo "更新Session配置"
cd ../../SessionServer/Config;
svn up;
cd ../..;
