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

call plug#begin('~/.config/nvim/plugged')

Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/itchyny/lightline.vim' " Status bar
Plug 'https://github.com/itchyny/vim-gitbranch' " Git branch status for the status bar
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/tomasiser/vim-code-dark' " VSCode theme
Plug 'https://github.com/Yggdroot/indentLine' " linings when in indent for better view
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/neoclide/coc.nvim'  " Code Completion
Plug 'https://github.com/github/copilot.vim' " Github copilot integration
Plug 'https://github.com/glepnir/dashboard-nvim' " Dashboard, when opening neovim without any file args.
Plug 'https://github.com/junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'https://github.com/junegunn/fzf.vim' " These plugins are requires for 'dashboard-nvim' to work.

call plug#end()

nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-j> :terminal<CR>

let g:lightline = {'active': {'left': [['mode', 'paste'], ['gitbranch', 'readonly', 'filename', 'modified']]}, 'component_function': {'gitbranch': 'gitbranch#name'}, 'colorscheme': 'one'}

:colorscheme codedark

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="v"

let g:dashboard_default_executive = 'fzf' " I am using fzf as a fuzzy finder.

let g:indentLine_fileTypeExclude = ['dashboard'] " Doesn't put indent lines on the dashboard.

" Selecting the auto-complete options with the Enter key
inoremap <expr> <Return> pumvisible() ? coc#_select_confirm() : "<Return>"

" Brackets and quotes autoclose
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap < <><left>
inoremap ` ``<left>

