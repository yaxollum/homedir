set tabstop=4 softtabstop=0 expandtab shiftwidth=4 autoindent 
syntax on
set clipboard=unnamedplus
set hlsearch
set spell
inoremap {<CR> {<CR>}<Esc>ko
inoremap <F9> <Nop>

function ExecCurrentFile()
if expand("%:t")=="problems.txt"
! clear && problem-tracker < %
else
so %
endif
endfunction

"noremap <F5> :w \| so %<CR>
noremap <F5> :w \| call ExecCurrentFile()<CR>

map <Enter> o<ESC>
autocmd BufRead,BufNewFile *.lalrpop setlocal filetype=rust

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
