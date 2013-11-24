" Author: Jerry Rong

""""""""""""""""""""""""""""""""""""""""
" => Vundle plugin manager
""""""""""""""""""""""""""""""""""""""""
set nocompatible                    " No Vi-compatible

let has_vundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let has_vundle=0
endif

filetype off                        " Required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Plugin Bundles
Bundle 'w0ng/vim-hybrid'
Bundle 'nanotech/jellybeans.vim'

Bundle 'scrooloose/nerdtree'
Bundle 'SirVer/ultisnips'
Bundle 'bling/vim-airline'

if has_vundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif


""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
let mapleader = ","                 " Rebind <Leader> key
set backspace=indent,eol,start      " Make backspace work like most other apps
set clipboard=unnamedplus           " Better cpoy and paste
set history=1000                    " Set the number of lines of history VIM has to remember
set timeoutlen=500                  " Time to wait for a command
set autoread                        " Set auto read when a file is changed outside of VIM
set autowrite
set hidden                          " Change buffer - without saving 

" Turn backup off
set nobackup
set nowritebackup
set noswapfile

" About searching
set ignorecase
set smartcase
set incsearch
set hlsearch

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=


""""""""""""""""""""""""""""""""""""""""
" => Encoding, fileformat and language
""""""""""""""""""""""""""""""""""""""""
" Set utf-8 encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936,latin-1
set fileencoding=utf-8

language messages en_US.utf8

" Auto detect file format
set fileformats=unix,dos,mac


""""""""""""""""""""""""""""""""""""""""
" => Vim gui settings
""""""""""""""""""""""""""""""""""""""""
syntax enable                       " Enable syntax highlighting
set number                          " Display line numbers
set ruler                           " Show cursor position
set showcmd                         " Show partial cmd in the last line of the srceen
set showmatch                       " Show matching brackets/parenthesis 
set matchtime=2
set wrap
set textwidth=80
set list                            " Show tabs and spaces and so on
set listchars=tab:▸▸,eol:¬,extends:»,precedes:«

" Turn on the wild menu
set wildmenu
set wildmode=longest,full

" Indent and tab
set expandtab                       " Convert all tabs to spaces
set tabstop=4
set shiftwidth=4
set smarttab
set autoindent

" Status line
set laststatus=2                    " Always show the status line

" Folding settings
set foldmethod=indent               " Fold based on indent
set nofoldenable
set foldcolumn=1

" Fonts and colors
set guifont=Inconsolata-dz\ for\ Powerline\ Medium\ 10.5
if has('gui_running')
    set guioptions-=T
    colorscheme jellybeans
else
    set t_Co=256
    colorscheme hybrid
endif


""""""""""""""""""""""""""""""""""""""""
" => Key mapping
""""""""""""""""""""""""""""""""""""""""
" Bind Ctrl+<movement> keys to move around the windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


""""""""""""""""""""""""""""""""""""""""
" => Plugins settings
""""""""""""""""""""""""""""""""""""""""
" Nerdtree
nnoremap <silent> <F4> :NERDTreeToggle<CR>
let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=1
let NERDTreeWinSize=30
let NERDTreeDirArrows=1
let NERDTreeIgnore=['.pyc$[[file]]','\~$'] " Ignore file

" UltiSnips
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsSnippetsDir="~/.vim/snippets"
let g:UltiSnipsSnippetDirectories=["snippets", "UltiSnips"]

" Airline
set noshowmode
let g:airline_theme = 'jellybeans'
let g:airline_powerline_fonts = 1
let g:airline_detect_modified = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ '' : 'V',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '' : 'S',
  \ }
let g:airline_section_b = '%{getcwd()}'
let g:airline_section_c = '%t'


" Tagbar
nnoremap <silent> <F5> :TagbarToggle<CR>
let g:tagbar_width = 30
let g:tagbar_autofocus = 1
let g:tagbar_expand = 0
let g:tagbar_foldlevel = 99
let g:tagbar_iconchars = ['▾', '▸']
let g:tagbar_autoshowtag = 1

" Nerd_commenter
let NERDCommentWholeLinesInVMode=2
let NERDSpaceDelims=1
let NERDRemoveExtraSpaces=1


" DelimitMate
let delimitMate_expand_cr=1
let delimitMate_expand_space=1
let delimitMate_balance_matchpairs=1

" Ctrlp
let g:ctrlp_cmd='CtrlPBuffer'
let g:ctrlp_working_path_mode=0
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_cache_dir=$HOME.'/.vim/.cache/ctrlp'
let g:ctrlp_extensions=['tag', 'bufferstag', 'quickfix', 'dir', 'rtscript']

