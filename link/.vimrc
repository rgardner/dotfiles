syntax on         "syntax highlighting
filetype indent plugin on

set nocompatible  "enable vim specific features

"Local dir setup changes because of cowboy dotfiles
"set backupdir=~/.dotfiles/caches/vim
"set directory=~/.dotfiles/caches/vim
"set undodir=~/.dotfiles/caches/vim

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
set scrolloff=10  "Keep 10 lines (top/bottom) for scope
set sidescrolloff=10 "Keep 5 lines at the size

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

"""""""""" Global shortcuts
nnoremap <leader><leader> <c-^>


"""""""""" Plugin Settings
"Netrw
let g:netrw_liststyle=3 "Display 3 levels for netrw tree

"CtrlP
let g:ctrlp_match_window_bottom = 0 " Show at top of window
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra' " revision control, current directory
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_show_hidden = 1

"Dash
nmap <silent> <leader>d <Plug>DashSearch
let g:dash_map = {
    \ 'tex' : 'latex'
    \ }

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

"Enable vim plugins
execute pathogen#infect()