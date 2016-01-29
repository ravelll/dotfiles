filetype off

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

" show current line
nnoremap <silent> ,ul :set cursorline<CR>
nnoremap <silent> ,uL :set nocursorline<CR>

" set 256color
set t_Co=256

" use init dir same as a file opening for selecting file
set browsedir=buffer

" syntax highlight
syntax on

" colorscheme setting
colorscheme monochrome
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
  autocmd BufWritePost,VimEnter * match Spaces /\(\s\+$\|\t\)/
augroup END

function! HighlightSpaces()
  highlight Spaces cterm=reverse ctermfg=darkgreen gui=reverse guifg=darkgreen
endfunction
call HighlightSpaces()
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
nmap / /\v
" =====================================

" ========= BACKUP =========
set autoread
set nobackup
set noswapfile
set noundofile
" ==========================

" ========= KEYCONFIGS ==========
inoremap <silent> jj <ESC>

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
set clipboard=unnamed,autoselect

" copy file name
if executable('pbcopy')
  function! CopyFileName()
    execute ':! printf % | pbcopy'
  endfunction
  nnoremap <silent> cc :call CopyFileName()<CR>
endif
" ===============================
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
"## vim-utility
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     },
      \ }
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'honza/vim-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/context_filetype.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'L9'
NeoBundle 'sudo.vim'
NeoBundle 'surround.vim'
NeoBundle 'scrooloose/nerdtree.git'
NeoBundle 'rking/ag.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'edsono/vim-matchit'
NeoBundle 'tmhedberg/matchit'
NeoBundle 'switch.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'taglist.vim'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'ref.vim'
NeoBundle 'terryma/vim-multiple-cursors.git'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'osyo-manga/vim-operator-search'
NeoBundle 'monochromegane/unite-yaml'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'szw/vim-tags'
NeoBundle 'wincent/command-t'
NeoBundle 'lilydjwg/colorizer'
NeoBundle 'pasela/unite-webcolorname'
NeoBundle 'fxn/vim-monochrome'
NeoBundle 'changyuheng/color-scheme-holokai-for-vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'rename.vim'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'koron/codic-vim'
NeoBundle 'rhysd/unite-codic.vim'
NeoBundle 'haya14busa/vim-migemo'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'moznion/hateblo.vim'
NeoBundle 'rcmdnk/vim-markdown'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'elzr/vim-json'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'nixprime/cpsm'
NeoBundle 'heavenshell/vim-slack'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'vim-scripts/smarty-syntax'
NeoBundle 'AndrewRadev/splitjoin.vim'

"## git
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'fugitive.vim'

"## ruby
NeoBundle 'ruby-matchit'
NeoBundle 'rails.vim'
NeoBundle 'basyura/unite-rails'
NeoBundle 'thoughtbot/vim-rspec'
NeoBundle 'nelstrom/vim-textobj-rubyblock'

"## HTML
NeoBundle 'othree/html5.vim'

"## PHP
NeoBundle 'jwalton512/vim-blade'
NeoBundle 'ravelll/PDV--phpDocumentor-for-Vim'
NeoBundle 'vim-scripts/tagbar-phpctags', {
  \   'build' : {
  \     'others' : 'chmod +x bin/phpctags',
  \   },
  \ }

"## golang
NeoBundle 'fatih/vim-go'
NeoBundle 'dgryski/vim-godef'
NeoBundle 'vim-jp/vim-go-extra'

"## js
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'justinj/vim-react-snippets'
"#}}

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

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

"@vim-indent-guides
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=236

let g:indent_guides_auto_colors=0
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

"@neosnippets
imap <C-e> <Plug>(neosnippet_expand_or_jump)
smap <C-e> <Plug>(neosnippet_expand_or_jump)
xmap <C-e> <Plug>(neosnippet_expand_target)

let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

"@rename.vim
nnoremap <silent> ,mv :call Renamef()<CR>

"@vim-rails + neosnippets
autocmd User Rails.view*            NeoSnippetSource ~/.vim/snippet/ruby.rails.view.snip
autocmd user rails.controller*      neosnippetsource ~/.vim/snippet/ruby.rails.controller.snip
autocmd user rails/db/migrate/*     neosnippetsource ~/.vim/snippet/ruby.rails.migrate.snip
autocmd user rails/config/routes.rb neosnippetsource ~/.vim/snippet/ruby.rails.route.snip

"@quickrun
let g:quickrun_config={}
let g:quickrun_config['markdown']={
      \   'outputter': 'browser'
      \ }

"@Tagbar
nmap ,tb :TagbarToggle<CR>

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

"@tag jump
nnoremap <C-]> g<C-]>

"@NERDTree
nnoremap <silent> ,nt :<C-u>NERDTreeToggle<CR>
nnoremap <silent> ,nf :<C-u>NERDTreeFind<CR>
let g:NERDTreeWinSize=40

"@operator-search
nmap <Space>s <Plug>(operator-search)
nmap <Space>/ <Plug>(operator-search)if

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
  " let g:unite_source_rec_async_command = ['hw', '-f', '--no-color', '--no-group', '-a', '-l', '']
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
else
  " let g:unite_source_rec_async_command = ['grep', '-R', '-S', '--color=never', '-h', '-l', '']
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
let g:go_bin_path = '/usr/local/bin/go'

exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
set completeopt=menu,preview

autocmd FileType go autocmd BufWritePre <buffer> Fmt
"}

"@neocomplete {
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
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-;> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

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

let g:neocomplete#skip_auto_completion_time = ''

"}

"@vim-rspec => vim-dispatch
let s:bundle = neobundle#get('vim-rspec')
function! s:bundle.hooks.on_source(bundle)
  let g:rspec_command = 'Dispatch bundle exec rspec {spec}'
endfunction

nmap <silent>,tc :call RunCurrentSpecFile()<CR>
nmap <silent>,tn :call RunNearestSpec()<CR>
nmap <silent>,tl :call RunLastSpec()<CR>
nmap <silent>,ta :call RunAllSpecs()<CR>

"@CtrlP
nnoremap <silent> <c-p><c-p> :CtrlP<CR>
nnoremap <silent> <c-p><c-l> :CtrlPLine<CR>
nnoremap <silent> <c-p><c-u> :CtrlPMRU<CR>
nnoremap <silent> <c-p><c-t> :CtrlPTag<CR>

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = 'files -A %s'
let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
" let g:ctrlp_match_window = 'order:btt'
let g:ctrlp_max_height = 40
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

"@execute php-cs-fixer to opened file
if executable('php-cs-fixer')
  function! PhpFix()
    execute ':! echo % | xargs -I % php-cs-fixer fix % --config-file ~/.php_cs'
  endfunction
  nnoremap <silent> ,ff *:call PhpFix()<CR>
endif

"@php-doc.vim
nnoremap ,p :call PhpDocSingle()<CR>
vnoremap ,p :call PhpDocRange()<CR>

" =============================================================================
" }}}

"filetype setting
autocmd BufNewFile,BufRead *.thor      setf ruby
autocmd BufNewFile,BufRead Vagrantfile setf ruby
autocmd BufNewFile,BufRead *.tpl       setf smarty.html
autocmd BufNewFile,BufRead *.blade.php setf html.php.blade
" autocmd BufNewFile,BufRead *.html.erb setf javascript.html.eruby

"filetype indent
filetype plugin indent on

autocmd FileType sh         setlocal sw=2 sts=2 ts=2 et
autocmd FileType apache     setlocal sw=4 sts=4 ts=4 et
autocmd FileType aspvbs     setlocal sw=4 sts=4 ts=4 noet
autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
autocmd FileType cs         setlocal sw=4 sts=4 ts=4 et
autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
autocmd FileType diff       setlocal sw=4 sts=4 ts=4 noet
autocmd FileType eruby      setlocal sw=4 sts=4 ts=4 noet
autocmd FileType go         setlocal sw=4 sts=4 ts=4 noet
autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
autocmd FileType eruby      setlocal sw=2 sts=2 ts=2 et
autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
autocmd FileType vb         setlocal sw=4 sts=4 ts=4 noet
autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
autocmd FileType wsh        setlocal sw=4 sts=4 ts=4 et
autocmd FileType xhtml      setlocal sw=4 sts=4 ts=4 noet
autocmd FileType xml        setlocal sw=4 sts=4 ts=4 noet
autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
autocmd FileType zsh        setlocal sw=2 sts=2 ts=2 et
autocmd FileType scala      setlocal sw=2 sts=2 ts=2 et
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et
autocmd FileType puppet     setlocal sw=2 sts=2 ts=2 et
autocmd FileType tpl        setlocal sw=2 sts=2 ts=2 et

