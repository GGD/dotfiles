call plug#begin('~/.local/share/nvim/plugged')
Plug 'mileszs/ack.vim'
Plug 'pearofducks/ansible-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'skywind3000/asyncrun.vim'
Plug 'mattn/emmet-vim'
Plug 'neomake/neomake'
Plug 'iCyMind/NeoSolarized'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'vim-ruby/vim-ruby'
Plug 'slim-template/vim-slim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'janko-m/vim-test'
Plug 'posva/vim-vue'
call plug#end()



" Enable built-in matchit plugin
runtime macros/matchit.vim



set bg=light
set backspace=2
" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Numbers
set relativenumber
set numberwidth=3

" Theme
syntax enable
set termguicolors
set background=dark
colorscheme NeoSolarized

" command autocompletion
set wildmode=longest,full
set wildmenu
set ignorecase



" fzf
set rtp+=/usr/local/opt/fzf

" ack-vim setting
let g:ackprg = 'ag --nogroup --nocolor --column'

" neomake setting
autocmd! BufWritePost * Neomake

" vim-rails setting
let g:rails_ctags_arguments = ['--languages=ruby --exclude=.git --exclude=log .']

" asyncrun.vim setting
let g:asyncrun_open = 8

" vim-test setting
let test#strategy = 'asyncrun'
let test#javascript#mocha#executable = 'node_modules/mocha/bin/mocha --require babel-register'



let mapleader = "\<Space>"

nmap <Leader>vr :vsp $MYVIMRC<CR>
nmap <Leader>so :source $MYVIMRC<CR>

" Move inside a sigle line
nmap k gk
nmap j gj

map <Leader>bp orequire 'pry'; binding.pry<ESC>:w<CR>
map <Leader>co ggVG"*y
map <Leader>d obyebug<ESC>:w<CR>
map <Leader>md :!mkdir -p<Space>
map <Leader>to :touch<Space>

vmap <C-c> "*y
map <C-h> :nohl<CR>
map <C-p> :FZF<CR>
map <C-s> :w<CR>
map <C-q> :q<CR>

" ack.vim
map <Leader>f :Ack<Space>

" nerd-tree
map <Leader>nt :NERDTree<CR>

" fugitive.vim
map <Leader>gb :Gblame<CR>

" vim-test
map <Leader>s :w<CR>:TestNearest<CR>
map <Leader>l :w<CR>:TestLast<CR>
map <Leader>t :w<CR>:TestFile<CR>
map <Leader>a :w<CR>:TestSuite<CR>
map <Leader>v :TestVisit<CR>
