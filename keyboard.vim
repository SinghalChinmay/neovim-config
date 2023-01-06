" Keybindings for normal mode

" NerdTree keybindings
noremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
noremap <C-LEFT> :tabprevious<CR>
noremap <C-RIGHT> :tabnext<CR>


" Open the diagnostics window
noremap <C-a> :CocDiagnostics<CR>

" Open copilot completions
noremap <leader>co :Copilot<CR>

" VSCode related
noremap <A-Up> ddkP
noremap <A-Down> ddjP
noremap <C-d> yykp

" Keybindings in insert mode

" Autoclose for brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap < <><left>
inoremap ` ``<left>

" Selecting the auto-complete options with the Enter/Tab key
inoremap <expr> <Return> pumvisible() ? coc#_select_confirm() : "<Return>"
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

" Keybinding for going to normal mode + Auto save
inoremap jj <esc>:w<CR>

" Terminal keybindings

" Terminal Function
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

tnoremap <Esc> <C-\><C-N>
nnoremap <leader>j :call TermToggle(12)<CR>

