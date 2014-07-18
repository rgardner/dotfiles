"set tags=/home/Cybs/vimTags/Fulltags
syntax on         "syntax highlighting
set cindent       "replaces smartindent
set autoindent    "copies indentation from previous line
set tabstop=2     "global tab width

"indentation without tabs
set expandtab
set shiftwidth=2
set softtabstop=2

set background=dark
set backspace=indent,eol,start
set nocompatible

"set incsearch "move while searching

set laststatus=2 "always show the status line
set lazyredraw   "do not redraw while running macros
set linespace=0  "don't insert any extra pixel lines betweens rows
set list         "we do what to show tabs, to ensure we get them out of my
                 "files
set listchars=tab:>-,trail:- "show tabs and trailing 
set matchtime=5   "how many tenths of a second to blink matching brackets
                  "for
set novisualbell  "don't blink
set numberwidth=5 "We are good up to 99999 lines
set report=0      "tell us when anything is changed via :...
set ruler         "Always show current positions along the bottom
set number        "Display line numbers
set scrolloff=10  "Keep 10 lines (top/bottom) for scope
set showcmd       "show the command being typed
set showmatch     "show matching brackets
set sidescrolloff=10 "Keep 5 lines at the size
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]

" Automatic hard word wrapping
set textwidth=79
set formatoptions+=t

set colorcolumn=79
set t_Co=256
colo desert256

"individual format settings
au BufNewFile,BufRead *.md  setf markdown
au BufNewFile,BufRead *.txt set nu!
au BufNewFile,BufRead *.rtf set nu!

"vim git-gutter
execute pathogen#infect()
