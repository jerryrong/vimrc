""""""""""""""""""""""""""""""""""""""""
" => Plugins settings
""""""""""""""""""""""""""""""""""""""""

" Color theme
if has('gui_running')
    set background=light
    colorscheme gruvbox
    let g:gruvbox_contrast_light = 'soft'
else
    set background=dark
    colorscheme solarized
endif


" Airline
set noshowmode
if has('gui_running')
    let g:airline_powerline_fonts = 1
else
    let g:airline_powerline_fonts = 0
endif

let g:airline_detect_modified = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
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


" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 1

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

