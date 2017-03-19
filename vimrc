set nocompatible

call plug#begin('~/.vim/plugged')
source ~/.vim/plugins.vim
call plug#end()

if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

set hidden
set mouse=a
set number
set tabstop=2
set shiftwidth=2
set expandtab
set t_Co=256
set background=dark

colorscheme molokai

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

let g:netrw_banner = 0
let g:netrw_liststyle = 3

