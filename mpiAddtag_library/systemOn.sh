#!/bin/bash

# �J�[�l�����W���[���̑g�ݍ���
sudo insmod kernelModuleTest.o
# rawsocket�v���O�����̎��s (�o�b�N�O�����h�ł̎��s)
sudo ./libsource/showPacket.o &

