#!/usr/bin/env sh

vim_dir=$HOME/.vim
nvim_dir=$HOME/.config/nvim
curdir=$(pwd)


if [ ! -d "$vim_dir" ]; then
    mkdir -p $vim_dir
    ln -s -f $curdir $vim_dir
fi

if [ ! -d "$nvim_dir" ]; then
    mkdir -p $nvim_dir
    ln -s -f $curdir/init.vim $nvim_dir/init.vim
fi
