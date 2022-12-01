let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')
exec 'source ' . s:path . '/plugins.vim'
exec 'source ' . s:path . '/basic.vim'
exec 'source ' . s:path . '/plugins_config.vim'
