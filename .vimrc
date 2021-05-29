filetype off

augroup rc
  autocmd!
augroup END

" ===== DISPLAYING ===== {{{
" always show statusline
set laststatus=2

" show no line number
set nonumber
set signcolumn=number

" no putting message
set noshowmode

" Use twice the width of ASCII characters
set ambiwidth=double

" not be redrawn while executing macros, registers and other commands that have not been typed
" and postpones updating the window title
set lazyredraw

" command complement
set wildmode=list,full

" fileencoding usage
set fileencoding=utf-8 fileformat=unix
scriptencoding utf-8

" fileencoding usage (left is prior right)
" set fileencodings=utf-8,euc-jp,sjis,cp932,iso-2022-jp
" scriptencoding utf-8,euc-jp,sjis,cp932,iso-2022-jp

" show current line
nnoremap <silent> ,ul :set cursorline<CR>
nnoremap <silent> ,uL :set nocursorline<CR>

" use init dir same as a file opening for selecting file
set browsedir=buffer

" when use vim in tmux, set the number of colors to 256
if $TERM == 'screen'
  set t_Co=256
endif
" }}}

" ===== TAB, SPACE ===== {{{
" displays tabs with spaces same as shiftwidth
set smarttab

" input spaces using tab key
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
" }}}

" ===== SEARCHING ===== {{{
" search with highlighting
set hlsearch

" stop highlighting
nnoremap <C-[><C-[> :nohlsearch<CR>

" use c indent algorithm
set cindent
set breakindent

set ignorecase

" use Very Magic
nnoremap / /\v

" open quick-fix in vimgrep automatically
autocmd QuickFixCmdPost *grep* cwindow
" }}}

" ===== BACKUP ===== {{{
set autoread
set nobackup
set noswapfile
set noundofile
" }}}

" ===== BASIC KEYCONFIGS ===== {{{
nnoremap j gj
nnoremap k gk

nnoremap H h
vnoremap H h

nnoremap <Space>q :only<CR>

" reloading
nnoremap rr :e!<CR>

" leader
let g:mapleader = ','

" use \ as , alternative
noremap \ ,

" enable backspace
set backspace=indent,eol,start
""}}}

" ===== COPYING ===== {{{
" sync vim copy to clipboard
set clipboard=unnamed

" copy file name
nnoremap <silent> cc :let @+ = remove(split(expand("%"), "/"), -1)<CR>
nnoremap <silent> CC :let @+ = expand("%:p")<CR>
" }}}

" ============ OTHER USEFULS ============= {{{
set regexpengine=1
nnoremap ,f :set filetype=

inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap <% <%  %><Left><Left><Left>
inoremap <%= <%=  %><Left><Left><Left>

" No beep or notify visually
set visualbell t_vb=

" load the local specific config file
if filereadable(expand('~/.localvimrc'))
  source ~/.localvimrc
endif

autocmd rc bufenter * if (winnr('$') == 1 && &buftype == "quickfix") | q | endif
"}}}

" ================== PLUGIN LOADING(dein) ================== {{{
" disable all mappings defined by ftplugins
let g:no_plugin_maps=0
if &compatible
  set nocompatible
endif

" set runtimepath+=$HOME/.vim/repos/github.com/Shougo/dein.vim
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

call dein#begin($HOME.'/.cache/dein')
call dein#add($HOME.'/.cache/dein/repos/github.com/Shougo/dein.vim')

"## Shougo-ware
call dein#add('Shougo/vimproc', { 'build': 'make' })
call dein#add('Shougo/deoplete.nvim')
call dein#add('lighttiger2505/deoplete-vim-lsp')
call dein#add('roxma/nvim-yarp')
call dein#add('roxma/vim-hug-neovim-rpc')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/context_filetype.vim')
"### visual effect
call dein#add('itchyny/lightline.vim')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('cocopon/iceberg.vim')
call dein#add('simeji/winresizer')
"## extend working
call dein#add('vim-scripts/surround.vim')
call dein#add('scrooloose/nerdtree.git')
call dein#add('tomtom/tcomment_vim')
call dein#add('vim-scripts/taglist.vim')
call dein#add('thinca/vim-quickrun')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('mattn/webapi-vim')
call dein#add('tyru/open-browser.vim')
call dein#add('kana/vim-metarw')
call dein#add('ivalkeen/vim-ctrlp-tjump')
call dein#add('haya14busa/vim-edgemotion')
call dein#add('AndrewRadev/linediff.vim')
"### backend utility
" call dein#add('itchyny/vim-parenmatch')
call dein#add('Konfekt/FastFold')
call dein#add('prabirshrestha/async.vim')
call dein#add('prabirshrestha/vim-lsp')
" call dein#add('mattn/benchvimrc-vim')
call dein#add('osyo-manga/vim-over')
call dein#add('mattn/ctrlp-matchfuzzy')
call dein#add('vim-jp/autofmt')
"### git
call dein#add('tpope/vim-fugitive')
"## search and open
call dein#add('szw/vim-tags')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('tpope/vim-abolish')
call dein#add('liuchengxu/vim-clap')
"### coding support
call dein#add('w0rp/ale')
call dein#add('honza/vim-snippets')
call dein#add('tpope/vim-endwise')
call dein#add('tpope/vim-repeat')
" call dein#add('cohama/lexima.vim')
"### treat specific type file
call dein#add('elzr/vim-json')
call dein#add('plasticboy/vim-markdown')
call dein#add('kana/vim-textobj-user')
call dein#add('majutsushi/tagbar')
call dein#add('junegunn/vim-easy-align')
"### Ruby
call dein#add('slim-template/vim-slim')
call dein#add('pocke/rbs.vim')
" call dein#add('todesking/ruby_hl_lvar.vim')
"### Rust
call dein#add('rust-lang/rust.vim')
"### HTML
call dein#add('othree/html5.vim')
call dein#add('alvan/vim-closetag')
"### Golang
call dein#add('fatih/vim-go')
"### JavaScript
call dein#add('pangloss/vim-javascript')
call dein#add('mattn/jscomplete-vim')
call dein#add('jelera/vim-javascript-syntax')
call dein#add('briancollins/vim-jst')
call dein#add('posva/vim-vue')
call dein#add('ternjs/tern_for_vim')
call dein#add('yuezk/vim-js')
call dein#add('maxmellon/vim-jsx-pretty')
"### TypeScript
call dein#add('leafgarland/typescript-vim')
call dein#add('Quramy/tsuquyomi')
"### SQL
call dein#add('vim-scripts/sql.vim--Stinson')
call dein#add('vim-scripts/SQLComplete.vim')
"### toml
call dein#add('cespare/vim-toml')
"### GraphQL
call dein#add('jparise/vim-graphql')
"### Terraform
call dein#add('hashivim/vim-terraform')

call dein#end()

filetype plugin indent on
syntax enable
" }}}

" ========== PLUGIN SETTINGS =========== {{{
"@deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#var('omni', 'keyword_patterns', {
  \ 'ruby': '[a-zA-Z_]\w*[!?]?',
  \ })
call deoplete#custom#option({
  \ 'yarp': v:true,
  \ 'auto_complete': v:true,
  \ 'auto_complete_delay': 100,
  \ 'min_pattern_length': 2,
  \ 'smart_case': v:true,
  \ 'num_processes': 4,
  \ })
let s:use_lsp_sources = ['lsp', 'dictionary', 'file']
call deoplete#custom#option('sources', {
  \ 'python': s:use_lsp_sources,
  \ })
call deoplete#custom#source('LanguageClient', 'rank', 500)
call deoplete#custom#source('LanguageClient', 'dup', v:false)
set completeopt+=noselect

"@vim-multiple-cursors
"" avoid conflict with deoplete
func! Multiple_cursors_before()
  if deoplete#is_enabled()
    call deoplete#disable()
    let g:deoplete_is_enable_before_multi_cursors = 1
  else
    let g:deoplete_is_enable_before_multi_cursors = 0
  endif
endfunc
func! Multiple_cursors_after()
  if g:deoplete_is_enable_before_multi_cursors
    call deoplete#enable()
  endif
endfunc

"@autofmt
set formatexpr=autofmt#japanese#formatexpr()
let autofmt_allow_over_tw=1
set formatoptions+=mM
set smartindent

"@ Language Server
if executable('typescript-language-server')
  augroup LspTypeScript
    au!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server', '--stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
        \ 'whitelist': ['typescript'],
        \ })
    autocmd FileType typescript setlocal omnifunc=lsp#complete
  augroup END
endif
if executable('gopls')
  augroup LspGo
    au!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'go-lang',
        \ 'cmd': {server_info->['gopls']},
        \ 'whitelist': ['go'],
        \ })
    autocmd FileType go setlocal omnifunc=lsp#complete
    autocmd FileType go nmap gd <plug>(lsp-definition)
  augroup END
endif
if executable('solargraph')
  augroup LspRuby
    au!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'solargraph',
        \ 'cmd': {server_info->['solargraph', 'stdio']},
        \ 'whitelist': ['ruby'],
        \ })
    autocmd FileType ruby setlocal omnifunc=lsp#complete
  augroup END
endif
if executable('rls')
  augroup LspRust
    au!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rls']},
        \ 'whitelist': ['rust'],
        \ })
    autocmd FileType rust setlocal omnifunc=lsp#complete
  augroup END
endif
if executable('pyls')
  augroup LspPython
    au!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
    autocmd FileType python setlocal omnifunc=lsp#complete
  augroup END
endif

"@deoplete-tern
" Use deoplete.
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete

" Add extra filetypes
let g:tern#filetypes = ['vue']

"@lightline
let g:lightline = {
  \ 'colorscheme': 'one',
  \ 'active': {
  \   'left': [ ['mode', 'paste'],
  \             ['branch', 'readonly', 'filename', 'modified'] ]
  \ },
  \ 'component_function': {
  \   'branch': 'fugitive#head'
  \ },
  \ }

"@winresizer
let g:winresizer_start_key = ',w'

"@vim-closetag
let g:closetag_filenames = "*.html*,*.js,*.jsx,*.vue,*.ts,*.tsx"

"@parenmatch
let g:loaded_matchparen = 1

"@sudo vim
function! s:Sw()
  execute "w sudo:%"
endfunction
command! Sw call s:Sw()

"@surround.vim
nmap <Leader>{ ysiw{
nmap <Leader>} ysiw}
nmap <Leader>[ ysiw[
nmap <Leader>] ysiw]
nmap <Leader>( ysiw(
nmap <Leader>) ysiw)
nmap <Leader>b ysiwb
nmap <Leader>< ysiw<
nmap <Leader>> ysiw>
nmap <Leader>" ysiw"
nmap <Leader>' ysiw'
nmap <Leader>` ysiw`
nmap <Leader>* ysiw*
nmap <Leader>/ ysiw/
nmap <Leader><Space> ysiw<Space><Space>
nmap <Leader><Leader>* ysiw*wysiw*

"@vim-indent-guides
let g:indent_guides_auto_colors=0
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
autocmd rc VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=235
autocmd rc VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=236

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
let g:neosnippet#snippets_directory='~/.vim/repos/github.com/honza/vim-snippets/snippets'

"@vim-json
let g:vim_json_syntax_conceal = 0

"@markdown
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

"@quickrun
let g:quickrun_config={}
let g:quickrun_config.markdown = {
      \ 'outputter' : 'null',
      \ 'command'   : 'open',
      \ 'cmdopt'    : '-a',
      \ 'args'      : 'Marked\ 2',
      \ 'exec'      : '%c %o %a %s',
      \ }
let g:quickrun_config['typescript'] = { 'type' : 'typescript/tsc' }
let g:quickrun_config['typescript/tsc'] = {
      \   'command': 'tsc',
      \   'exec': ['%c --target esnext --module commonjs --lib esnext,dom %o %s', 'node %s:r.js'],
      \   'tempfile': '%{tempname()}.ts',
      \   'hook/sweep/files': ['%S:p:r.js'],
      \ }
nnoremap ,q :QuickRun<CR>
vnoremap ,q :QuickRun<CR>

"@vim-ctrlp-tjump
let g:ctrlp_tjump_only_silent = 1

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

"@tag jump
nnoremap <c-]> :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>

"@NERDTree
let g:NERDTreeWinSize=30
let g:NERDTreeShowHidden=1
nnoremap <silent> ,nt :<C-u>NERDTreeToggle<CR>
nnoremap <silent> ,nf :<C-u>NERDTreeFind<CR>
" close at once with vim
autocmd rc bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"@vim-repeat
silent! call repeat#set("\<Plug>Dsurround")
silent! call repeat#set("\<Plug>Csurround")
silent! call repeat#set("\<Plug>CSurround")
silent! call repeat#set("\<Plug>Ysurround")
silent! call repeat#set("\<Plug>YSurround")
silent! call repeat#set("\<Plug>Yssurround")
silent! call repeat#set("\<Plug>YSsurround")

"@operator-search
nnoremap <Space>s <Plug>(operator-search)
nnoremap <Space>/ <Plug>(operator-search)if

"@VimOver
nnoremap <silent> ,s :OverCommandLine<CR>%s/
vnoremap <silent> ,s :OverCommandLine<CR>s/

"@golang setting {
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = 'goimports'
let g:go_bin_path = $HOME.'/dev/bin/'
"}

"@vim-edgemotion
nmap <C-j> <Plug>(edgemotion-j)
nmap <C-k> <Plug>(edgemotion-k)
vmap <C-j> <Plug>(edgemotion-j)
vmap <C-k> <Plug>(edgemotion-k)

"@CtrlP
nnoremap <silent> <c-p><c-p> :CtrlP<CR>
nnoremap <silent> <c-p><c-l> :CtrlPLine<CR>
nnoremap <silent> <c-p><c-u> :CtrlPMRU<CR>
nnoremap <silent> <c-p><c-t> :CtrlPTag<CR>

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['Dockerfile', 'kubernetes', '*.gemspec', 'tsconfig.*']
let g:ctrlp_user_command = 'files -A -i "^(\\.git|\\.hg|\\.svn|_darcs|\\.bzr|vendor|node_modules|tmp|\\.tmp)$" %s'
let g:ctrlp_match_func = {'match': 'ctrlp_matchfuzzy#matcher'}
let g:ctrlp_match_window = 'order:btt'
let g:ctrlp_max_height = 60
let g:ctrlp_max_depth = 40
let g:ctrlp_max_files = 10000

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

"@ale
let g:ale_fix_on_save = 1
let g:ale_linters = {
	\ 'go': ['gopls'],
	\ 'python': ['pyls'],
  \ 'html': []
	\}
let g:ale_pattern_options = {
\ '\.\(test\|spec\)\.js$': {'ale_linters': [], 'ale_fixers': []}
\}
let g:ale_deno_executable = ''
nnoremap <silent> ,e :ALENext<CR>

"@FastFold
let g:fastfold_savehook = 0
" =============================================================================
" }}}

"@ For ruby
autocmd rc FileType ruby setlocal iskeyword+=?

""filetype setting
autocmd rc BufNewFile,BufRead *.thor      setf ruby
autocmd rc BufNewFile,BufRead *.erb       setf html.eruby

"set default filetype markdown
autocmd rc VimEnter,BufNewFile,BufRead * if &ft == '' | set ft=markdown | endif
autocmd rc VimEnter,BufNewFile,BufRead * if &ft == 'vue' | syntax sync fromstart | endif
autocmd rc VimEnter,BufNewFile,BufRead * if &ft == 'typescriptreact' | set ft=typescript.tsx | endif

"filetype indent
filetype plugin indent on

autocmd rc FileType sh         setlocal sw=2 sts=2 ts=2 et
autocmd rc FileType c          setlocal sw=4 sts=4 ts=4 et
autocmd rc FileType cpp        setlocal sw=4 sts=4 ts=4 et
autocmd rc FileType css        setlocal sw=2 sts=2 ts=2 et
autocmd rc FileType diff       setlocal sw=4 sts=4 ts=4 noet
autocmd rc FileType go         setlocal sw=4 sts=4 ts=4 noet
autocmd rc FileType html       setlocal sw=2 sts=2 ts=2 et
autocmd rc FileType javascript setlocal sw=2 sts=2 ts=2 et
autocmd rc FileType perl       setlocal sw=4 sts=4 ts=4 et
autocmd rc FileType php        setlocal sw=4 sts=4 ts=4 et
autocmd rc FileType python     setlocal sw=4 sts=4 ts=4 et
autocmd rc FileType ruby       setlocal sw=2 sts=2 ts=2 et
autocmd rc FileType haml       setlocal sw=2 sts=2 ts=2 et
autocmd rc FileType eruby      setlocal sw=2 sts=2 ts=2 et
autocmd rc FileType sql        setlocal sw=4 sts=4 ts=4 et
autocmd rc FileType vim        setlocal sw=2 sts=2 ts=2 et
autocmd rc FileType xml        setlocal sw=4 sts=4 ts=4 noet
autocmd rc FileType yaml       setlocal sw=2 sts=2 ts=2 et
autocmd rc FileType zsh        setlocal sw=2 sts=2 ts=2 et

" syntax highlight
syntax on

" colorscheme setting
silent! colorscheme iceberg
