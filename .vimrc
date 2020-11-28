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
Plugin 'altercation/vim-colors-solarized'
Plugin 'Townk/vim-autoclose'
Plugin 'thinca/vim-fontzoom'
Plugin 'tpope/vim-surround'
Plugin 'junegunn/vim-easy-align'
Plugin 'tpope/vim-sleuth'               "autodetect indentation
Plugin 'ludovicchabant/vim-gutentags'   "search by tags (using ctags)
Plugin 'ctrlpvim/ctrlp.vim'             "search by filename (using silversearcher-ag)
Plugin 'mhinz/vim-grepper'              "search in the files
Plugin 'tpope/vim-fugitive'             "a git wrapper
Plugin 'dpelle/vim-Grammalecte'         "Grammalecte plugin
Plugin 'editorconfig/editorconfig-vim'
Plugin 'stephpy/vim-php-cs-fixer'

" syntax plugins
Plugin 'groenewege/vim-less'
Plugin 'cakebaker/scss-syntax.vim'
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

" Mark in red 'EOL spaces', 'unbreakable spaces' and 121-st character
highlight NoSpacesEOL ctermbg=red ctermfg=white guibg=#592929
autocmd BufWinEnter * let w:m2=matchadd('NoSpacesEOL', ' \+$', -1)

highlight NoSpacesUnbreakable ctermbg=red ctermfg=white guibg=#592929
autocmd BufWinEnter * let w:m2=matchadd('NoSpacesUnbreakable', ' ', -1)

highlight The121Char ctermbg=red ctermfg=white guibg=#592929
autocmd BufWinEnter * let w:m2=matchadd('The121Char', '\%121v', -1)

" GUI options
if has('gui_running')
    set guifont=Monospace\ 16
endif

" Removes whitespace at the end of every line
map ,tb :%s/\s\+$//<CR>

" map CTRL+k S N (non-breaking space) to CTRL+space
imap <C-space> <C-k>SN

" map CTRL+k ' 9 (curly apostrophe) to CTRL+a
imap <C-a> <C-k>'9


"---- PLUGINS CONFIG  ------------------------------------------------------------"

"Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Gutentags plugin
let g:gutentags_ctags_exclude_wildignore = 0
let g:gutentags_cache_dir = "~/.cache/gutentags"

" CtrlP plugin
let g:ctrlp_user_command = 'ag %s -l -U --nocolor -g ""'
" -U tells ag to ignore .gitignore but to still take .ignore into account
" to have different ignore rules for git and for CtrlP
let g:ctrlp_clear_cache_on_exit = 0

" Grepper plugin
map <C-g> :Grepper<cr>
map <Leader><C-g> :Grepper -side<cr>

let g:grepper               = {}
let g:grepper.highlight     = 1
let g:grepper.next_tool     = '<leader>g'
let g:grepper.simple_prompt = 1
let g:grepper.dir = 'repo,cwd'
let g:grepper.side_cmd = 'botright vnew'

runtime plugin/grepper.vim
let g:grepper.git.grepprg .= ' --untracked'

let g:grepper.tools = ['git', 'git_grep_everything', 'ag']
let g:grepper.git_grep_everything = {
\   'grepprg':    'git grep -nI --untracked --no-exclude-standard',
\   'grepformat': '%f:%l:%m',
\   'escape':     '\^$.*[]',
\ }

" Grammalecte plugin
let g:grammalecte_cli_py='~/.local/share/grammalecte/grammalecte-cli.py'

" Editorconfig plugin
let g:EditorConfig_exclude_patterns = ['fugitive://.*']  "avoid conflicts with fugitive plugin

" PHP-CS-Fixer plugin
let g:php_cs_fixer_rules = "@PSR2"
let g:php_cs_fixer_config_file = '.php_cs'
let g:php_cs_fixer_php_path = "php"               " Path to PHP
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 0                    " Return the output of command if 1, else an inline information.
