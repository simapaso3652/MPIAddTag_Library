#!/bin/sh

echo "install.sh ----------"

#check.sh
./check.sh

# touch result.txt
echo "touch result.txt at libsource"
touch ./libsource/result.txt

echo "init.sh end-----------------------------"
