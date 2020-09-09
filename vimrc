set nocompatible " be iMproved
set backspace=indent,eol,start
set history=5000
set encoding=utf-8 fileencoding=utf-8
set mouse=""

call plug#begin('~/.vim/plugged')

" Plugins
" Ruby
Plug 'vim-ruby/vim-ruby'
" Rails
Plug 'tpope/vim-rails'
" RSpec
Plug 'thoughtbot/vim-rspec'
" Slim templates
Plug 'slim-template/vim-slim'
" Git wrapper
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
" git commit browser :GV
Plug 'junegunn/gv.vim'
" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" surround cs, ds, ys
Plug 'tpope/vim-surround'
" Match do end
Plug 'vim-scripts/matchit.zip'
" blocks converting (gS gJ)
Plug 'AndrewRadev/splitjoin.vim'
" themes
Plug 'chriskempson/base16-vim'
" JS
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'
" Comments
Plug 'tomtom/tcomment_vim'
" Test
Plug 'janko-m/vim-test'
Plug 'kassio/neoterm'
" Other
Plug 'rhysd/vim-crystal'
Plug 'johngrib/vim-game-code-break'
" Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" LSP
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

call plug#end()

syntax enable
set t_Co=256
" set background=light
" colorscheme  ron
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
" set number relativenumber
" set cursorline

" Disable swap and backup
set nobackup
set nowritebackup
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

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" Reset the terminal code for the visual bell
set t_vb=

" new vim8 options
set breakindent
set emoji
set fixendofline

" folds (za)
set foldmethod=indent
set foldlevel=99

" Show trailing whitespace
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\| \+\ze\t/

" Nice commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72
set spelllang=en_au

" Tying rspec-vim and tslime
let g:rspec_command = 'call Send_to_Tmux("bundle exec rspec {spec}\n")'

" JSX indentation in JS files
let g:jsx_ext_required = 0

" Key mappings
let mapleader=','

" Map Y to act like D and C, i.e. to yank until EOL
" map Y y$
" Sodium style mappings :)
map H ^
map L $
map J 20jzz
map K 20kzz

" File browsing
nnoremap ` :Explore<CR>
nnoremap <Leader>f :Explore<CR>

" Copy and paste from system clipboard
vmap <Leader>y "+y
nmap <Leader>Y "+Y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
" Remove selection
map <Esc> :noh<CR>

" Buffers
nnoremap <Leader>e :e#<CR>

" Error prone
command! WQ wq
command! Wq wq
command! Cq cq
command! W w
command! Q q

" Convert old ruby hash syntaxt
command! -range ConvertHashSyntax <line1>,<line2>s/:\(\S\{-}\)\(\s\{-}\)=> /\1:\2/

" Fugitive
map <Leader>gs :Gstatus<CR>

" FZF
nnoremap <C-p> :<C-u>Files<CR>
nnoremap <Leader>l :Buffers<CR>

" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" RSpec.vim mappings
map <Leader>st :call RunCurrentSpecFile()<CR>
map <Leader>ss :call RunNearestSpec()<CR>
map <Leader>sl :call RunLastSpec()<CR>
map <Leader>sa :call RunAllSpecs()<CR>

if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
  let g:ackprg='rg --vimgrep --no-heading'
  let g:ctrlp_user_command='rg %s --files --color=never'
  let g:ctrlp_use_caching = 0
endif

augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l* lwindow
augroup END

" bind grep word under cursor
nnoremap <Leader>r :grep! "\b<C-R><C-W>\b"<CR>:cw<CR><CR>

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background

  highlight Normal guibg=NONE ctermbg=NONE
endif

" Language specific
autocmd FileType ruby setlocal expandtab tabstop=2 shiftwidth=2
autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4

" LSP
let g:LanguageClient_serverCommands = { 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'] }

" \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
" \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
" \ 'python': ['/usr/local/bin/pyls'],

noremap <F5> <Plug>(lcn-menu)
noremap <silent><F1> <Plug>(lcn-hover)
noremap <silent> gd <Plug>(lcn-definition)
noremap <silent> <F2> <Plug>(lcn-rename)
