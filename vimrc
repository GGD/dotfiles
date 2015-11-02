" ========================================================================
" Vundle stuff
" ========================================================================
set nocompatible  " Required by vundle
filetype off      " Required by vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" numbers
set number
set numberwidth=4

" Softtabs, 2 spaces
set expandtab
set tabstop=2
set shiftwidth=2
set shiftround

" Makr it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" theme
syntax enable
set background=dark
colorscheme solarized

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let mapleader=","

map <Leader>f :CtrlP<cr>
map <Leader>wl <C-w>l<cr>
map <Leader>wh <C-w>h<cr>
map <Leader>wj <C-w>j<cr>
map <Leader>wk <C-w>k<cr>
