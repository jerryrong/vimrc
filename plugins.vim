""""""""""""""""""""""""""""""""""""""""
" => Plugins settings
""""""""""""""""""""""""""""""""""""""""

" Color theme
if has('gui_running')
    set background=light
    colorscheme solarized
else
    set t_Co=256
    set background=dark
    colorscheme solarized
endif


" Airline
set noshowmode
let g:airline_powerline_fonts = 1
let g:airline_detect_modified = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_mode_map = {
    \ '__': '-',
    \ 'n' : 'N',
    \ 'i' : 'I',
    \ 'R' : 'R',
    \ 'c' : 'C',
    \ 'v' : 'V',
    \ 'V' : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }
let g:airline_section_b = '%{getcwd()}'


" DelimitMate
let delimitMate_expand_cr = 1


" ALE
let g:ale_echo_msg_format = '[%linter%] %code: %%s'

let g:ale_linters = {'c': ['clang'], 'c++': ['clang']}
let g:ale_c_clang_options = '-std=c99 -Wall'
let g:ale_cpp_clang_options = '-std=c++11 -Wall'


" Gutentags
set tags=./.tags;,.tags
let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_cache_dir = expand('~/.cache/tags')

let g:gutentags_project_root = ['.git']
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']



" LeaderF
let g:Lf_ShowRelativePath = 0
let g:Lf_WindowHeight = 0.30
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function': 0}
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font':'' }
let g:Lf_WildIgnore = {
\   'dir': ['.svn','.git','.hg'],
\   'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
\}
noremap <m-p> :LeaderfFunction<cr>


" YouCompleteMe
set completeopt-=preview
let g:ycm_show_diagnostics_ui = 0
let g:ycm_semantic_triggers = {
            \ 'c,cpp,python,go': ['re!\w{2}'],
            \}
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
