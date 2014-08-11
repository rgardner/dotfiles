syntax on         "syntax highlighting
filetype indent plugin on

set cindent       "replaces smartindent
set autoindent    "copies indentation from previous line

"indentation.
set tabstop=2     "global tab width
set expandtab     "indentation without tabs
set shiftwidth=2
set softtabstop=2

set background=dark
set backspace=indent,eol,start
set nocompatible

set colorcolumn=80 "visual red ruler at 80 characters
set cursorline   "underline the line with the cursor
set foldmethod=indent
set foldlevel=99
set incsearch "move while searching
set laststatus=2 "always show the status line
set lazyredraw   "do not redraw while running macros
set linespace=0  "don't insert any extra pixel lines betweens rows
set list         "we do what to show tabs, to ensure we get them out of my
                 "files
set listchars=tab:>-,trail:- "show tabs and trailing spaces
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
set spell spelllang=en_us
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]

"Coloring
set t_Co=256
"colo desert256

"Plugin Settings
let g:netrw_liststyle=3 "Display 3 levels for netrw tree

"CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra' " revision control, current directory
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_show_hidden = 1

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
