
" Load plugins
call pathogen#infect()

" No compatible with vi
set nocompatible

" Leader
let mapleader = ","

" Format of files
set fileformat=unix
set encoding=utf-8

" Tabulation
set noexpandtab
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
colorscheme darkblue
set background=dark    " Adapt colors to dark background

" Some graphic options
set mouse=a         " Enable mouse usage (all modes)
set number          " Show line numbers
set showmatch       " Show matching brackets.
set nowrap          " Do not cut lines when too long
set showcmd         " Show (partial) command in status line.
set hidden          " Hide buffers when they are abandoned

" Searching
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
set incsearch       " Incremental search
set hlsearch        " Highlight matched patterns

" Stop the highlighting for the 'hlsearch' option.
map <leader><space> :nohlsearch<cr>

" Other rules
set autowrite       " Automatically save before commands like :next and :make
set backspace=indent,eol,start
set ruler

" Mark in red 'EOL spaces' and 81th character
highlight NoSpacesEOL ctermbg=red ctermfg=white guibg=#592929
autocmd BufWinEnter * let w:m2=matchadd('NoSpacesEOL', ' \+$', -1)
highlight The81Char ctermbg=red ctermfg=white guibg=#592929
autocmd BufWinEnter * let w:m2=matchadd('The81Char', '\%81v', -1)

" GUI options
if has('gui_running')
	set guifont=Monospace\ 10
endif


"---- CONFIG FOR PHP ----------------------------------------------------------"

" Syntaxic coloration for SQL and HTML inside PHP code
let php_sql_query=1
let php_htmlInStrings=1


"---- CONFIG FOR JSLint plugin-------------------------------------------------"

" TODO: check if JSLint plugin is loaded to map
let g:JSLintHighlightErrorLine = 0
map <c-j> :let g:JSLintHighlightErrorLine = g:JSLintHighlightErrorLine ? 0 : 1<CR> :JSLintUpdate<CR>
