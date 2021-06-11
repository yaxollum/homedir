set tabstop=4 softtabstop=0 expandtab shiftwidth=4 autoindent 
syntax on
set clipboard=unnamedplus
set hlsearch
set spell
inoremap {<CR> {<CR>}<Esc>ko
inoremap <F9> <Nop>
noremap <F5> :w \| so %<CR>

map <Enter> o<ESC>
autocmd BufRead,BufNewFile *.lalrpop setlocal filetype=rust
