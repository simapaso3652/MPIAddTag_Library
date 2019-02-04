#!/bin/sh

setting=setting.txt
ips=()
users=()
paths=()
serverNum=0
cnt=0
passwd=()

# •Ï”‚Ì‘ã“ü ssh‚Ì‚½‚ß‚Ì
for i in `cat $setting`
do
  serverNum=`expr $serverNum + 1`
  cnt=`expr $cnt + 1`
  if [ `expr $cnt % 2` = 0 ]; then
    users+=($i)
  elif [ `expr $cnt % 3` = 0 ]; then
    paths+=($i)
  else 
    ips+=($i)
  fi
  if [ $cnt = 3 ]; then
    cnt=0
  fi
done < $setting

serverNum=`expr $serverNum / 3 - 1 `

# initAll.sh
echo "initAll.sh -------------------------------------------------------"

# local
./installAll.sh

for i in `seq 0 $serverNum `
do
  echo "ip ${ips[$i]} "
  echo "user ${users[$i]} "
  echo "path ${paths[$i]} "
  echo "please type password for root login."
  read -sp "Password: " pass
  echo
  passwd+=($pass)
  ############################################################
  sshpass -p ${passwd[$i]} ssh root@${ips[$i]} 'sh ' | ./install.sh ${path[$i]}
  ############################################################
done

echo "init.sh end-----------------------------"

