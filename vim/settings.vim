" UTF-8
set encoding=utf-8
set fileencoding=utf-8

" Backspace
set backspace=indent,eol,start

" you can change buffers without saving
set hidden

" do not autoresize windows
set noequalalways

" Resize splits when the window is resized
au VimResized * :wincmd =

" split below/right
set splitbelow
set splitright

" no backup files
set nobackup
set nowritebackup
set noswapfile

" show line numbers
set nu

" also show relative numbers, besides current line (Vim 7.4+)
set relativenumber

" highlight searches
set hlsearch

" find as you type
set incsearch

" smartcase -- normally ignores case, but when we type uppercase character
" in search box it will be CASE SENSITIVE
set ignorecase 
set smartcase

" display incomplete commands
set showcmd

" lazy redraw the screen
set lazyredraw

" we're a fast tty, so redraw screen if more than 3 lines to scroll (this
" can make vim a tiny bit faster)
set ttyscroll=3

" Theme 
set background=dark
let g:molokai_original=1
let g:rehash256=1
set t_Co=256
colorscheme molokai

" always show status line
set laststatus=2

" syntax highlight on
syntax on
filetype on
filetype plugin on
filetype indent on
filetype plugin indent on

" Indentation
set expandtab     " all tabs expands to spaces
set sw=2          " automagic indent width
set tabstop=2     " size of tab in spaces
set ts=2          " size of tab
set shiftround    " round indent to multiple of 'shiftwidth', applies to > and <
set smarttab
set softtabstop=2 " number of spaces that a <Tab> counts for
                  " while performing editing operations

" Set Mac clipboard
set clipboard=unnamed

" Show trailing whitespace and spaces before a tab:
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/

" faster Ruby syntax highlighting
let ruby_no_expensive=1

" use the old Regexp engine (used by the syntax highlighting, for example)
" (this makes vim about 100x faster)
set regexpengine=1

" maintain long history
set history=5000

" set tags file location
set tags=TAGS;~/
