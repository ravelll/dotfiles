"----------------------
"--basically settings--
"----------------------

"show encoding
set statusline=[%{&fileencoding}]%{fugitive#statusline()}

"always show statusline
set laststatus=2

"file enc
set fileencoding=utf-8

"show line number
set number

"search
set smartcase

"color scheme
colorscheme molokai

"search with highlighting
set hlsearch

"use indent algorythm to cindent
set cindent

"seve to current directory
set browsedir=buffer

set autoread
set nobackup
set noswapfile

"clipboard
set clipboard=unnamed,autoselect

"syntax highlight
syntax off

"tab to space
set smarttab
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

"emphasize tab and space
highlight space ctermbg=gray guibg=gray
match space /\s\+$/

" escape insert mode
inoremap <silent> jj <ESC>
inoremap <silent> kk <ESC>

" moving cursol in insert mode
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" complement brace
inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap < <><Left>
inoremap <% <%%><Left><Left>

" reload alias
nnoremap rr :e!<CR>

"-------------
"--neobundle--
"-------------

set nocompatible

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'L9'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'rails.vim'
NeoBundle 'surround.vim'
NeoBundle 'scrooloose/nerdtree.git'
NeoBundle 'fugitive.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'yanktmp.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'edsono/vim-matchit'
NeoBundle 'ruby-matchit'
NeoBundle 'tmhedberg/matchit'
NeoBundle 'switch.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'taglist.vim'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle '2072/PHP-Indenting-for-VIm.git'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'ref.vim'
NeoBundle 'terryma/vim-multiple-cursors.git'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'osyo-manga/vim-operator-search'
NeoBundle 'monochromegane/unite-yaml'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'szw/vim-tags'
NeoBundle 'BlockDiff'
NeoBundle 'git://git.wincent.com/command-t.git'

""filetype plugin on
NeoBundleCheck


"-------------
"---yanktmp---
"-------------

map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>


"---------------
"--neosnippets--
"---------------

" Plugin key-mappings.
imap <C-[>     <Plug>(neosnippet_expand_or_jump)
smap <C-[>     <Plug>(neosnippet_expand_or_jump)
xmap <C-[>     <Plug>(neosnippet_expand_target)


"-------------------------
"--vim-rails+neosnippets--
"-------------------------

autocmd User Rails.view*                 NeoSnippetSource ~/.vim/snippet/ruby.rails.view.snip
autocmd User Rails.controller*           NeoSnippetSource ~/.vim/snippet/ruby.rails.controller.snip
autocmd User Rails/db/migrate/*          NeoSnippetSource ~/.vim/snippet/ruby.rails.migrate.snip
autocmd User Rails/config/routes.rb      NeoSnippetSource ~/.vim/snippet/ruby.rails.route.snip


"------------
"--quickrun--
"------------

let g:quickrun_config={}
let g:quickrun_config['markdown']={
  \   'outputter': 'browser'
  \ }


"---------------------
"--vim-indent-guides--
"---------------------

hi IndentGuidesEven ctermbg=darkgray

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors=0


"-----------
"--TagList--
"-----------

let g:tlist_javascript_settings = 'javascript;c:class;m:method;F:function;p:property'


"---------
"--ctags--
"---------

nnoremap <C-]> g<C-]>


"-------------------
"--operator-search--
"-------------------

nmap <Space>s <Plug>(operator-search)
nmap <Space>/ <Plug>(operator-search)if


"---------
"--unite--
"---------

function! ChangeCurrentDirectoryToProjectRoot()
  let root = unite#util#path2project_directory(expand('%'))
  execute ":lcd " . root
endfunction
:au BufEnter * :call ChangeCurrentDirectoryToProjectRoot()

call unite#custom#source('file_rec', 'ignore_pattern', '\(png\|git\|jpeg\|jpg\)$')

" start with insert mode
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
let g:unite_source_rec_min_cache_files = 1
let g:unite_source_rec_max_cache_files = 25000

nnoremap <silent> ,ug :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> ,ucg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
nnoremap <silent> ,ur :<C-u>UniteResume search-buffer<CR>

nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>Unite file_rec:!<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>

if executable('pt')
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif


"--------------
"--PHP-Indent--
"--------------

let g:PHP_default_indenting = 1


"---------------
"--neocomplete--
"---------------

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1

" Use smartcase.
let g:neocomplete#enable_smart_case = 1

" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions',
      \ 'php' : $HOME.'/.vim/dict/php.dict',
      \ 'ruby' : $HOME.'/.vim/dict/ruby.dict'
      \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-u>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-;> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

"overwrite completefunc
let g:neocomplete#force_overwrite_completefunc=1
