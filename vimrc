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

" Color schemes
Plugin 'nanotech/jellybeans.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'altercation/vim-colors-solarized'

" Fuzzy search, don't limited to file, buffer
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'

" Statusline
Plugin 'bling/vim-airline'

" Tags of source code files
Plugin 'majutsushi/tagbar'

" Filesystem exploring
Plugin 'scrooloose/nerdtree'

" Automatic closing of quotes, parenthesis, brackets, etc.
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-surround'

" Comment
"Plugin 'scrooloose/nerdcommenter'
Plugin 'tomtom/tcomment_vim'

" Code completion engine
"Plugin 'Valloric/YouCompleteMe'

" Syntax checking
"Plugin 'scrooloose/syntastic'

" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Syntax
"Plugin 'jnwhiteh/vim-golang'
"Plugin 'othree/html5.vim'

call vundle#end()

if has_vundle == 0
    echo "Installing..."
    echo ""
    :PluginInstall
endif


""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on

" Rebind <Leader> key
let mapleader = ","

set backspace=indent,eol,start
set clipboard=unnamedplus
set history=1000

" Time to wait for a command
set timeoutlen=500
set ttimeoutlen=50

" Set auto read when a file is changed outside of VIM
set autoread
set autowrite

" Change buffer - without saving 
set hidden

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

" Turn on the wild menu
set wildmenu
set wildmode=longest,full
set wildignore=*.o,*~,*.pyc


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
syntax enable
set number
set ruler
set showcmd
set showmatch
set matchtime=2
set nowrap
set textwidth=80
set laststatus=2

" Show tabs and spaces and so on
set list
set listchars=tab:▸▸,eol:¬,extends:»,precedes:«

" Indent and tab
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab
set autoindent

" " Folding settings
" set foldmethod=syntax
" set nofoldenable
" set foldcolumn=1

" Don't give the intro message
set shortmess=filnxtToOI

" Fonts and colors
" set guifont=Inconsolata-dz\ for\ Powerline\ Medium\ 10.5
set guifont=Fantasque\ Sans\ Mono\ 11.5
set background=dark

" Setting for jellybeans
let g:jellybeans_overrides = {
\    'Comment': {'attr': ''},
\}

if has('gui_running')
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guioptions-=m

    " Setting for solarized
    let g:solarized_menu=0
    let g:solarized_italic=0
    let g:solarized_termcolors=256

    colorscheme solarized
    "colorscheme base16-tomorrow
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

" Make search results appear in the middle on the screen
nnoremap n nzz
nnoremap N Nzz


""""""""""""""""""""""""""""""""""""""""
" => Plugins settings
""""""""""""""""""""""""""""""""""""""""
" Unite
let g:unite_force_overwrite_statusline = 0
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom#profile('default', 'context', {
\   'start_insert': 1,
\   'winheight': 10,
\   'direction': 'botright',
\})
call unite#custom#source('file,file_rec,file_rec/async,buffer',
    \'ignore_pattern', join([
    \'\.git/',
    \'\.pyc',
    \'\.o',
    \],'\|'))
nnoremap <C-p> :Unite file_rec/async<CR>

" Airline
set noshowmode
let g:airline_powerline_fonts = 1
let g:airline_detect_modified = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
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

" Tagbar
nnoremap <silent> <F5> :TagbarToggle<CR>
let g:tagbar_width = 30
let g:tagbar_autofocus = 1
let g:tagbar_expand = 0
let g:tagbar_foldlevel = 99
let g:tagbar_iconchars = ['▾', '▸']
let g:tagbar_autoshowtag = 1

" UltiSnips
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsSnippetsDir="~/.vim/mysnippets"
let g:UltiSnipsSnippetDirectories=["mysnippets", "UltiSnips"]
" let g:UltiSnipsExpandTrigger='<c-j>'
" let g:UltiSnipsJumpForwardTrigger='<c-j>'
" let g:UltiSnipsJumpBackwardTrigger='<c-k>'

" Nerdtree
nnoremap <silent> <F4> :NERDTreeToggle<CR>
let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=1
let NERDTreeWinSize=30
let NERDTreeDirArrows=1
let NERDTreeIgnore=['.pyc$[[file]]','\~$'] " Ignore file

" DelimitMate
let delimitMate_expand_cr = 1

" " Nerd_commenter
" let NERDCommentWholeLinesInVMode=2
" let NERDSpaceDelims=1
" let NERDRemoveExtraSpaces=1

" " YouCompleteMe
" let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_seed_identifiers_with_syntax = 1

" " Ctrlp
" let g:ctrlp_cmd='CtrlPBuffer'
" let g:ctrlp_working_path_mode='rw'
" let g:ctrlp_clear_cache_on_exit=0
" let g:ctrlp_cache_dir=$HOME.'/.vim/.cache/ctrlp'
" let g:ctrlp_extensions=['tag', 'bufferstag', 'quickfix', 'dir', 'rtscript']

" " Syntastic
" let g:syntastic_enable_balloons = 0
" let g:syntastic_mode_map = {'mode': 'active',
                           " \'active_filetypes': [],
                           " \'passive_filetypes': [] }

