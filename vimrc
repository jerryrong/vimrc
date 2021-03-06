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
Plug 'lifepillar/vim-solarized8'
Plug 'sonph/onehalf', {'rtp': 'vim/'}

" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Raimondi/delimitMate'

" Comment
Plug 'tomtom/tcomment_vim'

" ALE
Plug 'dense-analysis/ale'

" Gutentags
Plug 'ludovicchabant/vim-gutentags'

" Fuzzy finder 
Plug 'Yggdroot/LeaderF', {'do': './install.sh'}

" Code completion engine
" Plug 'Valloric/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntax highlight
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'sheerun/vim-polyglot'

call plug#end()

let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')
exec 'source ' . s:path . '/basic.vim'
exec 'source ' . s:path . '/plugins.vim'
