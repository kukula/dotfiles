" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Bundles list
NeoBundle 'tomasr/molokai'
NeoBundle 'bling/vim-airline'

call neobundle#end()

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" Bundles settings

" Airline
set noshowmode
let g:airline_theme='luna'
let g:airline_powerline_fonts=1
