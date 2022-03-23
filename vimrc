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
" Coffeescript
Plug 'kchmck/vim-coffee-script'
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
" Elixir
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
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
Plug 'github/copilot.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

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
map <Leader>gs :Git<CR>

" FZF
nnoremap <C-p> :<C-u>GFiles<CR>
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

  hi Normal ctermbg=NONE
  hi LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE
  hi DiffAdd ctermfg=2 ctermbg=NONE
  hi DiffChange ctermfg=8 ctermbg=NONE
  hi DiffDelete ctermfg=1 ctermbg=NONE
  hi DiffText cterm=bold ctermfg=4 ctermbg=NONE
  hi SignColumn cterm=bold ctermfg=4 ctermbg=NONE
  hi VertSplit ctermfg=0 ctermbg=NONE
  hi StatusLine ctermfg=0 ctermbg=8
  hi StatusLineNC ctermfg=8 ctermbg=NONE
  hi SpellBad cterm=undercurl ctermbg=0
  hi SpellCap cterm=undercurl ctermbg=0
  hi SpellRare cterm=undercurl ctermbg=0
  hi SpellLocal cterm=undercurl ctermbg=0
endif

" Show trailing whitespace
highlight ExtraWhitespace ctermbg=1 guibg=1
match ExtraWhitespace /\s\+$/

" Language specific
autocmd FileType ruby setlocal expandtab tabstop=2 shiftwidth=2
autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4

" LSP
lua <<EOF
local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function will take the provided server configuration and decorate it with the necessary properties
    -- before passing it onwards to lspconfig.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)
EOF
