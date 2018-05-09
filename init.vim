source ~/.vimrc

let test#strategy = "neoterm"
let g:neoterm_default_mod = "vertical"
let g:neoterm_raise_when_tests_fail = 1

noremap <Leader>sq :TestFile<CR>
noremap <Leader>st :TestFile<CR>
noremap <Leader>ss :TestNearest<CR>
noremap <Leader>sl :TestLast<CR>
noremap <Leader>sa :TestSuite<CR>
" Neovim terminal insert mode escape :)
tmap <eSC> <C-\><C-N><ESC><CR>
