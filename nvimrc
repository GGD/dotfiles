call plug#begin('~/.local/share/nvim/plugged')
" UI
Plug 'Yggdroot/indentLine'
Plug 'iCyMind/NeoSolarized'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTree' }
Plug 'airblade/vim-gitgutter'

" Search
Plug 'mileszs/ack.vim'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Syntax
Plug 'tpope/vim-rails'
Plug 'tpope/vim-ragtag'
Plug 'slim-template/vim-slim'

" Snippet
Plug 'mattn/emmet-vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

" Tools
Plug 'jiangmiao/auto-pairs'
Plug 'neovim/nvim-lspconfig'
Plug 'ojroques/nvim-lspfuzzy'
Plug 'godlygeek/tabular'
Plug 'AndrewRadev/tagalong.vim'
Plug 'tomtom/tcomment_vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'andymass/vim-matchup'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()



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

" ack-vim setting
let g:ackprg = 'ag --nogroup --nocolor --column'

" indentLine setting
let g:indentLine_enabled = 0



let mapleader = "\<Space>"

map <Leader>vr :vsp $MYVIMRC<CR>
map <Leader>so :source $MYVIMRC<CR>

" Move inside a sigle line
nmap k gk
nmap j gj

map <Leader>h :nohl<CR>

vmap <C-c> "*y
map <C-w> :w<CR>
map <C-q> :q<CR>
map <C-p> :FZF<CR>
map <Leader>co ggVG"*y
map <Leader>bb obyebug<ESC>:w<CR>

map <Leader>h :nohl<CR>

" nerd-tree
map <Leader>nt :NERDTree<CR>
map <Leader>nf :NERDTreeFind<CR>

" indentLine
map <Leader>il :IndentLinesToggle<CR>

" vim-easymition
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" fugitive.vim
map <Leader>gb :Gblame<CR>

" ack.vim
map <Leader>F :Ack<Space>



" fzf
set rtp+=/usr/local/opt/fzf
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'

" vim-snipmate setting
let g:snipMate = { 'snippet_version' : 1 }

" nvim-lspconfig
lua << EOF
require'lspconfig'.solargraph.setup{}
require'lspconfig'.pyright.setup{}
EOF

" nvim-lspfuzzy
lua require('lspfuzzy').setup {}
nnoremap <silent><leader>ls <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent><leader>ll <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent><leader>lg <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent><leader>la <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent><leader>l; <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent><leader>l, <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" airline
let g:airline_solarized_bg='dark'
