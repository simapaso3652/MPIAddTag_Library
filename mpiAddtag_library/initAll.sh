#!/bin/sh

koFile=addTag_INPacket.c
setting=setting.txt
ips=()
users=()
paths=()
serverNum=0
cnt=0
passwd=()

#ssh kakunin
for i in `cat $setting`
do
  serverNum=`expr $serverNum + 1`
  cnt=`expr $cnt + 1`
  if [ `expr $cnt % 2` = 0 ]; then
    paths+=($i)
  else
    ips+=($i)
  fi
  if [ $cnt = 2 ]; then
    cnt=0
  fi
done < $setting

serverNum=`expr $serverNum / 2 - 1 `

for i in `seq 0 $serverNum `
do
  echo "ip ${ips[$i]} "
  echo "path ${paths[$i]} "
  echo "please type password for root login."
  read -sp "Password: " pass
  echo
  passwd+=($pass)
  # ssh check
  # sshpass -p ${passwd[$i]} ssh root@${ips[$i]} 
done

echo "check ok!!" 
echo "initAll.sh -------------------------------------------------------"

# local init.sh
./init.sh

# remote
for i in `seq 0 $serverNum `
do
  #checkc yum
  # sshpass -p ${passwd[$i]} ssh root@${ips[$i]} 
  #transport files
  echo "transport libsource"
  tar czf - -C ./ libsource | sshpass -p ${passwd[$i]} ssh root@${ips[$i]} 'tar zxvf - -C /home'
  #touch result.txt
  echo "touch result.txt" 
  sshpass -p ${passwd[$i]} ssh root@${ips[$i]} 'touch /home/libsource/result.txt'
done

echo "init.sh end-----------------------------"

