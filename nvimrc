" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'iCyMind/NeoSolarized'
Plug 'freeo/vim-kalisi'
Plug 'thoughtbot/vim-rspec'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'


" Initialize plugin system
call plug#end()

set backspace=2

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Numbers
set relativenumber
set numberwidth=4

" Theme
syntax enable
set termguicolors
set background=dark
colorscheme NeoSolarized

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
map <Leader>a :call RunAllSpecs()<CR>
map <Leader>bb obyebug<ESC>
nmap <Leader>co ggVGy"*y
map <Leader>l :call RunLastSpec()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>t :call RunCurrentSpecFile()<CR>

