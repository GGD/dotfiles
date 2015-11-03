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
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tomtom/tcomment_vim'
Plugin 'kana/vim-textobj-user'
Plugin 'https://github.com/whatyouhide/vim-textobj-erb'
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on
colorscheme solarized


" Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


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

map <Leader>vim :source ~/.vimrc<cr>
map <Leader>mvim :e $MYVIMRC<cr>
map <Leader>f :CtrlP<cr>
map <Leader>l <C-w>l<cr>
map <Leader>h <C-w>h<cr>
map <Leader>j <C-w>j<cr>
map <Leader>k <C-w>k<cr>
map <Leader>L <C-w>L<cr>
map <Leader>H <C-w>H<cr>
map <Leader>J <C-w>J<cr>
map <Leader>K <C-w>K<cr>
map <Leader>bb :!bundle install<cr>
map <Leader>bi :source ~/.vimrc<cr>:PluginInstall<cr>
map <Leader>d orequire'pry';binding.pry<esc>:w<cr>
map <Leader>ed o<%=binding.pry%><esc>:w<cr>
map <Leader>sc :w !pbcopy<cr>
map <Leader>sp :r !pbpaste<cr>
" RSpec.vim mappings
map <Leader>rc :call RunCurrentSpecFile()<cr>
map <Leader>rn :call RunNearestSpec()<cr>
map <Leader>rl :call RunLastSpec()<cr>
map <Leader>ra :call RunAllSpecs()<cr>

set ignorecase smartcase
set autoread

" numbers
set number
set numberwidth=4
set relativenumber

" Softtabs, 2 spaces
set expandtab
set tabstop=2
set shiftwidth=2
set shiftround

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Makr it obvious where 80 characters is
" set textwidth=80
" set colorcolumn=+1

set background=dark
