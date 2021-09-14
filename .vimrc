set shell=/bin/bash
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

"Vundle
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'}
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'airblade/vim-gitgutter' " vim with git status(added, modified, and removed lines)
Plugin 'tpope/vim-fugitive' " vim with git command(e.g., Gdiff)
Plugin 'blueyed/vim-diminactive'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'cespare/vim-toml'
Plugin 'elzr/vim-json'
Plugin 'itchyny/vim-cursorword'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'machakann/vim-highlightedyank'
Plugin 'frazrepo/vim-rainbow'
Plugin 'shime/vim-livedown'
call vundle#end()

"setting
if has("syntax")
	syntax on
endif

set tabstop=2
set nu
set hlsearch
set autoindent
set cindent
set showmatch
set smartcase
set smarttab
set smartindent
set ruler
set clipboard=unnamedplus
set mouse=a
colorscheme jellybeans

"cscope
set csprg=/usr/bin/cscope
set csto=0
set cst
set nocsverb

if filereadable("./cscope.out")
cs add cscope.out
else
cs add /usr/src/linux/cscope.out
endif
set csverb

"ctags
set tags+=/home/jaeyong/Workspace/tags
set tags+=./tags

set t_Co=256

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

"Markdown

"key map
map <F3> :NERDTreeToggle<cr>
map <F2> :sp<cr>
nmap <F5> :LivedownToggle<CR>
nmap <F4> :Tagbar<CR>
map <F8> :set nu<cr>
map <F7> :set nu!<cr>
nnoremap <C-e> :bp<CR>
nnoremap <C-r> :bn<CR>
