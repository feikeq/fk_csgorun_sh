#!/bin/sh

echo "<FK-CSGO-Server-RUN-Updata> [《废客CSGO服务器Linux运行与更新程序》]"
echo "-------------------------"
echo "http://www.FK68.net"
echo "BY FeikeQ"
sleep 3s
cd     ./csgoserver
screen -A -m -d -S csgoserver ./srcds_run -game csgo -console -stringtables -usercon +game_type 0 +game_mode 0 +mapgroup mg_active -pidfile csgosrv.pid -maxplayers_override 12 +map de_dust2  -net_port_try 1 -autoupdate -steam_dir  ../steamcmd/ -steamcmd_script ../steam_info.txt
cd ..
