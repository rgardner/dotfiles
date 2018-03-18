" Enable vim specific features
" **must be first uncommented line**
set nocompatible

syntax on         "syntax highlighting
filetype indent plugin on

"Local dir setup changes because of cowboy dotfiles
set backupdir=~/.dotfiles/caches/vim
set directory=~/.dotfiles/caches/vim
set undodir=~/.dotfiles/caches/vim

"Theme and syntax highlighting
set background=dark
set t_Co=256

"Visual
set colorcolumn=79  "visual red ruler at X characters
set cursorline      "underline the line with the cursor
set laststatus=2    "always show the status line
set linespace=0     "don't insert any extra pixel lines between rows
set list            "show tabs
set listchars=tab:>-,trail:- "show tabs and trailing spaces
set matchtime=5     "tenths of a second to blink matching brackets
set number          "display line numbers
set numberwidth=5   "We are good up to 99999 lines
set scrolloff=10    "Keep 10 lines (top/bottom) for scope
set sidescrolloff=10 "Keep 5 lines at the size
set splitbelow      "Vertical split creates new pane below.
set splitright      "Horizontal split creates new pane to the right.

"Indentation
set autoindent    "copies indentation from previous line
set cindent       "replaces smartindent
set backspace=indent,eol,start "backspace over line breaks, auto, insert
set expandtab     "indentation without tabs
set nojoinspaces  "use one space (not two) after a period due to J, gq
set shiftwidth=4  "columns indented by reindent (<< and >>)
set softtabstop=4 "number of spaces when tabbing (add'l info online)
set tabstop=4     "global tab width

"Folding
set foldenable
set foldmethod=indent
set foldlevel=99
set foldlevelstart=10 "open most folds by default
set novisualbell  "don't blink

"Status bar
set lazyredraw   "do not redraw while running macros
set report=0     "tell us when anything is changed via :...
set ruler        "always show current positions along the bottom
set showcmd      "show the command being typed
set showmatch    "show matching brackets
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
set wildmenu  "visual autocomplete for command menu

"Search / Replace
set gdefault   "by default, add g flag to search/replace. Add g to toggle
set hlsearch   "highlight searches
set incsearch  "move while searching
set ignorecase "ignore case of searches
set smartcase  "ignore 'ignorecase' if search pattern contains uppercase chars

"Ignore things
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*,*/.venv/*
set wildignore+=*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/log/*,*/tmp/*

"Clipboard
set clipboard=unnamed

"Features
if has('mouse')
  set mouse=a
endif
if &t_Co > 2 || has('gui_running')
  "Highlight strings in comments.
  let g:c_comment_strings = 1
endif

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
let g:netrw_liststyle=3  "Display 3 levels for netrw tree
let g:netrw_home = expand('~/.dotfiles/caches/vim')

"Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" Use ripgrep for grep utility if available
if executable('rg')
  set grepprg=rg\ --no-heading\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif

"""""""""" Buffers
" Hide buffers if modified
set hidden
nmap <leader>T :enew<CR>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
" Close current buffer and move to previous one
nmap <leader>bq :bp <BAR> bd#<CR>
" List open buffers and their status
nmap <leader>bl :ls<CR>


"""""""""" Plugin Settings
"Airline
" Enable list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

"Ale (Asynchronous Lint Engine)
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_linters = {
\   'vimwiki': ['mdl', 'proselint'],
\}

"ClangFormat
let g:clang_format#code_style = 'mozilla'
nmap <Leader>C :ClangFormatAutoToggle<CR>

"Dash
nmap <silent> <leader>d <Plug>DashSearch
let g:dash_map = {
    \ 'tex' : 'latex',
\ }

"delimitMate
let g:delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

"Indent Guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

"Fzf
"map GFiles to ctrl-p for my own sanity
nmap <silent> <C-p> :GFiles<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>fl :Lines<CR>

"Goyo.vim
let g:goyo_width=81
function! s:goyo_enter()
  set nocursorline
  set nolist
  set nospell
endfunction

function! s:goyo_leave()
  set cursorline
  set list
endfunction

augroup myGoyo
  autocmd! User GoyoEnter nested call <SID>goyo_enter()
  autocmd! User GoyoLeave nested call <SID>goyo_leave()
augroup END

"Racer
"set hidden
let g:racer_cmd = '/usr/local/bin/racer'
let $RUST_SRC_PATH = '/usr/local/src/rust/src/'

"Rust.vim
let g:rustfmt_autosave = 0

"Tagbar
nmap <F8> :TagbarToggle<CR>

"Ultisnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<c-b>'
let g:UltiSnipsJumpBackwardTrigger = '<c-z>'
let g:ultisnips_python_style = 'sphinx'

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

"Vimwiki
let g:vimwiki_folding='expr'
let g:vimwiki_list = [
      \ {
      \   'path': '~/Dropbox/vimwiki',
      \   'automatic_nested_syntaxes': 1,
      \   'ext': '.md',
      \   'path_html': '~/Dropbox/site_html'
      \ }
\]

"Yapf
map <C-Y> :call yapf#YAPF()<cr>
imap <C-Y> <c-o>:call yapf#YAPF()<cr>

"Individual format settings
au BufNewFile,BufRead *.md  setf markdown
au BufNewFile,BufRead *.h   setf c
au BufNewFile,BufRead *.lalrpop setf rust

"Automatically install vim-plug
"https://github.com/junegunn/vim-plug/wiki/faq
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup myVimPlug
    autocmd VimEnter * PlugInstall
  augroup END
endif

"Platform specific vim plugins
if has('macunix')
  call plug#begin('~/.vim/plugged')
  Plug 'LaTeX-Box-Team/LaTeX-Box', {'for': 'tex'}
  Plug 'Raimondi/delimitMate'
  Plug 'SirVer/ultisnips'
  Plug 'airblade/vim-gitgutter'
  Plug 'benmills/vimux'
  Plug 'bling/vim-airline'
  Plug 'davidhalter/jedi-vim', {'for': 'python'}
  Plug 'editorconfig/editorconfig-vim'
  Plug 'edkolev/tmuxline.vim'
  Plug 'ervandew/supertab'
  Plug 'fatih/vim-go', {'for': 'go'}
  Plug 'godlygeek/tabular'
  Plug 'honza/vim-snippets'
  Plug 'jamessan/vim-gnupg'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'majutsushi/tagbar'
  Plug 'mattn/webapi-vim' | Plug 'rust-lang/rust.vim', {'for': 'rust'}
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'pangloss/vim-javascript', {'for': 'javascript'}
  Plug 'racer-rust/vim-racer', {'for': 'rust'}
  Plug 'rhysd/vim-clang-format', {'for': 'c'}
  Plug 'rizzatti/dash.vim'
  Plug 'scrooloose/nerdcommenter'
  Plug 'sudar/vim-arduino-syntax', {'for': 'arduino'}
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rails'
  Plug 'vimwiki/vimwiki'
  Plug 'w0rp/ale'
  call plug#end()
elseif has('unix')
  call plug#begin('~/.vim/plugged')
  Plug 'Raimondi/delimitMate'
  Plug 'airblade/vim-gitgutter'
  Plug 'benmills/vimux'
  Plug 'bling/vim-airline'
  Plug 'edkolev/tmuxline.vim'
  Plug 'ervandew/supertab'
  Plug 'godlygeek/tabular'
  Plug 'majutsushi/tagbar'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'scrooloose/nerdcommenter'
  Plug 'tpope/vim-fugitive'
call plug#end()
endif
