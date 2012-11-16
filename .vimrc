""""""""""""""
" - Vundle - "
""""""""""""""
filetype off " Required

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" My Bundles here:
" original repos on github
" Fugitive - Git wrapper
Bundle 'tpope/vim-fugitive'
" Ragtag - HTML/XML mappings
Bundle 'tpope/vim-ragtag'
" The plugin provides mappings to easily delete, change and add such
" surroundings in pairs
Bundle 'tpope/vim-surround'
" Runtime files for Haml, Sass and Scss
Bundle 'tpope/vim-haml'
" Markdown preview
Bundle 'waylan/vim-markdown-extra-preview'
" Toggle comment/uncomment lines
Bundle 'vim-scripts/tComment'
" jedi-vim autocomplete
Bundle 'davidhalter/jedi-vim'
" Handle the expansion to full HTML code 
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" vim-scripts repos
" L9 Vim-script library
Bundle 'L9'
" FuzzyFinder
Bundle 'FuzzyFinder'
" PEP8
Bundle 'vim-scripts/pep8.git'
" Others repos


"""""""""""""""
" - General - "
"""""""""""""""
filetype on
set nocompatible
set hidden
" Set system clipboard
set clipboard=unnamed

" Enable filetype plugin
filetype plugin on
filetype indent on

" Enable syntax colors
syntax on
syntax enable

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc

" Color scheme
colorscheme slate


"""""""""""""""""""""""""
" - VIM user interface -"
"""""""""""""""""""""""""
" Set 7 lines to the cursors - when moving vertical..
set so=7

set showmode " Show what mode you're in

set title " Set terminal title

set number " Set linenumber

set wildmenu "Turn on WiLd menu

set ruler "Always show current position

set cmdheight=2 "The commandbar height

set hid "Change buffer - without saving

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase "Ignore case when searching
set smartcase

set hlsearch "Highlight search things

set incsearch "Make search act like search in modern browsers
set nolazyredraw "Don't redraw while executing macros

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

" No sound on errors
set noerrorbells
set novisualbell
set vb t_vb=
au GUIEnter * set vb t_vb=
set tm=500


"""""""""""""""""""""""
" - Color and fonts - "
"""""""""""""""""""""""
set gfn=Monospace\ 10
set shell=/bin/bash

colorscheme desert

set ffs=unix,dos,mac


""""""""""""""""""""""""""""""
" - Files, backup and undo - "
""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

" Persistent undo
" set undodir=~/.vim_runtime/undodir
" set undofile


""""""""""""""""""""""""""""
" - Text, tab and indent - "
""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

set lbr
set tw=500

set ai "Auto indent
set si "Smart indet
set wrap "Wrap lines


""""""""""""""""""""
" - Autocomplete - "
""""""""""""""""""""
let g:jedi#auto_initialization = 1
let g:jedi#popup_on_dot = 0


"""""""""""""""
" - Hotkeys - "
"""""""""""""""
" Fast saving
nmap <leader>w :w<cr>
" Fast quit
nmap <leader>q :q<cr>
" Quit all
nmap <leader>qa :wqa<cr>
" Clear search
nmap <silent> <leader>n :silent :nohlsearch<cr>
" Tab configuration
map <leader>tn :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
" Tab navigation
map <leader><right> gt<cr>
map <leader><left> gT<cr>
" Ragtag Configuration
inoremap <M-o> <Esc>o
inoremap <C-j> <Down>
let g:ragtag_global_maps = 1
" Allow the . to execute once for echa line of a visual selection
vnoremap . :normal .<CR>
" ACK
nmap <leader>a <Esc>:Ack!
" PEP8
let g:pep8_map='<leader>8'


""""""""""""""""""
" - Statusline - "
""""""""""""""""""
" Always hide the statusline
set laststatus=2

" Format the statusline
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P


"""""""""""""""""""""""""""""""""""""
" - Parenthesis/bracket expanding - "
"""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
inoremap $t <><esc>i


""""""""""""""""""""
" - Code Folding - "
""""""""""""""""""""
set foldmethod=indent
set foldlevel=99


"""""""""""""""""""""""""""""""
" - Omni complete functions - "
"""""""""""""""""""""""""""""""
" OmniComplete to F2
imap <f2> <c-x><c-o>
" (Ommicomplete) for specific files
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
set completeopt=menuone,longest,preview


""""""""""""""
" - Syntax - "
""""""""""""""
" Use javascript syntax for .db files (for MongoDB files)
au BufNewFile,BufRead *.db set filetype=javascript


""""""""""""""""""""
" - GVim options - "
""""""""""""""""""""
if has("gui_running")
    ""Maximize gvim window.
    set lines=999 columns=999
    " Removing bars and scroll bars
    " set guioptions-=m ""remove menu bar
    set guioptions-=T ""remove tool bar
    set guioptions+=LlRrb ""add scroll lines
    set guioptions-=LlRrb ""remove scroll lines
endif
