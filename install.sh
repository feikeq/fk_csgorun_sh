#!/bin/sh

echo "<FK-CSGO-Server-Install> [《废客CSGO服务器Linux安装程序》]"
echo "Please wait..[ 安装即将开始..请耐心等待.... ]"
sleep 3s

#安装《查看当前系统的发行版信息》,-y意思是自动选择yes
#sudo yum -y install redhat-lsb

 
# 升级所有包，改变软件设置和系统设置,系统版本内核都升级
#sudo yum -y update

#ldconfig是一个动态链接库管理命令，通常当用户安装了一个新的动态链接库时就需要手工运行这个命令
#往/lib和/usr/lib里面加东西，是不用修改/etc/ld.so.conf的，但是完了之后要调一下ldconfig，不然这个library会找不到
#总之，就是不管做了什么关于library的变动后，最好都ldconfig一下，不然会出现一些意想不到的结果。不会花太多的时间，但是会省很多的事。
#ldconfig

#查看linux系统是32位还是64位
if [ $(getconf WORD_BIT) = '32' ] && [ $(getconf LONG_BIT) = '64' ] ; 
then
	echo "SYSTEM is 64bit [ 检测到系统是64位将安装32位运行库 ]"
	#CentOS
	sleep 1s
	sudo yum -y install xulrunner.i686
	sudo yum -y install screen
	#非CentOS如Ubuntu
	sleep 1s
	sudo apt-get update
	sudo apt-get -y install ia32-libs 
	sudo apt-get -y install lib32stdc++-4.8-dev
	sudo apt-get -y install lib32z1 lib32z1-dev
	sudo apt-get -y install libc6-dev-i386 libc6-i386
	sudo apt-get install screen
else
	echo "SYSTEM is 32bit [ 系统是32位将跳过安装32位运行库 ]"
fi


echo "Install screen [ 可以在多个进程间复用一个物理终端的窗口，提供了类似于nohup的功能就像“多个桌面” ]"
sleep 1s


echo "Preparing to start CSGO Server download [ 正在准备启动CSGO服务端下载 ]"
chmod -R 777 *
sleep 1s
screen -L -S csgoServerInstall  ./setup_csgo.sh
cd ..


 

