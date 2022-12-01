""""""""""""""""""""""""""""""""""""""""
" => Plugins settings
""""""""""""""""""""""""""""""""""""""""

" Color theme
if has('termguicolors')
    set termguicolors
endif

set bg=dark
if has('gui_running')
    let g:gruvbox_material_background = 'soft'
    let g:gruvbox_material_disable_italic_comment = 1
    colorscheme gruvbox-material
else
    " let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    " let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    let g:solarized_italics = 0
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

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~ '\s'
endfunction

inoremap <silent><expr> <tab>
        \ pumvisible() ? "\<c-n>" :
        \ <SID>check_back_space() ? "\<tab>" :
        \ coc#refresh()
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<c-g>u\<cr>\<c-r>=coc#on_enter()\<cr>"

let g:coc_snippet_next = '<TAB>'

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" vim-go settings
let g:go_code_completion_enabled = 0
let g:go_fmt_command = "goimports"
let g:go_def_mapping_enabled = 0
let g:go_metalinter_enabled = []

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1


" clang-format
let g:clang_format#auto_format = 1
let g:clang_format#enable_fallback_style = 0

