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

Plug 'preservim/nerdtree' " NerdTree
Plug 'tpope/vim-commentary' " For Commenting gcc & gc
Plug 'itchyny/lightline.vim' " Status bar
Plug 'itchyny/vim-gitbranch' " Git branch status for the status bar
Plug 'ap/vim-css-color' " CSS Color Preview
Plug 'rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'tomasiser/vim-code-dark' " VSCode theme
Plug 'Yggdroot/indentLine' " linings when in indent for better view
Plug 'ryanoasis/vim-devicons' " Developer Icons
Plug 'terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'neoclide/coc.nvim'  " Code Completion
Plug 'github/copilot.vim' " Github copilot integration
Plug 'glepnir/dashboard-nvim' " Dashboard, when opening neovim without any file args.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' " These plugins are requires for 'dashboard-nvim' to work.

call plug#end()

" NerdTree keybindings
nnoremap <C-t> :NERDTreeToggle<CR>
noremap <C-LEFT> :tabprevious<CR>
noremap <C-RIGHT> :tabnext<CR>

" Open the terminal.
nnoremap <C-j> :terminal<CR>

" Setting up my status bar.
let g:lightline = {'active': {'left': [['mode', 'paste'], ['gitbranch', 'readonly', 'filename', 'modified']]}, 'component_function': {'gitbranch': 'gitbranch#name'}, 'colorscheme': 'one'}

:colorscheme oceanic_material

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="v"

let g:dashboard_default_executive = 'fzf' " I am using fzf as a fuzzy finder for the dashboard.

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

