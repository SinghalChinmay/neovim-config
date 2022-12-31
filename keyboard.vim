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

" Selecting the auto-complete options with the Enter/Tab key
inoremap <expr> <Return> pumvisible() ? coc#_select_confirm() : "<Return>"
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

" Keybinding for going to normal mode + Auto save
inoremap jj <esc>:w<CR>
