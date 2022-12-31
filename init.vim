let mapleader = " "

runtime ./plug.vim
runtime ./keyboard.vim

:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set background=dark
:set nowrap
:set encoding=UTF-8
:set clipboard=unnamed
:setlocal spell spelllang=en

" Setting up the status bar.
:colorscheme codedark

let g:lightline = {'active': {'left': [['mode', 'paste'], ['gitbranch', 'readonly', 'filename', 'modified']]}, 'component_function': {'gitbranch': 'gitbranch#name'}, 'colorscheme': 'one'}

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="v"

let g:dashboard_default_executive = 'fzf' " I am using fzf as a fuzzy finder for the dashboard.

let g:indentLine_fileTypeExclude = ['dashboard'] " Doesn't put indent lines on the dashboard.


autocmd VimEnter * NERDTree | wincmd p

