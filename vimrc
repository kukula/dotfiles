" Oldie {
  set nocompatible               " be iMproved
  set backspace=indent,eol,start
  set history=5000
  set t_Co=256
  set encoding=utf-8 fileencoding=utf-8
" }

call plug#begin('~/.vim/plugged')

" Plugins {
  " ruby
  Plug 'vim-ruby/vim-ruby'
  " rspec
  Plug 'thoughtbot/vim-rspec'
  " elixir-lang
  Plug 'elixir-lang/vim-elixir'
  " slim templates
  Plug 'slim-template/vim-slim'
  " git wrapper
  Plug 'tpope/vim-fugitive'
  " ctrl-p is a fuzzy file finder.
  Plug 'kien/ctrlp.vim'
  " search
  Plug 'rking/ag.vim'
  " snippets
  Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'tomtom/tlib_vim'
  Plug 'garbas/vim-snipmate'
  Plug 'honza/vim-snippets'
  " surround
  Plug 'tpope/vim-surround'
  " blocks converting (gS gJ)
  Plug 'AndrewRadev/splitjoin.vim'
  " send command from vim to tmux
  Plug 'jgdavey/tslime.vim'
  " find/replace
  Plug 'vim-scripts/Greplace.vim'
  " themes
  Plug 'chriskempson/base16-vim'
" }

call plug#end()

" Settings {
  " Show numbers and highlight currentline
  set number relativenumber
  set cursorline

  " Disable swap and backup
  set nobackup
  set noswapfile

  " Change unsaved beffers
  set hidden

  " Split below/right
  set splitbelow
  set splitright

  " Syntax and filetype detection
  syntax on
  filetype plugin on
  filetype indent on

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

  " Show trailing whitespace
  highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
  autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
  match ExtraWhitespace /\s\+$\| \+\ze\t/

  " Tying rspec-vim and tslime
  let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
" }

" Key mappings {
  let mapleader=','

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
  nnoremap <Leader>l :ls<CR>
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

  " Tslime keys
  vmap <C-c><C-c> <Plug>SendSelectionToTmux
  nmap <C-c><C-c> <Plug>NormalModeSendToTmux
  nmap <C-c>r <Plug>SetTmuxVars

  " RSpec.vim mappings
  map <Leader>st :call RunCurrentSpecFile()<CR>
  map <Leader>ss :call RunNearestSpec()<CR>
  map <Leader>sl :call RunLastSpec()<CR>
  map <Leader>sa :call RunAllSpecs()<CR>
" }

" Theme {
  if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
  endif
" }
