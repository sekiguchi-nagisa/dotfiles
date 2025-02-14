"------ my config --------
scriptencoding utf-8
set encoding=utf-8

set nocompatible               " be iMproved
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set number

set ambiwidth=double
set whichwrap=b,s,[,],<,>
set backspace=indent,eol,start
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

let g:netrw_dirhistmax = 0

filetype off                   " required!

if has('vim_starting')
    set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'scrooloose/nerdcommenter.git'
NeoBundle 'vim-scripts/SearchComplete.git'
NeoBundle 'kannokanno/previm.git'

call neobundle#end()

" :NeoBundleInstall        " install plugin
" :NeoBundleUpdate         " update plugin
" :NeoBundleClean          " delete plugin

filetype plugin indent on      " required!

" Previm settig
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END


let OSTYPE = system('uname')
if OSTYPE == "Darwin\n"
    let g:previm_open_cmd = 'open -a Safari'
elseif OSTYPE == "Linux\n"
    let g:previm_open_cmd = 'firefox'
endif

" :PrevimOpen       " open browser and preview markdown  

