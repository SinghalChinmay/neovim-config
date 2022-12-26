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

call plug#begin('~/.config/nvim/plugged')

Plug 'preservim/nerdtree' " NerdTree
Plug 'tpope/vim-commentary' " gcc for commenting the current line, and gc + <Up>/<Down> for commenting multiple lines
Plug 'itchyny/lightline.vim' " Status bar
Plug 'itchyny/vim-gitbranch' " Git branch status for the status bar
Plug 'mg979/vim-visual-multi' " Multiple cursors
Plug 'ap/vim-css-color' " CSS Color Preview
Plug 'rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'tomasiser/vim-code-dark' " VSCode theme
Plug 'Yggdroot/indentLine' " linings when in indent for better view
Plug 'ryanoasis/vim-devicons' " Developer Icons
Plug 'neoclide/coc.nvim'  " Code Completion
Plug 'github/copilot.vim' " Github copilot integration
Plug 'rafi/vim-venom' " Virtual environment management for python
Plug 'glepnir/dashboard-nvim' " Dashboard, when opening neovim without any file args.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' " These plugins are required for 'dashboard-nvim' to work.
Plug 'wakatime/vim-wakatime' " Wakatime plugin for time tracking.
Plug 'jiangmiao/auto-pairs'

call plug#end()

" Setting up the status bar.
:colorscheme codedark

let g:lightline = {'active': {'left': [['mode', 'paste'], ['gitbranch', 'readonly', 'filename', 'modified']]}, 'component_function': {'gitbranch': 'gitbranch#name'}, 'colorscheme': 'one'}

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="v"

let g:dashboard_default_executive = 'fzf' " I am using fzf as a fuzzy finder for the dashboard.

let g:indentLine_fileTypeExclude = ['dashboard'] " Doesn't put indent lines on the dashboard.

let mapleader = " "

autocmd VimEnter * NERDTree | wincmd p

" Keybindings for normal mode

" NerdTree keybindings
noremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
noremap <C-LEFT> :tabprevious<CR>
noremap <C-RIGHT> :tabnext<CR>

nnoremap <C-j> :terminal<CR>

" Open the diagnostics window
noremap <C-a> :CocDiagnostics<CR>

" Open copilot completions
noremap <C-k> :Copilot<CR>

" VSCode related
noremap <C-Up> ddkP
noremap <C-Down> ddjP
noremap <C-d> yykp

" Keybindings in insert mode

" Autoclose for brackets.
" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>
" inoremap < <><left>
" inoremap ` ``<left>

" Selecting the auto-complete options with the Enter/Tab key
inoremap <expr> <Return> pumvisible() ? coc#_select_confirm() : "<Return>"
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

" Keybinding for going to normal mode + Auto save
inoremap jj <esc>:w<CR>
