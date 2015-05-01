"------ my config --------
scriptencoding utf-8
set encoding=utf-8

set nocompatible               " be iMproved
set tabstop=4
set shiftwidth=4
set expandtab
set number

set ambiwidth=double
set whichwrap=b,s,[,],<,>
set list
set listchars=tab:>.,trail:^,eol:¬,extends:»,precedes:«,nbsp:%
" search option
set ignorecase
set smartcase
set hlsearch

"enable binary mode
augroup BinaryXXD
    autocmd!
    autocmd BufReadPre  *.bin let &binary =1
    autocmd BufReadPost * if &binary | silent %!xxd -g 1
    autocmd BufReadPost * set ft=xxd | endif
    autocmd BufWritePre * if &binary | %!xxd -r | endif
    autocmd BufWritePost * if &binary | silent %!xxd -g 1
    autocmd BufWritePost * set nomod | endif
augroup END

"enable gnu global 
map <C-g> :Gtags 
map <C-h> :Gtags -f %<CR>
map <C-j> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>
" <C-o> : back

"enable clipboard share 
set clipboard+=autoselect      " visual selection -> clipboard
set clipboard+=unnamed         " yank -> clipboard

"change NERDCommenter key bind
let NERDSpaceDelims = 1
nmap // <Plug>NERDCommenterToggle
vmap // <Plug>NERDCommenterToggle

filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'leafgarland/typescript-vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'vim-scripts/SearchComplete'
"
" My Bundles here:
"
" original repos on github
"
" :BundleInstall        " install vundle

filetype plugin indent on      " required!



