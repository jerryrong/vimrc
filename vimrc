" Author: Jerry Rong

""""""""""""""""""""""""""""""""""""""""
" => Vundle plugin manager
""""""""""""""""""""""""""""""""""""""""
" No Vi-compatible
set nocompatible

let has_vundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let has_vundle=0
endif

" Required!
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
" Let Vundle manage Vundle
Plugin 'gmarik/vundle'

" Plugin Bundles

" Color schemes and UI
Plugin 'nanotech/jellybeans.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'

" Code completion engine
Plugin 'Valloric/YouCompleteMe'

" Filesystem exploring
Plugin 'scrooloose/nerdtree'

" Fuzzy file, buffer, mru, ... finder
Plugin 'kien/ctrlp.vim'

" Automatic closing of quotes, parenthesis, brackets, etc.
Plugin 'Raimondi/delimitMate'

" Syntax checking
Plugin 'scrooloose/syntastic'

" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Comment
Plugin 'scrooloose/nerdcommenter'

" Tags of source code files
Plugin 'majutsushi/tagbar'

" Lisp interaction mode
Plugin 'kovisoft/slimv'

" Syntax
Plugin 'jnwhiteh/vim-golang'
Plugin 'othree/html5.vim'

call vundle#end()

if has_vundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :PluginInstall
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
set ttimeoutlen=50
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
set nowrap
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
set foldmethod=syntax               " Fold based on indent
set nofoldenable
set foldcolumn=1

" Don't give the intro message
set shortmess=filnxtToOI

" Fonts and colors
" set guifont=Inconsolata-dz\ for\ Powerline\ Medium\ 10.5
set guifont=Fantasque\ Sans\ Mono\ 11.5
set background=dark

" Setting for solarized
" let g:solarized_menu=0
" let g:solarized_italic=0
" let g:solarized_termcolors=256

" Setting for jellybeans
let g:jellybeans_overrides = {
\    'Comment': {'attr': ''},
\}

if has('gui_running')
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    " colorscheme solarized
    colorscheme base16-tomorrow
    set lines=100
    set columns=88
else
    set t_Co=256
    colorscheme jellybeans
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
let g:UltiSnipsSnippetsDir="~/.vim/mysnippets"
let g:UltiSnipsSnippetDirectories=["mysnippets", "UltiSnips"]
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'

" Airline
set noshowmode
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

" Nerd_commenter
let NERDCommentWholeLinesInVMode=2
let NERDSpaceDelims=1
let NERDRemoveExtraSpaces=1

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_seed_identifiers_with_syntax = 1

" Ctrlp
let g:ctrlp_cmd='CtrlPBuffer'
let g:ctrlp_working_path_mode='rw'
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_cache_dir=$HOME.'/.vim/.cache/ctrlp'
let g:ctrlp_extensions=['tag', 'bufferstag', 'quickfix', 'dir', 'rtscript']

" Tagbar
nnoremap <silent> <F5> :TagbarToggle<CR>
let g:tagbar_width = 30
let g:tagbar_autofocus = 1
let g:tagbar_expand = 0
let g:tagbar_foldlevel = 99
let g:tagbar_iconchars = ['▾', '▸']
let g:tagbar_autoshowtag = 1

" Syntastic
let g:syntastic_enable_balloons = 0
let g:syntastic_mode_map = {'mode': 'active',
                           \'active_filetypes': [],
                           \'passive_filetypes': [] }

" DelimitMate
let delimitMate_expand_cr = 1

