
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
"Plugin 'yuttie/comfortable-motion.vim'
Plugin 'vim-scripts/grep.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'pangloss/Vim-simplefold'
Plugin 'octol/vim-cpp-enhanced-highlight'
call vundle#end()

"setting
if has("syntax")
	syntax on
endif

set tabstop=1
set rnu
set nu
set hlsearch
set incsearch
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
"autocmd VimEnter * Tagbar

"for jellybeans
colorscheme jellybeans
let g:jellybeans_use_lowcolor_black = 1

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

"SimpleFold 
set foldmethod=syntax
set foldnestmax=1
set foldlevel=5

"C++ Enhanced Highlight
"let g:cpp_class_scope_highlight = 1
"let g:cpp_class_decl_highlight = 1
"let g:cpp_experimental_template_highlight = 1
let g:cpp_member_variable_highlight = 1

"rainbow
"au FileType c,cpp,objc,objcpp call rainbow#load()
"let g:rainbow_active = 1

"key map
map <F2> :NERDTreeToggle<cr>
nmap <F3> :Tagbar<CR>
nnoremap <C-h> :bp<CR>
nnoremap <C-l> :bn<CR>
nnoremap <Leader>q :bd<CR>

map f <Plug>(easymotion-bd-w)
nmap f <Plug>(easymotion-overwin-w)
map <Leader>b <Plug>(easymotion-bd-b)
nmap <Leader>b <Plug>(easymotion-overwin-b)
