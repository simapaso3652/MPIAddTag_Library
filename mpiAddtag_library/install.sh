#!/bin/sh

path=$1

echo "install.sh -----------------------------"

# MPI���C�u�����̒u������
echo "extend mpiLibrary"
if [ path != '' ]; then
  echo "please type your mpiLibrary's path
  read path
fi
# mv ./libsource/mpi_send.c path/~

# MPI���C�u�����̍ăr���h���s���܂��B
echo "rebuild mpiLibrary for adaping of mpiLibrary"

# ���ʃJ�[�l�����W���[���^�O�t���v���O�����̃R���p�C��
echo "compile mpiAddTag_INPacket.c. It is identification kernel module"
gcc -c -o mpiAddTag_INPacket.o

echo "install.sh end-----------------------------"
echo ""

