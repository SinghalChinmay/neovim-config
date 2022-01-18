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
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/vim-airline/vim-airline-themes' " Status bar themes
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/Yggdroot/indentLine' " linings when in indent for better view
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/neoclide/coc.nvim'  " Code Completion
Plug 'https://github.com/morhetz/gruvbox' " Retro Color Schemes
" Plug 'https://github.com/nvim-telescope/telescope.nvim' " Find, Filter, Preview, Pick your files! Neovim 0.6 needed

call plug#end()

nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-j> :terminal<CR>

let g:airline_powerline_fonts = 1

let g:airline_theme='gruvbox'

:colorscheme gruvbox

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="v"

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

