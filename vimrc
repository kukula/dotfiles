" Oldie {
  set nocompatible               " be iMproved
  set backspace=indent,eol,start
  set history=5000
  set t_Co=256
  set encoding=utf-8 fileencoding=utf-8
  set mouse=""
" }

call plug#begin('~/.vim/plugged')

" Plugins {
  " ruby
  Plug 'vim-ruby/vim-ruby'
  " ruby
  Plug 'tpope/vim-rails'
  " rspec
  Plug 'thoughtbot/vim-rspec'
  " elixir-lang
  Plug 'elixir-lang/vim-elixir'
  " slim templates
  Plug 'slim-template/vim-slim'
  " Elm
  Plug 'lambdatoast/elm.vim'
  " git wrapper
  Plug 'tpope/vim-fugitive'
  " git commit browser :GV
  Plug 'junegunn/gv.vim'
  " ctrl-p is a fuzzy file finder.
  Plug 'kien/ctrlp.vim'
  " search/replace
  Plug 'dkprice/vim-easygrep'
  " snippets
  Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'tomtom/tlib_vim'
  Plug 'garbas/vim-snipmate'
  Plug 'honza/vim-snippets'
  " surround cs, ds, ys
  Plug 'tpope/vim-surround'
  " Match do end
  Plug 'vim-scripts/matchit.zip'
  " blocks converting (gS gJ)
  Plug 'AndrewRadev/splitjoin.vim'
  " send command from vim to tmux
  Plug 'jgdavey/tslime.vim'
  " themes
  Plug 'chriskempson/base16-vim'
  " Coffeescript :(
  Plug 'kchmck/vim-coffee-script'
" }

call plug#end()

" Settings {
  " Syntax and filetype detection
  syntax on
  filetype indent plugin on

  " Syntax coloring lines that are too long just slows down the world
  set synmaxcol=128

  " For better terminal perfomance
  set ttyfast " u got a fast terminal
  "set ttyscroll=3
  set lazyredraw " to avoid scrolling problems

  " Change unsaved beffers
  set hidden

  " Better command-line completion
  set wildmenu

  " Show numbers and highlight currentline
  set number relativenumber
  set cursorline

  " Disable swap and backup
  set nobackup
  set noswapfile

  " Split below/right
  set splitbelow
  set splitright

  " Indentation
  set expandtab     " all tabs expands to spaces
  set sw=2          " automagic indent width
  set tabstop=2     " size of tab in spaces
  set ts=2          " size of tab
  set shiftround    " round indent to multiple of 'shiftwidth', applies to > and <
  set smarttab
  set softtabstop=2 " number of spaces that a <Tab> counts for
                    " while performing editing operations

  " Smartcase -- normally ignores case, but when we type uppercase character
  " in search box it will be CASE SENSITIVE
  set ignorecase
  set smartcase
  set hlsearch

  " Statusline
  set laststatus=2
  set statusline=%f\ %m%r%w%y%=:b%n\ 🐘\ \ %l/%L

  " Instead of failing a command because of unsaved changes, instead raise a
  " dialogue asking if you wish to save changed files.
  set confirm

  " Use visual bell instead of beeping when doing something wrong
  set visualbell

  " Reset the terminal code for the visual bell
  set t_vb=

  " Show trailing whitespace
  highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
  autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
  match ExtraWhitespace /\s\+$\| \+\ze\t/

  " Tying rspec-vim and tslime
  let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
" }

" Key mappings {
  let mapleader=','

  " Map Y to act like D and C, i.e. to yank until EOL
  map Y y$
  " Sodium style mappings :)
  map H ^
  map L $
  map J 15j
  map K 15k
  " File browsing
  nnoremap - :Explore<CR>

  " Copy and paste from system clipboard
  vmap <Leader>y "+y
  nmap <Leader>Y "+Y
  vmap <Leader>d "+d
  nmap <Leader>p "+p
  nmap <Leader>P "+P
  vmap <Leader>p "+p
  vmap <Leader>P "+P

  " Remove selection
  map <Esc><Esc> :noh<CR>

  " Buffers
  nnoremap <Leader>l :ls!<CR>
  nnoremap <Leader>b :bp<CR>
  nnoremap <Leader>f :bn<CR>
  nnoremap <Leader>e :e#<CR>
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

  " Error prone
  command WQ wq
  command Wq wq
  command Cq cq
  command W w
  command Q q

  " Convert old ruby hash syntaxt
  command! -range ConvertHashSyntax <line1>,<line2>s/:\(\S\{-}\)\(\s\{-}\)=> /\1:\2/

  " Fugitive
  map <Leader>gs :Gstatus<CR>

  " Rubocop
  map <Leader>r :!rubocop -a --rails %<CR>


  " Tslime keys
  vmap <C-c><C-c> <Plug>SendSelectionToTmux
  nmap <C-c><C-c> <Plug>NormalModeSendToTmux
  nmap <C-c>r <Plug>SetTmuxVars

  " RSpec.vim mappings
  map <Leader>st :call RunCurrentSpecFile()<CR>
  map <Leader>ss :call RunNearestSpec()<CR>
  map <Leader>sl :call RunLastSpec()<CR>
  map <Leader>sa :call RunAllSpecs()<CR>

  " The Silver Searcher
  if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
  endif

  " bind K to grep word under cursor
  nnoremap <Leader>ff :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

  " bind \ (backward slash) to grep shortcut
  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  nnoremap \ :Ag<SPACE>
" }

" Theme {
  if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
  endif
" }
