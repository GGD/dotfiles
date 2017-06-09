" ========================================================================
" Vundle stuff
" ========================================================================
set nocompatible " Required by vundle
filetype off     " Required by vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required



set backspace=2

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Numbers
set relativenumber
set numberwidth=5



" Theme
syntax enable
set background=dark
colorscheme solarized


" Vim-rails setting
let g:rails_ctags_arguments = ['--languages=ruby --exclude=.git --exclude=log .']


let mapleader = "\<Space>"

nmap <Leader>vr :vsp $MYVIMRC<CR>
nmap <Leader>so :source $MYVIMRC<CR>

" Move inside a sigle line
nmap k gk
nmap j gj

map <Leader>. gt
nmap <Leader>, gT
map <Leader>a :w<CR>:call RunAllSpecs()<CR>
map <Leader>bb obyebug<ESC>:w<CR>
nmap <Leader>co ggVGy"*y
map <Leader>l :call RunLastSpec()<CR>
map <Leader>s :w<CR>:call RunNearestSpec()<CR>
map <Leader>t :w<CR>:call RunCurrentSpecFile()<CR>

