
set nocompatible              " be iMproved, required
filetype plugin on                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

"Vundle
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'}
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'airblade/vim-gitgutter' 
Plugin 'tpope/vim-fugitive' 
Plugin 'blueyed/vim-diminactive'
Plugin 'godlygeek/tabular'
Plugin 'cespare/vim-toml'
Plugin 'elzr/vim-json'
Plugin 'itchyny/vim-cursorword'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'machakann/vim-highlightedyank'
Plugin 'frazrepo/vim-rainbow'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'mhinz/vim-startify'
Plugin 'osyo-manga/vim-anzu'
Plugin 'yuttie/comfortable-motion.vim'
call vundle#end()

"setting
if has("syntax")
	syntax on
endif

set tabstop=1
set rnu
set nu
set hlsearch
set autoindent
set cindent
set shiftwidth=3
set expandtab
set history=1000
set showmatch
set smartcase
set smartindent
set ruler
set clipboard=unnamedplus
set mouse=a
set cursorline
colorscheme jellybeans

"cscope
set csprg=/usr/bin/cscope
set csto=0
set cst
set nocsverb

if filereadable("./cscope.out")
cs add cscope.out
else
cs add /usr/src/linux-headers-5.11.0-40-generic/cscope.out
endif
set csverb

"ctags
set tags+=./tags
set tags+=/usr/src/linux-headers-5.11.0-40-generic/tags
set t_Co=256
autocmd VimEnter * Tagbar

"for jellybeans
colorscheme jellybeans


"for indent guide
let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '|'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

"for vim-airline
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
let g:airline_theme='jellybeans'
set laststatus=2 " turn on bottom bar
let mapleader = ","
nnoremap <leader>q :bp<CR>
nnoremap <leader>w :bn<CR>

"for blueyed/vim-diminactive
let g:diminactive_enable_focus = 1

syntax enable
filetype indent on
highlight Comment term=bold cterm=bold ctermfg=4:

"Nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowHidden=1

"key map
map <F2> :NERDTreeToggle<cr>
nmap <F3> :Tagbar<CR>
nnoremap <C-e> :bp<CR>
nnoremap <C-r> :bn<CR>
nnoremap <expr> <Down> pumvisible() ? "<C-n>" : "<Down>"
nnoremap <expr> <UP> pumvisible() ? "<C-p>" : "<Up>"
