""""""""""""""""""""""""""""""""""""""""
" => Vim-plug plugin manager
""""""""""""""""""""""""""""""""""""""""

let data_dir = has('win32') ? $HOME . '/vimfiles' : '~/.vim'

if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" call plug#begin('~/.vim/plugged')
call plug#begin()
Plug 'junegunn/vim-plug'

" Color themes
Plug 'lifepillar/vim-solarized8'
Plug 'sainnhe/gruvbox-material'

" Syntax highlight
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'sheerun/vim-polyglot'

" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Raimondi/delimitMate'
Plug 'editorconfig/editorconfig-vim'

" Comment
Plug 'tomtom/tcomment_vim'

" ALE
Plug 'dense-analysis/ale'

" Gutentags
Plug 'ludovicchabant/vim-gutentags'

" Fuzzy finder
Plug 'Yggdroot/LeaderF', {'do': ':LeaderfInstallCExtension'}

" Code completion engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" GoLang
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}

call plug#end()
