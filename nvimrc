" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

Plug 'easymotion/vim-easymotion'
Plug 'iCyMind/NeoSolarized'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'pearofducks/ansible-vim'
Plug 'slim-template/vim-slim'
Plug 'thoughtbot/vim-rspec'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'

" Initialize plugin system
call plug#end()


runtime macros/matchit.vim


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

" fzf
set rtp+=/usr/local/opt/fzf


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
map <Leader>bp orequire 'pry'; binding.pry<ESC>:w<CR>
map <Leader>co ggVG"*y
map <Leader>d obyebug<ESC>:w<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>t :call RunCurrentSpecFile()<CR>

vmap <C-c> "*y

