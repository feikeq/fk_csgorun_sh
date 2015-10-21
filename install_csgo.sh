#!/bin/sh

echo "<FK-CSGO-Server-Install-Run> [《废客CSGO服务器Linux安装与运行程序》]"

# if [ `whoami` != steam ];then  
# 	# 建议为 SteamCMD 创建单独的用户。在任何情况下，不以 root 身份，这可能会导致严重的安全风险运行它!以 root 身份创建蒸汽用户，请运行以下命令，并作为它的登录:
# 	echo "Created users <steam> [ 在系统里创建<steam>用户 ]"
# 	#如果用户存在 useradd 霸王硬上弓！
# 	useradd -m steam 2>/dev/null
# 	echo "adduser go go go ";
# 	su - steam -c "screen -S csgoServerInstall  ../install_csgo.sh"
# 	echo "exit go go go ";
# 	exit
# 	cd ..
# fi 


echo "Create a directory [ 创建目录“csgoserver”和“steamcmd” ]"
chmod -R 777 *
mkdir ./csgoserver
mkdir ./steamcmd
#进入steamcmd里删除安装包
cd ./steamcmd
rm -f steamcmd_linux.tar.gz
echo "1.Downloading the new of Steamcmd [ 正在下载最新版的Steamcmd ]"
wget  http://media.steampowered.com/client/steamcmd_linux.tar.gz
sleep 1s
echo "Is extracted [ 正在解压steamcmd_linux.tar.gz ]"
sudo tar -xvzf steamcmd_linux.tar.gz

echo "Check  [ 检查Steamcmd... ]"
sleep 1s
path=steam.sh #Steam.sh Found
if [ ! -f $path ];then
echo "No Steamcmd ,Try again 5 seconds to download [ 警告Steamcmd相关文件未找到,5秒后将重试继续下载... ]"
cd ..
sleep 5s
screen -S csgoServerInstall  ../install_csgo.sh
exit
cd ..
fi


echo "2.Download CSGO Server [ 即将下载CSGO服务端 从Steam服务器这个过程可能需要一些时间! ]"
STEAM_RUNTIME=0 STEAMEXE=steamcmd ./steam.sh +login anonymous +force_install_dir ../csgoserver +app_update 740 validate +exit
sleep 1s

 
echo "Check the CSGO Server files [ 检查CSGO服务器文件..... ] "
sleep 1s
path=../csgoserver/srcds_run #Server Found
if [ ! -f $path ];then
echo "No CSGOserver,Try again 5 seconds to download [ 警告CSGOserver相关文件未找到,5秒后将重试继续下载... ]"
cd ..
sleep 5s
screen -S csgoServerInstall  ../install_csgo.sh
exit
cd ..
fi


# sleep 5s
# echo "Downloading CFG/Plugins/map By FK68.net"
# echo "准备下载满10Warmod插件/参数/地图 By FK68.net"
# cd /home/csgoserver

# echo "Downloading CFG/Plugins/map By FK68.net-"
# rm -f csgowarmodplugin.tar.gz
# sleep 2s
# wget http://csgo.fk68.net/plugins/csgowarmodplugin.tar.gz
# sleep 2s



# cd /home/csgoserver
# sleep 1s
# echo "准备解压插件.. FK68.net"
# sleep 3s
# sudo tar  -zxvf csgowarmodplugin.tar.gz
# sleep 3s
# chmod -R 777 *

# echo "验证检查插件包..."
# sleep 5s
# path=/home/csgoserver/csgo/addons/sourcemod/plugins/adminmenu.smx #adminmenu.smx Found
# if [ ! -f $path ];then
# echo "警告 插件包未找到,将尝试重试下载..."
# sleep 5s
# cd /home
# sleep 5s
# screen -S csgoServerInstall  ./install_csgo.sh
# exit
# cd ..
# fi

cd ../csgoserver
echo "3.Run CSGO Server [ 开始运行CSGO服务器..... ]"
./srcds_run -game csgo -console -stringtables -usercon +game_type 0 +game_mode 0 +mapgroup mg_active -pidfile csgosrv.pid -maxplayers_override 12 +map de_dust2  -net_port_try 1 -autoupdate -steam_dir  ../steamcmd/ -steamcmd_script ../steam_info.txt
cd ..
