call plug#begin('~/.local/share/nvim/plugged')
" UI
Plug 'iCyMind/NeoSolarized'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTree' }
Plug 'airblade/vim-gitgutter'

" Search
Plug 'easymotion/vim-easymotion'
Plug 'mileszs/ack.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'

" Syntax
Plug 'pearofducks/ansible-vim'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'slim-template/vim-slim'
Plug 'posva/vim-vue'

" Snippet
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

" Tool
Plug 'jiangmiao/auto-pairs'

Plug 'mattn/emmet-vim'
Plug 'neomake/neomake', { 'on': 'Neomake' }
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-dispatch', { 'on': 'Dispatch' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'janko-m/vim-test'
Plug 'christoomey/vim-tmux-navigator'
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

" vim-test setting
let test#strategy = 'dispatch'
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
map <Leader>h :nohl<CR>

vmap <C-c> "*y
map <C-p> :FZF<CR>
map <C-s> :w<CR>
map <C-q> :q<CR>

" ack.vim
map <Leader>F :Ack<Space>

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

" indentLine
map <Leader>it :IndentLinesToggle<CR>

" vim-easymition
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" vim-incsearch with vim-easymotion
" You can use other keymappings like <C-l> instead of <CR> if you want to
" use these mappings as default search and somtimes want to move cursor with
" EasyMotion.
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction
noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))
