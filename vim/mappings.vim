" more useful leader
let mapleader=","
let g:mapleader = ","

noremap <leader>d :Dispatch<cr>
" Vim Rspec mappings
nmap <leader>t :call RunCurrentSpecFile()<CR>
nmap <leader>s :call RunNearestSpec()<CR>
nmap <leader>l :call RunLastSpec()<CR>
nmap <leader>a :call RunAllSpecs()<CR>

nmap <S-Enter> O<Esc> "add new line in noraml mode
nmap <CR> o<Esc>
nmap <c-d> Yp "duplicate line
nmap <Esc><Esc><Esc> :noh<CR>

command WQ wq "Error prone
command Wq wq
command W w
command Q q
