" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Bundles list
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'itchyny/lightline.vim'
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
NeoBundle 'tpope/vim-vinegar'
NeoBundle 'tpope/vim-surround'
NeoBundle 'wting/rust.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'slim-template/vim-slim.git'
NeoBundle 'thoughtbot/vim-rspec'
NeoBundle 'jgdavey/vim-blockle'
NeoBundle 'fatih/vim-go'
NeoBundle 'rking/ag.vim'
NeoBundle 'dyng/ctrlsf.vim'

call neobundle#end()

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" Bundles settings

" CtrlP
let g:ctrlp_map = '<c-p>'
nmap cp <c-p>
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 'Et'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_extensions = ['tag', 'buffertag']

" RSpec.vim
let g:rspec_runner = "os_x_iterm"

" Qargs https://github.com/nelstrom/vim-qargs
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

" LightLine
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'relativepath', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"X":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ }
