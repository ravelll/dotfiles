filetype off

augroup rc
  autocmd!
augroup END

" ======== DISPLAY INFOMATION ========
" always show statusline
set laststatus=2

" show line number
set number

" command complement
set wildmode=list,full

" show encoding
set statusline=[%{&fileencoding}]%{fugitive#statusline()}

" fileencoding usage (left is prior right)
set fileencodings=utf-8,euc-jp,sjis,cp932,iso-2022-jp
scriptencoding utf-8,euc-jp,sjis,cp932,iso-2022-jp

" show current line
nnoremap <silent> ,ul :set cursorline<CR>
nnoremap <silent> ,uL :set nocursorline<CR>

" set 256color
set t_Co=256

" use init dir same as a file opening for selecting file
set browsedir=buffer

" colorscheme setting
silent! colorscheme murk
" ====================================

" =========== TAB, SPACE =============
set smarttab
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

augroup Spaces
  autocmd!
  autocmd ColorScheme * call HighlightSpaces()
  autocmd BufWritePost,VimEnter,WinEnter * match Spaces /\(\s\+$\)/
augroup END

function! HighlightSpaces()
  highlight Spaces cterm=reverse ctermfg=243
endfunction
call HighlightSpaces()

function! s:TrimSpaces()
  execute '%s/ \+$//'
endfunction
command! TrimSpaces call s:TrimSpaces()
" ====================================

" ============ SEARCHING ==============
" search with highlighting
set hlsearch

" stop highlighting
nnoremap <Esc><Esc> :nohlsearch<CR>

" use c indent algorithm
set cindent

" lowercase -> case-insensitive search
set ignorecase

" uppercase -> case-sensitive search
set ignorecase

" use Very Magic
nnoremap / /\v
" =====================================

" ========= BACKUP =========
set autoread
set nobackup
set noswapfile
set noundofile
" ==========================

" ========= KEYCONFIGS ==========
inoremap <silent> JK <ESC>

nnoremap j gj
nnoremap k gk

inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap < <><Left>
inoremap <% <%%><Left><Left>

nnoremap <Space>q :only<CR>

" reloading
nnoremap rr :e!<CR>

" enable backspace
set backspace=indent,eol,start
" ==============================

" ============ COPY =============
" sync vim copy to clipboard
set clipboard=unnamed

" copy file name
if executable('pbcopy')
  function! CopyFileName()
    execute ':! printf % | pbcopy'
  endfunction
  nnoremap <silent> cc :call CopyFileName()<CR>
endif
" ===============================

" ============ OTHERS =============
nnoremap ,f :set filetype=

" =================================

"}}}

" {{{
" ================== PLUGIN SETTINGS ==================
"
" leader
let maplocalleader=','

" use \ as , alternative
noremap \ ,

"@neobundle
if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

"#}}
"## Shougo-ware
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     },
      \ }
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/context_filetype.vim'
"### visual effect
NeoBundle 'bling/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'fxn/vim-monochrome'
NeoBundle 'ravelll/vim-murk'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'lilydjwg/colorizer'
NeoBundle 'pasela/unite-webcolorname'
NeoBundle 'simeji/winresizer'
"## extend working
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'sudo.vim'
NeoBundle 'surround.vim'
NeoBundle 'scrooloose/nerdtree.git'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'switch.vim'
NeoBundle 'taglist.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'terryma/vim-multiple-cursors.git'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'osyo-manga/vim-operator-search'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'tyru/open-browser-github.vim'
NeoBundle 'kana/vim-metarw'
"### backend utility
NeoBundle 'itchyny/vim-parenmatch'
NeoBundle 'Konfekt/FastFold'
NeoBundle 'L9'
NeoBundle 'mattn/benchvimrc-vim'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'nixprime/cpsm'
"### git
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'fugitive.vim'
"## search and open
NeoBundle 'szw/vim-tags'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'tpope/vim-abolish'
"### coding support
NeoBundle 'tmhedberg/matchit'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'honza/vim-snippets'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'AndrewRadev/splitjoin.vim'
"### treat specific type file
NeoBundle 'elzr/vim-json'
NeoBundle 'rename.vim'
NeoBundle 'haya14busa/vim-migemo'
NeoBundle 'moznion/hateblo.vim'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'junegunn/vim-easy-align'
"### ruby
NeoBundle 'ruby-matchit'
NeoBundle 'rails.vim'
NeoBundle 'basyura/unite-rails'
"### HTML
NeoBundle 'othree/html5.vim'
"### PHP
NeoBundle 'jwalton512/vim-blade'
NeoBundle 'ravelll/PDV--phpDocumentor-for-Vim'
NeoBundle 'vim-scripts/tagbar-phpctags', {
  \   'build' : {
  \     'others' : 'chmod +x bin/phpctags',
  \   },
  \ }
" NeoBundle 'shawncplus/phpcomplete.vim'
"### scala
NeoBundle 'derekwyatt/vim-scala'
"### golang
NeoBundle 'fatih/vim-go'
NeoBundle 'dgryski/vim-godef'
NeoBundle 'vim-jp/vim-go-extra'
"### elixir
NeoBundle 'elixir-lang/vim-elixir'
"### js
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'justinj/vim-react-snippets'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'mattn/jscomplete-vim'
NeoBundle 'nono/jquery.vim'
NeoBundle 'jiangmiao/simple-javascript-indenter'
"### TypeScript
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'Quramy/tsuquyomi'
"### coffee
NeoBundle 'kchmck/vim-coffee-script'
"### puppet
NeoBundle 'rodjek/vim-puppet'
NeoBundle 'puppetlabs/puppet-syntax-vim'
"### nginx
NeoBundle 'evanmiller/nginx-vim-syntax'
"### SQL
NeoBundle 'vim-scripts/sql.vim--Stinson'
NeoBundle 'vim-scripts/SQLComplete.vim'
"#}}

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" ================= RESPECTIVE PLUGIN SETTING =================
"@airline
let g:airline_left_sep='▶'
let g:airline_right_sep='◀'
let g:airline_theme='papercolor'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline#enable#branch = 1
let g:airline_detect_modified = 0
let g:airline#extensions#whitespace#checks = ['indent', 'mixed-indent-file']

"@winresizer
let g:winresizer_start_key = ',w'

"@vim-abolish
" nnoremap / :S/

"@parenmatch
let g:loaded_matchparen = 1

"@vimshell
nnoremap <silent> ,vs :VimShell<CR>
vnoremap <silent> ,vs :VimShellSendBuffer<CR>

"@sudo vim
function! s:Sw()
  execute "w sudo:%"
endfunction
command! Sw call s:Sw()

"@surround.vim
nmap <LocalLeader>{ ysiw{
nmap <LocalLeader>} ysiw}
nmap <LocalLeader>[ ysiw[
nmap <LocalLeader>] ysiw]
nmap <LocalLeader>( ysiw(
nmap <LocalLeader>) ysiw)
nmap <LocalLeader>b ysiwb
nmap <LocalLeader>< ysiw<
nmap <LocalLeader>> ysiw>
nmap <LocalLeader>" ysiw"
nmap <LocalLeader>' ysiw'
nmap <LocalLeader>` ysiw`
nmap <LocalLeader>* ysiw*
nmap <LocalLeader>/ ysiw/
nmap <LocalLeader><LocalLeader>* ysiw*wysiw*

"@neocomplete php
let g:neocomplete_php_locale = 'ja'

"@vim-multiple-cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

"@vim-indent-guides
let g:indent_guides_auto_colors=0
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
autocmd rc VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=235
autocmd rc VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=236

"@jscomplete-vim
let g:jscomplete_use = ['dom', 'moz', 'es6th']

"@jq
command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
  if 0 == a:0
    let l:arg = "."
  else
    let l:arg = a:1
  endif
  execute "%! jq " . l:arg
endfunction

"@neosnippets
imap <C-e> <Plug>(neosnippet_expand_or_jump)
smap <C-e> <Plug>(neosnippet_expand_or_jump)
xmap <C-e> <Plug>(neosnippet_expand_target)

let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

"@rename.vim
nnoremap <silent> ,mv :call Renamef()<CR>

"@vim-rails + neosnippets
autocmd rc User Rails.view*            NeoSnippetSource ~/.vim/snippet/ruby.rails.view.snip
autocmd rc User rails.controller*      neosnippetsource ~/.vim/snippet/ruby.rails.controller.snip
autocmd rc User rails/db/migrate/*     neosnippetsource ~/.vim/snippet/ruby.rails.migrate.snip
autocmd rc User rails/config/routes.rb neosnippetsource ~/.vim/snippet/ruby.rails.route.snip

"@markdown
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_new_list_item_indent = 0

"@quickrun
let g:quickrun_config={}
let g:quickrun_config.markdown = {
      \ 'outputter' : 'null',
      \ 'command'   : 'open',
      \ 'cmdopt'    : '-a',
      \ 'args'      : 'Marked\ 2',
      \ 'exec'      : '%c %o %a %s',
      \ }
let g:quickrun_config['coffee'] = {'command' : 'coffee', 'exec' : ['%c -cbp %s']}
if executable('gjs')
  let g:quickrun_config.javascript = {
        \ 'command'   : 'gjs',
        \ 'exec'      : '%c %s',
        \ }
endif

"@Tagbar
nnoremap ,tb :TagbarToggle<CR>

" for use gotags
" https://github.com/jstemmer/gotags
let g:tagbar_type_go = {
      \ 'ctagstype' : 'go',
      \ 'kinds'     : [
      \ 'p:package',
      \ 'i:imports:1',
      \ 'c:constants',
      \ 'v:variables',
      \ 't:types',
      \ 'n:interfaces',
      \ 'w:fields',
      \ 'e:embedded',
      \ 'm:methods',
      \ 'r:constructor',
      \ 'f:functions'
      \ ],
      \ 'sro' : '.',
      \ 'kind2scope' : {
      \ 't' : 'ctype',
      \ 'n' : 'ntype'
      \ },
      \ 'scope2kind' : {
      \ 'ctype' : 't',
      \ 'ntype' : 'n'
      \ },
      \ 'ctagsbin'  : 'gotags',
      \ 'ctagsargs' : '-sort -silent'
      \ }

"@TagList
let g:tlist_javascript_settings = 'javascript;c:class;m:method;F:function;p:property'
let g:Tlist_Ctags_Cmd = '/usr/local/bin/ctags'

nnoremap <silent> ,l :<C-u>TlistToggle<CR>
nnoremap <silent> ,L :<C-u>TlistAddFilesRecursive %:h<Tab><CR>

"@OpenGithub
vnoremap <silent> og :OpenGithubFile<CR>

"@tag jump
nnoremap <C-]> g<C-]>

"@NERDTree
let g:NERDTreeWinSize=30
let g:NERDTreeShowHidden=1
nnoremap <silent> ,nt :<C-u>NERDTreeToggle<CR>
nnoremap <silent> ,nf :<C-u>NERDTreeFind<CR>
" close at once with vim
autocmd rc bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"@operator-search
nnoremap <Space>s <Plug>(operator-search)
nnoremap <Space>/ <Plug>(operator-search)if

"@VimOver
nnoremap <silent> ,s :OverCommandLine<CR>%s/
vnoremap <silent> ,s :OverCommandLine<CR>s/

"@unite {
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
let g:unite_source_rec_min_cache_files = 1
let g:unite_source_rec_max_cache_files = 25000

call unite#custom#source('file_rec', 'ignore_pattern', '\(png\|.git\|jpeg\|jpg\)$')
" call unite#custom#source('file_rec', 'filters', ['converter_relative_word'])
" call unite#custom#source('file_mru', 'filters', ['converter_relative_word'])

function! ChangeCurrentDirectoryToProjectRoot()
  let root = unite#util#path2project_directory(expand('%'))
  execute ":lcd " . root
endfunction
:au BufEnter * :call ChangeCurrentDirectoryToProjectRoot()

nnoremap <silent> ,ug :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> ,ur :<C-u>UniteResume search-buffer<CR>
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>Unite file_rec:!<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> ,uc :<C-u>Unite webcolorname<CR>

nnoremap <silent> ,rm :<C-u>Unite rails/model<CR>
nnoremap <silent> ,rv :<C-u>Unite rails/view<CR>
nnoremap <silent> ,rc :<C-u>Unite rails/controller<CR>
nnoremap <silent> ,rl :<C-u>Unite rails/lib<CR>
nnoremap <silent> ,rd :<C-u>Unite rails/db<CR>
nnoremap <silent> ,rf :<C-u>Unite rails/config<CR>
nnoremap <silent> ,rh :<C-u>Unite rails/helper<CR>
nnoremap <silent> ,rs :<C-u>Unite rails/spec<CR>

nnoremap <silent> ,uw :<C-u>Unite codic<CR>

if executable('pt')
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
else
  let g:unite_source_grep_command = 'grep'
  let g:unite_source_grep_default_opts = '--color=never -R -S'
  let g:unite_source_grep_recursive_opt = '-R'
endif
"}

"@golang setting {
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_bin_path = '/usr/local/bin/'

exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
set completeopt=menu,preview

" autocmd FileType go autocmd BufWritePre <buffer> Fmt
"}

"@neocomplete {
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1

" Use smartcase.
let g:neocomplete#enable_smart_case = 0
let g:neocomplete#enable_fuzzy_completion = 0

" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.zsh_history',
      \ 'scheme' : $HOME.'/.gosh_completions',
      \ 'php' : $HOME.'/.vim/dict/php.dict',
      \ 'ruby' : $HOME.'/.vim/dict/ruby.dict',
      \ 'javascript' : $HOME.'/.vim/dict/javascript.dict',
      \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-u> neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-;> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" Enable omni completion.
autocmd rc FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd rc FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd rc FileType javascript setlocal omnifunc=jscomplete#CompleteJS
autocmd rc FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd rc FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.go = '\h\w\.\w*'
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

"overwrite completefunc
let g:neocomplete#force_overwrite_completefunc=1

let g:neocomplete#skip_auto_completion_time = ''

"}

"@CtrlP
nnoremap <silent> <c-p><c-p> :CtrlP<CR>
nnoremap <silent> <c-p><c-l> :CtrlPLine<CR>
nnoremap <silent> <c-p><c-u> :CtrlPMRU<CR>
nnoremap <silent> <c-p><c-t> :CtrlPTag<CR>

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = 'files -A -i "^(\\.git|\\.hg|\\.svn|_darcs|\\.bzr|vendor)$" %s'
let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
let g:ctrlp_match_window = 'order:btt'
let g:ctrlp_max_height = 60
let g:ctrlp_max_depth = 40
let g:ctrlp_max_files = 10000
let g:cpsm_query_inverting_delimiter = '\'

"@vim-textobj-rubybox
runtime $VIMRUNTIME/macros/matchit.vim

"@vim-tags
let g:vim_tags_ctags_binary = '/usr/local/bin/ctags'
let g:vim_tags_auto_generate = 1

"@vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

let g:easy_align_delimiters = {
\ '>': { 'pattern': '>>\|=>\|>' },
\ '/': {
\     'pattern':         '//\+\|/\*\|\*/',
\     'delimiter_align': 'l',
\     'ignore_groups':   ['!Comment'] },
\ ']': {
\     'pattern':       '[[\]]',
\     'left_margin':   0,
\     'right_margin':  0,
\     'stick_to_left': 0
\   },
\ ')': {
\     'pattern':       '[()]',
\     'left_margin':   0,
\     'right_margin':  0,
\     'stick_to_left': 0
\   },
\ 'd': {
\     'pattern':      ' \(\S\+\s*[;=]\)\@=',
\     'left_margin':  0,
\     'right_margin': 0
\   }
\ }

"@syntastic
nnoremap <silent> ,S :SyntasticToggleMode<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_mode_map = {
      \ "mode": "passive",
      \ "active_filetypes": ['ruby'] }
let g:syntastic_php_checkers = ['phpmd', 'php', 'phpcs']
let g:syntastic_php_phpmd_post_args = '$HOME/.composer/fixtures/ruleset.xml'
let g:syntastic_quiet_messages = {
      \ "regex": '.*[Cc]amelCase.*\|.*global.*\|.*minimum.*' }

"@php-doc.vim
nnoremap ,p :call PhpDocSingle()<CR>
vnoremap ,p :call PhpDocRange()<CR>

"@FastFold
let g:fastfold_savehook = 0
" =============================================================================
" }}}

"filetype setting
autocmd rc BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee
autocmd rc BufNewFile,BufRead *.thor      setf ruby
autocmd rc BufNewFile,BufRead Vagrantfile setf ruby
autocmd rc BufNewFile,BufRead *.tpl       setf html.javascript.smarty
autocmd rc BufNewFile,BufRead *.blade.php setf html.php.blade
autocmd rc BufNewFile,BufRead jquery.*.js set ft=javascript syntax=jquery
" autocmd BufNewFile,BufRead *.html.erb setf javascript.html.eruby
autocmd rc VimEnter,BufNewFile,BufRead * if &ft == '' | set ft=markdown | endif

"filetype indent
filetype plugin indent on

autocmd rc FileType sh         setlocal sw=2 sts=2 ts=2 et
autocmd rc FileType apache     setlocal sw=4 sts=4 ts=4 et
autocmd rc FileType aspvbs     setlocal sw=4 sts=4 ts=4 noet
autocmd rc FileType c          setlocal sw=4 sts=4 ts=4 et
autocmd rc FileType coffee     setlocal sw=2 sts=2 ts=2 et
autocmd rc FileType cpp        setlocal sw=4 sts=4 ts=4 et
autocmd rc FileType cs         setlocal sw=4 sts=4 ts=4 et
autocmd rc FileType css        setlocal sw=2 sts=2 ts=2 et
autocmd rc FileType diff       setlocal sw=4 sts=4 ts=4 noet
autocmd rc FileType eruby      setlocal sw=4 sts=4 ts=4 noet
autocmd rc FileType go         setlocal sw=4 sts=4 ts=4 noet
autocmd rc FileType html       setlocal sw=2 sts=2 ts=2 et
autocmd rc FileType java       setlocal sw=4 sts=4 ts=4 et
autocmd rc FileType javascript setlocal sw=2 sts=2 ts=2 et
autocmd rc FileType perl       setlocal sw=4 sts=4 ts=4 et
autocmd rc FileType php        setlocal sw=4 sts=4 ts=4 et
autocmd rc FileType python     setlocal sw=4 sts=4 ts=4 et
autocmd rc FileType ruby       setlocal sw=2 sts=2 ts=2 et
autocmd rc FileType haml       setlocal sw=2 sts=2 ts=2 et
autocmd rc FileType eruby      setlocal sw=2 sts=2 ts=2 et
autocmd rc FileType sql        setlocal sw=4 sts=4 ts=4 et
autocmd rc FileType vb         setlocal sw=4 sts=4 ts=4 noet
autocmd rc FileType vim        setlocal sw=2 sts=2 ts=2 et
autocmd rc FileType wsh        setlocal sw=4 sts=4 ts=4 et
autocmd rc FileType xhtml      setlocal sw=4 sts=4 ts=4 noet
autocmd rc FileType xml        setlocal sw=4 sts=4 ts=4 noet
autocmd rc FileType yaml       setlocal sw=2 sts=2 ts=2 et
autocmd rc FileType zsh        setlocal sw=2 sts=2 ts=2 et
autocmd rc FileType scala      setlocal sw=2 sts=2 ts=2 et
autocmd rc FileType coffee     setlocal sw=2 sts=2 ts=2 et
autocmd rc FileType puppet     setlocal sw=2 sts=2 ts=2 et
autocmd rc FileType tpl        setlocal sw=2 sts=2 ts=2 et

" syntax highlight
syntax on
