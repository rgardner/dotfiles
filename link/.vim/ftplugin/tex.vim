set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4

" Automatic hard word wrapping
set formatoptions+=t
set textwidth=79

map <Leader>la :call VimuxRunCommand("clear; pdflatex " . bufname("%"))<CR>
