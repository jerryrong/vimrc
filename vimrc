""""""""""""""""""""""""""""""""""""""""
" => Vim-plug plugin manager
""""""""""""""""""""""""""""""""""""""""

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'

" Color themes
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'

" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Raimondi/delimitMate'

" Comment
Plug 'tomtom/tcomment_vim'

" ALE
Plug 'w0rp/ale'

" Gutentags
Plug 'ludovicchabant/vim-gutentags'

" Fuzzy finder 
Plug 'Yggdroot/LeaderF', {'do': './install.sh'}

" Code completion engine
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/deoplete-clangx'

call plug#end()

let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')
exec 'source ' . s:path . '/basic.vim'
exec 'source ' . s:path . '/plugins.vim'
