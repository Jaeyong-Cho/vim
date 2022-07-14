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
"Plugin 'vim-scripts/AutoComplPop'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'mhinz/vim-startify'
Plugin 'osyo-manga/vim-anzu'
"Plugin 'yuttie/comfortable-motion.vim'
Plugin 'vim-scripts/grep.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'pangloss/Vim-simplefold'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-endwise'
"Plugin 'vim-syntastic/syntastic'
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

"Scroll
set sidescrolloff=10 " Keep at least 3 lines left/right
set scrolloff=10     " Keep at least 3 lines above/below

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

"for colorscheme
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

"syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_c_checkers = ['make', 'gcc']
"let g:syntastic_cpp_checkers = ['make', 'gcc']
"let g:syntastic_python_checkers = ['pylink']

"ycm
let g:ycm_register_as_syntastic_checker = 1 "default 1
let g:Show_diagnostics_ui = 1 "default 1

"will put icons in Vim's gutter on lines that have a diagnostic set.
""Turning this off will also turn off the YcmErrorLine and YcmWarningLine
"highlighting
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1

let g:ycm_complete_in_strings = 1 "default 1
let g:ycm_collect_identifiers_from_tags_files = 0 "default 0
let g:ycm_path_to_python_interpreter = '' "default ''

let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
let g:ycm_server_log_level = 'info' "default info

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'  "where to search for .ycm_extra_conf.py if not found
let g:ycm_confirm_extra_conf = 1

let g:ycm_goto_buffer_command = 'same-buffer' "[ 'same-buffer','horizontal-split', 'vertical-split', 'new-tab' ]
let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_key_invoke_completion = '<C-Space>'

set completeopt=longest,menuone,preview

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

nmap <leader>fw <Plug>(YCMFindSymbolInWorkspace)
nmap <leader>fd <Plug>(YCMFindSymbolInDocument)

"Macro
"
"Auto indent
let @l="ggVG="
"Auto std::cout statement generator
let @s="istd::cout <<  << std::endl;\<ESC>hhhhhhhhhhhhhi\<ESC>li"


