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
Plug 'mhinz/vim-startify' " Dashboard, when opening neovim without any file args.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' " These plugins are required for 'dashboard-nvim' to work.
Plug 'wakatime/vim-wakatime' " Wakatime plugin for time tracking.
Plug 'jiangmiao/auto-pairs'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

call plug#end()

