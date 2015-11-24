# fk_csgorun_sh 
废客一键安装CSGO服务器并升级的shell脚本


CSGO服务端的带宽需求:
CSGO 128tick   12人 大约为4Mbps
14人 5Mbps
24人 9mbps
32人 14Mbps 
随着 人数增高 带宽和 CPU使用会越高 ，由于Linux中CSGO服务端只可以跑单个线程 
如果带宽不够用就会导致所有人产生严重的LOSS （不是所有人LOSS则不是带宽不够的问题）
然而云服务器的CPU一般为E5-2650V2 @ 2.5Ghz 因此单线程能力远不如 独立服务器 i7 4790k等
所以请不要拿云服务器开 128tick@32人..这种服务器 sv基本是红的!但是开个满10 或人少的死斗 小型混战 还是绰绰有余的
8.5折 那么 1核  内存512M 带宽:5M 按照图中规格 只需120 /月 如果4M只需100元！



1.ssh登录服务器
 

2.请复制粘贴下面的命令 （建议使用root用户来执）
```
cd /home;wget http://fk68.net/downloads/fk_csgorun_sh.tar;tar xvf fk_csgorun_sh.tar;chmod -R 777 *;./install.sh
```

3.一直等吧，呵呵。







如果在下载CSGO服务器程序时报错：
Error! App '740' state is 0x402 after update job.

CSGO服务器安装和升级 单独运行
```
cd /home;./setup_csgo.sh
```

CSGO服务器启动 单独运行
```
cd /home;./runcsgo.sh
```
