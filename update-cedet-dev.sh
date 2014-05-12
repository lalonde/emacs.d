#!/bin/bash

#git clone http://git.randomsample.de/cedet.git
cd cedet
git pull --rebase
make clean-all
make EMACS=/Applications/Emacs.app/Contents/MacOS/Emacs

cd contrib
make clean
make EMACS=/Applications/Emacs.app/Contents/MacOS/Emacs
