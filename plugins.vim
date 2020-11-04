""""""""""""""""""""""""""""""""""""""""
" => Plugins settings
""""""""""""""""""""""""""""""""""""""""

" Color theme
if has('gui_running')
    set background=light
    colorscheme solarized8
else
    set background=dark
    " let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    " let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
    colorscheme solarized8
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
let g:ale_linters_explicit = 1
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_linters = {
\   'c': ['ccls'],
\   'c++': ['ccls']
\}
let g:ale_c_cc_options = '-std=c99 -wall'
let g:ale_cpp_cc_options = '-std=c++17 -wall'


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
\   'dir': ['.svn','.git','.hg', '.ccls-cache'],
\   'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
\}
noremap <leader>p :LeaderfFunction<cr>


" CPP syntax highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1


" Coc
set updatetime=300
inoremap <silent><expr> <tab>
        \ pumvisible() ? "\<c-n>" :
        \ <SID>check_back_space() ? "\<tab>" :
        \ coc#refresh()
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<c-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<c-g>u\<cr>\<c-r>=coc#on_enter()\<cr>"

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" YouCompleteMe
" set completeopt-=preview
" let g:ycm_clangd_uses_ycmd_caching = 0
" let g:ycm_show_diagnostics_ui = 0
" let g:ycm_min_num_identifier_candidate_chars = 2
" let g:ycm_semantic_triggers = {
"             \ 'c,cpp,python,go': ['re!\w{2}'],
"             \}
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
"
" let g:ycm_language_server = [{
"             \'name': 'ccls',
"             \'cmdline': ['ccls'],
"             \'filetypes': ['c', 'cpp', 'cuda', 'objc', 'objcpp'],
"             \'project_root_files': ['.ccls-root', 'compile_commands.json']
"             \}]
