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
" Powerline
Bundle 'Lokaltog/powerline'
" The plugin provides mappings to easily delete, change and add such
" surroundings in pairs
Bundle 'tpope/vim-surround'
" Runtime files for Haml, Sass and Scss
Bundle 'tpope/vim-haml'
" Toggle comment/uncomment lines
Bundle 'vim-scripts/tComment'
" Pyflakes
Bundle 'kevinw/pyflakes-vim'
" jedi-vim autocomplete
Bundle 'davidhalter/jedi-vim'
" Supertab autocomplete
Bundle 'ervandew/supertab'
" Scala Plugins
" VIM Scala
Bundle 'derekwyatt/vim-scala'
" SBT Vim
Bundle 'ktvoelker/sbt-vim'
"Markdown for vim"
Bundle 'plasticboy/vim-markdown'
" Handle the expansion to full HTML code
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" ConqueShell
Bundle 'rosenfeld/conque-term'
" PEP8
Bundle 'vim-scripts/pep8.git'
" Others repos

"""""""""""""""""
" - Powerline - "
"""""""""""""""""
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set noshowmode

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

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

" No sound on errors
set noerrorbells
set novisualbell
set vb t_vb=
au GUIEnter * set vb t_vb=
set tm=500

" highlight unwanted(trailing) whitespace
" + have this highlighting not appear whilst you are typing in insert mode
" + have the highlighting of whitespace apply when you open new buffers
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


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
set sw=4
set modeline
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
let g:jedi#show_function_definition = "0"


"""""""""""""""
" - Hotkeys - "
"""""""""""""""
" Fast saving
nmap <leader>w :w<cr>
" Fast quit
nmap <leader>q :q<cr>
" Clear search
nmap <silent> <leader>n :silent :nohlsearch<cr>
" <leader>tw to remove trailing whitespace
nmap <leader>tw :%s/\s\+$//<CR>:let @/=''<CR>
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
" Use markdown syntax for .md files
au BufNewFile,BufRead *.md set filetype=markdown
" Use javascript syntax for .db files (for MongoDB files)
au BufNewFile,BufRead *.db set filetype=javascript

" Show trailing whitespaces on blue
" hi TrailWhitespace ctermbg=blue guibg=blue
" match TrailWhitespace /\s\+$\| \+\ze\t/

" Spell errors (for spellcheck and others such as pyflakes) with underline
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red gui=undercurl guisp=Red
" Python specific settings
au Filetype python setlocal foldmethod=indent
au Filetype python setlocal nofoldenable
au Filetype python highligh OverLength ctermbg=darkgray guibg=darkgray
au Filetype python match OverLength /\%79v.\+/

" Scala specific settings
au Filetype scala set shiftwidth=2
au Filetype scala set tabstop=2
au Filetype scala set sw=2

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF


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
