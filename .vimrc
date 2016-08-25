"---- CONFIG VUNDLE PACKAGE MANAGER -------------------------------------------"

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'L9'
Plugin 'AutoComplPop'
Plugin 'comments.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'Townk/vim-autoclose'
Plugin 'altercation/vim-colors-solarized'
Plugin 'thinca/vim-fontzoom'
Plugin 'groenewege/vim-less'
Plugin 'tpope/vim-surround'
Plugin 'lumiliet/vim-twig'

call vundle#end()            " required

" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal


"---- MAIN CONFIG  ------------------------------------------------------------"

" Leader
let mapleader = ","

" Format of files
set fileformat=unix
set encoding=utf-8

" Tabulation
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Indentation
set autoindent
filetype plugin indent on

" See special characters
set list listchars=tab:>-,trail:.,precedes:<,extends:>

" Appearance
syntax on
colorscheme solarized
set background=dark    " Adapt colors to dark background
set laststatus=2       " Enable the full status line (useful for the lightline package)
set mouse=a            " Enable mouse usage (all modes)
set number             " Show line numbers
set showmatch          " Show matching brackets.
set nowrap             " Do not cut lines when too long
set showcmd            " Show (partial) command in status line.
set hidden             " Hide buffers when they are abandoned

" Searching
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
set incsearch       " Incremental search
set hlsearch        " Highlight matched patterns

" Default language for spell
setlocal spelllang=fr

" Stop the highlighting for the 'hlsearch' option.
map <leader><space> :nohlsearch<cr>

" Other rules
set autowrite       " Automatically save before commands like :next and :make
set backspace=indent,eol,start
set ruler

" Mark in red 'EOL spaces', 'unbreakable spaces' and 81th character
highlight NoSpacesEOL ctermbg=red ctermfg=white guibg=#592929
autocmd BufWinEnter * let w:m2=matchadd('NoSpacesEOL', ' \+$', -1)

highlight NoSpacesUnbreakable ctermbg=red ctermfg=white guibg=#592929
autocmd BufWinEnter * let w:m2=matchadd('NoSpacesUnbreakable', ' ', -1)

highlight The81Char ctermbg=red ctermfg=white guibg=#592929
autocmd BufWinEnter * let w:m2=matchadd('The81Char', '\%81v', -1)

" GUI options
if has('gui_running')
    set guifont=Monospace\ 10
endif

" Removes whitespace at the end of every line
map ,tb :%s/\s\+$//<CR>

" map CTRL+k S N (non-breaking space) to CTRL+space
imap <C-space> <C-k>SN

" map CTRL+k ' 9 (curly apostrophe) to CTRL+a
imap <C-a> <C-k>'9
