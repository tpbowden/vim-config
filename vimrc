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
set backupdir=/var/tmp,~/.tmp,.
set directory=/var/tmp,~/.tmp,.
set colorcolumn=120
set synmaxcol=200
set nowrap

colorscheme molokai

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

let mapleader = ","

let g:NERDSpaceDelims = 1

map <silent> <Leader><Leader> :b#<CR>
nmap <silent> <unique> <Leader>. :BufExplorer<CR>
nmap <silent> <Leader>m :NERDTreeToggle<CR>

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
map <leader>rt :!ctags -R .<CR><CR>


" ----------------------------------------------
" Setup NERDTree
" ----------------------------------------------
" Make NERDTree close when you open a file from it. Helps recover screen space!
let NERDTreeQuitOnOpen=1

" Disable netrw's autocmd, since we're ALWAYS using NERDTree
runtime plugin/netRwPlugin.vim
augroup FileExplorer
  au!
augroup END

let g:NERDTreeHijackNetrw = 0

" ----------------------------------------------
" Setup CtrlP File Finder
" ----------------------------------------------

let g:ctrlp_show_hidden = 1

" Use Ag for search if its available on this system
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
  set grepformat=%f:%l:%c:%m,%f:%l:%m
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

highlight Visual cterm=bold ctermbg=Blue ctermfg=NONE

" ----------------------------------------------
" Setup Ack.vim to use silver searcher
" ----------------------------------------------
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
endif

cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif
