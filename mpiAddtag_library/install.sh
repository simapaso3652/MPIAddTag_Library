#!/bin/sh

path=$1

echo "install.sh -----------------------------"

# MPIライブラリの置き換え
echo "extend mpiLibrary"
if [ path != '' ]; then
  echo "please type your mpiLibrary's path
  read path
fi
# mv ./libsource/mpi_send.c path/~

# MPIライブラリの再ビルドを行います。
echo "rebuild mpiLibrary for adaping of mpiLibrary"

# 識別カーネルモジュールタグ付けプログラムのコンパイル
echo "compile mpiAddTag_INPacket.c. It is identification kernel module"
gcc -c -o mpiAddTag_INPacket.o

echo "install.sh end-----------------------------"
echo ""

