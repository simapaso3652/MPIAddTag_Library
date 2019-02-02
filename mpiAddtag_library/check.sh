#!/bin/sh

# 必要なライブラリ check
echo "check requested library"
# mpi
mpirun > /dev/null 2>&1
if [ $? -eq 127 ]; then
  コマンドをインストールする処理とか
  echo "you need to install mpi before init.sh"
  return 1
  echo 
fi
# sshpass
if rpm -qa sshpass | grep -q sshpass; then
  true
else
  echo "please install sshpass before init.sh"
  return 1
fi
# kernel-devel
if rpm -qa kernel-devel | grep -q kernel-devel; then
  true
else
  echo "please installkernel-devel before init.sh"
  return 1
fi

echo "checkok!!"
echo ""
