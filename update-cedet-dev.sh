#!/bin/bash

cd cedet-dev
git pull --rebase
make clean-all
make EMACS=/Applications/Emacs.app/Contents/MacOS/Emacs

cd contrib
make clean
make EMACS=/Applications/Emacs.app/Contents/MacOS/Emacs
