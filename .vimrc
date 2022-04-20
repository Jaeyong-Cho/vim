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
Plugin 'vim-scripts/grep.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'pangloss/Vim-simplefold'
Plugin 'iamcco/markdown-preview.nvim'
"Plugin 'preservim/vim-markdown'
Plugin 'mzlogin/vim-markdown-toc'
Plugin 'jkramer/vim-checkbox'
Plugin 'vimwiki/vimwiki', { 'branch': 'dev' }
Plugin 'mattn/calendar-vim'
Plugin 'tools-life/taskwiki'
Plugin 'blindFS/vim-taskwarrior'
Plugin 'powerman/vim-plugin-AnsiEsc'
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

"Markdown Preview
let g:mkdp_auto_close = 1
let g:mkdp_filetypes = ['markdown']

"Markdown
"let g:vim_markdown_folding_disabled = 0
"let g:vim_markdown_toc_autofit = 1
"set conceallevel=2
"let g:vim_markdown_conceal_code_blocks = 1
"let g:vim_markdown_autowrite = 1

"Markdown Toc
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : '~/.vim/bundle/markdown2ctags/markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes --sro=»',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '»',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }

"VimWiki
let g:vimwiki_list = [{'path': '/mnt/d/GoogleDrive/Notes/','syntax': 'markdown', 'ext': '.md'}]
au BufNewFile /mnt/d/GoogleDrive/Notes/diary/*.md :silent 0r !~/.vim/bin/generate-vimwiki-diary-template '%'
au BufNewFile /mnt/d/GoogleDrive/Notes/Wiki/*.md :silent 0r !~/.vim/bin/generate-vimwiki-template '%'
au BufNewFile /mnt/d/GoogleDrive/Notes/Text/*.md :silent 0r !~/.vim/bin/generate-vimwiki-template '%'

function! VimwikiFindIncompleteTasks()
  lvimgrep /- \[ \]/ %:p
  lopen
endfunction

function! VimwikiFindAllIncompleteTasks()
  VimwikiSearch /- \[ \]/
  lopen
endfunction

"TaskWiki
let g:taskwiki_sort_orders={"T": "project+,due-"}

"TaskWarrior
let g:task_log_directory   = '/mnt/d/GoogleDrive/Notes/.task'

"key map
map <F2> :NERDTreeToggle<cr>
nmap <F3> :Tagbar<CR>
nmap <F4> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
nnoremap <F5> :execute "VWS /" . expand("<cword>") . "/" <Bar> :lopen<CR>
nnoremap <C-e> :bp<CR>
noremap <C-r> :bn<CR>
nnoremap <Leader>q :bd<CR>

map <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w) 
map <Leader>b <Plug>(easymotion-bd-b)  
nmap <Leader>b <Plug>(easymotion-overwin-b)
nmap <Leader>wa :call VimwikiFindAllIncompleteTasks()<CR>
nmap <Leader>wx :call VimwikiFindIncompleteTasks()<CR>
