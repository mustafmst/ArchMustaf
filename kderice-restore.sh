#!/bin/bash

export PATH=$PATH:~/.local/bin
cp -r $HOME/ArchMustaf/dotfiles/* $HOME/.config/
pip install konsave
konsave -i $HOME/ArchMustaf/kde.knsv
sleep 1
konsave -a kde
