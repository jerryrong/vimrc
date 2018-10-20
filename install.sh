#!/usr/bin/env bash

vim=$HOME/.vim
vimrc=$HOME/.vimrc

nvim=$HOME/.config/nvim
nvimrc=$nvim/init.vim

curdir=$(pwd)

ln -s $curdir $vim
ln -s $curdir $nvim

ln -s $curdir/main.vim $vimrc
ln -s $curdir/main.vim $nvimrc
