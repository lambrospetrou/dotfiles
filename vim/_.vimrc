" ----------------------------------------------------------------------------
"   Plug
"
"   To install the plugins open VIM '> vim ~.vimrc'
"   and then execute this command ':PlugInstall'
"
" ----------------------------------------------------------------------------

" Install vim-plug if we don't already have it
if empty(glob("~/.vim/autoload/plug.vim"))
    " Ensure all needed directories exist  (Thanks @kapadiamush)
    execute '!mkdir -p ~/.vim/plugged'
    execute '!mkdir -p ~/.vim/autoload'
    " Download the actual plugin manager
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" Colorschemes
Plug 'captbaritone/molokai'
Plug 'altercation/vim-colors-solarized'
Plug 'ajh17/spacegray.vim'
Plug 'croaky/vim-colors-github'

" Syntax
"Plug 'tpope/vim-git', { 'for': 'git' }
"Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
"Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
"Plug 'mxw/vim-jsx'

" Completion
"Plug 'mattn/emmet-vim', { 'for': 'html' }

" Make tab handle all completions
Plug 'ervandew/supertab'

" Syntastic: Code linting errors
Plug 'scrooloose/syntastic'

" Pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'

" Fuzzy file opener
"Plug 'ctrlpvim/ctrlp.vim'

" Navigate files in a sidebar
"Plug 'scrooloose/nerdtree'

" Split navigation that works with tmux
"Plug 'christoomey/vim-tmux-navigator'

" Show git status in the gutter
"Plug 'airblade/vim-gitgutter'

" Take notes and keep todo lists in vim
"Plug 'vimwiki/vimwiki'

" 'Vastly improved Javascript indentation and syntax support in Vim'
Plug 'pangloss/vim-javascript'

Plug 'elixir-lang/vim-elixir'

filetype plugin indent on                   " required!
call plug#end()

"""""""""""""""""" tips from https://isotope11.com/blog/rebuilding-my-vim-setup-from-scratch 

""" UI Tweaks ==========================
set number " line numbering
set t_Co=256 " Force 256 colors

" in case t_Co alone doesn't work, add this as well:
" i.e. Force 256 colors harder
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

set t_ut= " improve screen clearing by using the background color
set background=dark

if !exists("g:syntax_on")
    syntax enable
endif

" Turn off menu in gui
set guioptions="agimrLt"
set mouse=""        " Turn off mouse click in gui
"set mouse=a        " Enables mouse usage

"""""""""""""""""" lambros conf below """""""""""""""""""

"colorscheme molokai
"let g:solarized_termcolors=256 " activate this if the TERMINAL emulator does not have the Solarized palette
colorscheme solarized
set enc=utf-8
set term=screen-256color
let $TERM='screen-256color'

set ai              "automatic indentation
set showmode        "show the mode I am currently in

set tabstop=4       "insert space characters whenever the tab key is pressed
set shiftwidth=4    "To change the number of space characters inserted for indentation
set softtabstop=4   " number of spaces in tab when editing
set expandtab       "all the new tab characters entered will be changed to spaces - :retab to change all

set ruler           "shows line number in the status line
set number          "show line numbers
set numberwidth=5   "width of the line numbers column
set cursorline      "highlights the active line
set showmatch       "show matching parentheses

set wildmenu        "provides matches selection in command menu
set incsearch       "search as characters are entered
set hlsearch        "highlight search mathches

" turn off search highlight after a search - press <backslash \><space>
nnoremap <leader><space> :nohlsearch<CR>

" auto complete when typing filenames
set wildmode=longest,list,full
set wildmenu

let &path.="src/include,/usr/include/AL," "search for files here too

" add markdown syntax on .md files (vim recognizes .markdown only)
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" enable the persistent undo history file
set undofile                " Save undo's after file closes
set undodir=~/.vim/undo     " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" show the last command at the status bar
set laststatus=2
set statusline=%n\ %F\ %m%r\%=\[%{''.(&fenc!=''?&fenc:&enc).''}\]%y\ %c-%l/%L
