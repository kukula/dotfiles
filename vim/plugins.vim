" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Bundles list
NeoBundle 'tomasr/molokai'
NeoBundle 'bling/vim-airline'
NeoBundle 'tpope/vim-fugitive' "Git wrapper
NeoBundle 'MarcWeber/vim-addon-mw-utils' "Snippets
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'garbas/vim-snipmate'
NeoBundle 'honza/vim-snippets'
NeoBundle 'kien/ctrlp.vim' " Ctrl-P file finder
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'tpope/vim-rake'
NeoBundle 'tpope/vim-sleuth'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'wting/rust.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'slim-template/vim-slim.git'

call neobundle#end()

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" Bundles settings
NeoBundle 'kchmck/vim-coffee-script'

call neobundle#end()

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" Bundles settings

"Airline"
set noshowmode
set laststatus=2
set timeoutlen=500
let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '

" CtrlP
let g:ctrlp_map = '<c-p>'
nmap cp <c-p>
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 'Et'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_extensions = ['tag', 'buffertag']
