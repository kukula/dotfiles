" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Bundles list
NeoBundle 'tomasr/molokai'
NeoBundle 'bling/vim-airline'
NeoBundle 'bling/vim-bufferline' "Buffer names in airline
NeoBundle 'tpope/vim-fugitive' "Git wrapper
NeoBundle 'MarcWeber/vim-addon-mw-utils' "Snippets
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'garbas/vim-snipmate'
NeoBundle 'honza/vim-snippets'

call neobundle#end()

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" Bundles settings

" Airline
set noshowmode
set laststatus=2
let g:airline_theme='luna'
let g:airline_powerline_fonts=1
