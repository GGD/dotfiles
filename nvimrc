call plug#begin('~/.local/share/nvim/plugged')

Plug 'easymotion/vim-easymotion'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'iCyMind/NeoSolarized'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'janko-m/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'kana/vim-textobj-user'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'mileszs/ack.vim'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'neomake/neomake'
Plug 'pangloss/vim-javascript'
Plug 'pearofducks/ansible-vim'
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdtree'
Plug 'slim-template/vim-slim'
Plug 'tomtom/tcomment_vim'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
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


" command autocompletion
set wildmode=longest,full
set wildmenu
set ignorecase


" fzf
set rtp+=/usr/local/opt/fzf


" vim-rails setting
let g:rails_ctags_arguments = ['--languages=ruby --exclude=.git --exclude=log .']

" vim-markdown setting
let vim_markdown_preview_hotkey='<C-m>'

" neomake setting
autocmd! BufWritePost * Neomake

" vim-test setting
let test#strategy = 'basic'
let test#javascript#mocha#executable = 'node_modules/mocha/bin/mocha --require babel-register'

" neoformat setting
let g:neoformat_try_formatprg = 1
augroup NeoformatAutoFormat
  autocmd!
  autocmd FileType javascript setlocal formatprg=prettier\
                                           \--stdin\
                                           \--print-width\ 80\
                                           \--single-quote\
                                           \--trailing-comma\ es5
  autocmd BufWritePre *.js,*.jsx Neoformat
augroup END

" ack-vim setting
let g:ackprg = 'ag --nogroup --nocolor --column'


let mapleader = "\<Space>"

nmap <Leader>vr :vsp $MYVIMRC<CR>
nmap <Leader>so :source $MYVIMRC<CR>

" Move inside a sigle line
nmap k gk
nmap j gj

map <Leader>. gt
nmap <Leader>, gT
map <Leader>bp orequire 'pry'; binding.pry<ESC>:w<CR>
map <Leader>co ggVG"*y
map <Leader>d obyebug<ESC>:w<CR>
map <Leader>f :Ack<Space>
map <Leader>gb :Gblame<CR>
map <Leader>sn :<C-U>SnippetFor<Space>

" nerd-tree
map <Leader>nt :NERDTree<CR>

" vim-test
map <Leader>s :w<CR>:TestNearest<CR>
map <Leader>l :w<CR>:TestLast<CR>
map <Leader>t :w<CR>:TestFile<CR>
map <Leader>a :w<CR>:TestSuite<CR>
map <Leader>v :TestVisit<CR>

vmap <C-c> "*y
map <C-s> :w<CR>
map <C-p> :FZF<CR>
map <C-q> :q<CR>

function! SearchSnippet(language)
  let snippet='~/.local/share/nvim/plugged/vim-snippets/snippets/'.a:language.'.snippets'
  execute 'tabedit' snippet
endfunction
command! -nargs=1 SnippetFor call SearchSnippet('<args>')
