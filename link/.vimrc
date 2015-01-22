syntax on         "syntax highlighting
filetype indent plugin on

set nocompatible  "enable vim specific features

"Local dir setup changes because of cowboy dotfiles
set backupdir=~/.dotfiles/caches/vim
set directory=~/.dotfiles/caches/vim
set undodir=~/.dotfiles/caches/vim
let g:netrw_home = expand('~/.dotfiles/caches/vim')

"Theme and syntax higlighting
set background=dark
set t_Co=256

"Visual
set colorcolumn=79 "visual red ruler at 80 characters
set cursorline      "underline the line with the cursor
set laststatus=2    "always show the status line
set linespace=0     "don't insert any extra pixel lines betweens rows
set list            "show tabs
set listchars=tab:>-,trail:- "show tabs and trailing spaces
set matchtime=5     "tenths of a second to blink matching brackets
set number          "display line numbers
set numberwidth=5   "We are good up to 99999 lines
set scrolloff=10    "Keep 10 lines (top/bottom) for scope
set sidescrolloff=10 "Keep 5 lines at the size
set splitbelow      "Vertical split creates new pane below.
set splitright      "Horizontal split creates new pane to the right.

"Indentation.
set autoindent    "copies indentation from previous line
set cindent       "replaces smartindent
set backspace=indent,eol,start "backspace over line breaks, auto, insert
set expandtab     "indentation without tabs
set shiftwidth=2  "columns indented by reindent (<< and >>)
set softtabstop=2 "number of spaces when tabbing (add'l info online)
set tabstop=2     "global tab width

"Folding
set foldmethod=indent
set foldlevel=99
set novisualbell  "don't blink

"Status bar
set lazyredraw   "do not redraw while running macros
set report=0      "tell us when anything is changed via :...
set ruler         "Always show current positions along the bottom
set showcmd       "show the command being typed
set showmatch     "show matching brackets
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]

"Search / Replace
set gdefault   "by default, add g flag to search/replace. Add g to toggle
set hlsearch   "highlight searches
set incsearch  "move while searching
set ignorecase "ignore case of searches
set smartcase  "ignore 'ignorecase' if search pattern contains uppercase chars

"Ignore things
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/log/*,*/tmp/*

"""""""""" Global shortcuts
"rebind leader to \ (backslash)
nnoremap <leader><leader> <c-^>
"toggle line numbers
nnoremap <leader>l :setlocal number!<CR>
"toggle paste mode
nnoremap <leader>o :set paste!<CR>
"toggle spelling
nnoremap <leader>s :set spell!<CR>
"disable highlighted search
nnoremap <leader>q :nohlsearch<CR>

"move cursor down by display lines when wrapping
nmap j gj
"move cursor up by display lines when wrapping
nmap k gk

"folding with spacebar
nnoremap <space> za
vnoremap <space> zf

"Explore with Netrw
map <leader>k :Explore<CR>

"Yank text to the OS X cliboard
noremap <leader>y "*y
noremap <leader>yy "*Y

"Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

"""""""""" Plugin Settings
"Netrw
let g:netrw_liststyle=3 "Display 3 levels for netrw tree

"CtrlP
let g:ctrlp_match_window_bottom = 0 " Show at top of window
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra' " revision control, current directory
let g:ctrlp_custom_ignore = '\v[\/](node_modules|env)|(\.(git|hg|svn))$'
let g:ctrlp_show_hidden = 1

"Dash
nmap <silent> <leader>d <Plug>DashSearch
let g:dash_map = {
    \ 'tex' : 'latex'
    \ }

"Indent Guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

"Syntastic
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_scss_checkers = ['scss_lint']

"Vimux
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>
" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>
" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>
" Interrupt any command running in the runner pane
map <Leader>vx :VimuxInterruptRunner<CR>
" Run the current file with ruby
map <Leader>rb :call VimuxRunCommand("clear; ruby " . bufname("%"))<CR>

"Individual format settings
au BufNewFile,BufRead *.md  setf markdown
au BufNewFile,BufRead *.h   setf c

"Enable vim plugins
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'benmills/vimux'
Plug 'davidhalter/jedi-vim'
Plug 'ervandew/supertab'
Plug 'kchmck/vim-coffee-script'
Plug 'kien/ctrlp.vim'
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'pangloss/vim-javascript'
Plug 'rizzatti/dash.vim'
Plug 'sudar/vim-arduino-syntax'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
call plug#end()
