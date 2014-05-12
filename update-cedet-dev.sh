#!/bin/bash

if [ -d "cedet" ]
then
    cd cedet
    git pull --rebase
else
    git clone http://git.randomsample.de/cedet.git
    cd cedet
fi

make clean-all
make EMACS=/Applications/Emacs.app/Contents/MacOS/Emacs

cd contrib
make clean
make EMACS=/Applications/Emacs.app/Contents/MacOS/Emacs
