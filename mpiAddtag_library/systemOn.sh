#!/bin/bash

# カーネルモジュールの組み込み
sudo insmod kernelModuleTest.o
# rawsocketプログラムの実行 (バックグランドでの実行)
sudo ./libsource/showPacket.o &

