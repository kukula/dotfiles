" more useful leader
let mapleader=","

noremap <leader>w :w<CR>
noremap <leader>q :q<CR>

" Vim Rspec mappings
nmap <leader>st :call RunCurrentSpecFile()<CR>
nmap <leader>ss :call RunNearestSpec()<CR>
nmap <leader>sl :call RunLastSpec()<CR>
nmap <leader>sa :call RunAllSpecs()<CR>

nmap <Leader>gs :Gstatus<CR>
nmap <leader><CR> o<Esc>
nmap <leader><up> ddkP
nmap <leader><down> ddp
nmap <Esc><Esc> :noh<CR>

command WQ wq "Error prone
command Wq wq
command W w
command Q q

" Buffers
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

" Substitutions
inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("\<C-x><c-i>"))
inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("\<C-x><c-o>"))
