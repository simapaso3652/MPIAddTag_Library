#!/bin/sh

path=$1

echo "install.sh -----------------------------"

# MPI���C�u�����̒u������
echo "extend mpiLibrary"
if [ path != '' ]; then
  echo "please type your mpiLibrary's path
  read path
fi
echo "checked your mpiLibrary's path"
### check mpiLibrary
###mv ./libsource/mpi_send.c $path/mpi

# MPI���C�u�����̍ăr���h���s���܂��B
echo "rebuild mpiLibrary for adaping of mpiLibrary"
### sudo $path/configure --prefix=/usr/local/openmpi-2.0.1  CC=gcc CXX=g++ 
### make -j 4 all 2>&1 | tee make.log
### make -j 4 install 2>&1 | tee install.log

# ���ʃJ�[�l�����W���[���^�O�t���v���O�����̃R���p�C��
### echo "compile mpiAddTag_INPacket.c. It is one program, kernel module for addTag"
### gcc -c ./libsource/mpiAddTag_INPacket.c -o mpiAddTag_INPacket.o


echo "install.sh end-----------------------------"
echo ""

