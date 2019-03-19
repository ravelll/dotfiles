filetype off

augroup rc
  autocmd!
augroup END

" ======== DISPLAY INFOMATION ========
" always show statusline
set laststatus=2

" show no line number
set nonumber

" no putting message
set noshowmode

" Use twice the width of ASCII characters
set ambiwidth=double

" not be redrawn while executing macros, registers and other commands that have not been typed
" and postpones updating the window title
set lazyredraw

" command complement
set wildmode=list,full

" fileencoding usage (left is prior right)
set fileencodings=utf-8
scriptencoding utf-8

" show current line
nnoremap <silent> ,ul :set cursorline<CR>
nnoremap <silent> ,uL :set nocursorline<CR>

" use init dir same as a file opening for selecting file
set browsedir=buffer
" ====================================

" =========== TAB, SPACE =============
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
" ====================================

" ============ SEARCHING ==============
" search with highlighting
set hlsearch

" stop highlighting
nnoremap <C-[><C-[> :nohlsearch<CR>

" use c indent algorithm
set cindent
set breakindent

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
nnoremap j gj
nnoremap k gk

nnoremap H h
vnoremap H h

inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap <% <%  %><Left><Left><Left>
inoremap <%= <%=  %><Left><Left><Left>

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
nnoremap <silent> cc :let @+ = remove(split(expand("%"), "/"), -1)<CR>
nnoremap <silent> CC :let @+ = expand("%:p")<CR>
" ===============================

" ============ OTHERS =============
nnoremap ,f :set filetype=

" No beep or notify visually
set visualbell t_vb=
" =================================
"}}}

" {{{
" ================== PLUGIN SETTINGS ==================
" leader
let maplocalleader=','

" use \ as , alternative
noremap \ ,

"@dein
if &compatible
  set nocompatible
endif

set runtimepath+=$HOME/.vim/repos/github.com/Shougo/dein.vim

if dein#load_state($HOME.'/.vim')
  call dein#begin($HOME.'/.vim')

  "## Shougo-ware
  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/vimproc', { 'build': 'make' })
  call dein#add('Shougo/deoplete.nvim')
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
  call dein#add('terryma/vim-multiple-cursors.git')
  call dein#add('mattn/webapi-vim')
  call dein#add('tyru/open-browser.vim')
  call dein#add('kana/vim-metarw')
  call dein#add('ivalkeen/vim-ctrlp-tjump')
  call dein#add('haya14busa/vim-edgemotion')
  "### backend utility
  call dein#add('itchyny/vim-parenmatch')
  call dein#add('Konfekt/FastFold')
  call dein#add('prabirshrestha/async.vim')
  call dein#add('prabirshrestha/vim-lsp')
  " call dein#add('mattn/benchvimrc-vim')
  call dein#add('osyo-manga/vim-over')
  call dein#add('FelikZ/ctrlp-py-matcher')
  "### git
  call dein#add('tpope/vim-fugitive')
  "## search and open
  call dein#add('szw/vim-tags')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('tpope/vim-abolish')
  "### coding support
  call dein#add('tmhedberg/matchit')
  call dein#add('w0rp/ale')
  call dein#add('honza/vim-snippets')
  call dein#add('tpope/vim-endwise')
  call dein#add('tpope/vim-repeat')
  "### treat specific type file
  call dein#add('elzr/vim-json')
  call dein#add('plasticboy/vim-markdown')
  call dein#add('kana/vim-textobj-user')
  call dein#add('majutsushi/tagbar')
  call dein#add('junegunn/vim-easy-align')
  "### Ruby
  call dein#add('slim-template/vim-slim')
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
  call dein#add('maxmellon/vim-jsx-pretty')
  "### TypeScript
  call dein#add('leafgarland/typescript-vim')
  call dein#add('Quramy/tsuquyomi')
  "### SQL
  call dein#add('vim-scripts/sql.vim--Stinson')
  call dein#add('vim-scripts/SQLComplete.vim')
  "### toml
  call dein#add('cespare/vim-toml')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" ================= RESPECTIVE PLUGIN SETTING =================
"@deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#var('omni', 'input_patterns', {
  \ 'ruby': ['[^. *\t]\.\w*', '[a-zA-Z_]\w*::'],
  \})
call deoplete#custom#option('yarp', v:true)

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
    autocmd FileType python,go nmap gd <plug>(lsp-definition)
  augroup END
endif
" if executable('solargraph')
"   augroup LspRuby
"     au!
"     autocmd User lsp_setup call lsp#register_server({
"         \ 'name': 'solargraph',
"         \ 'cmd': {server_info->['solargraph', 'stdio']},
"         \ 'whitelist': ['ruby'],
"         \ })
"     autocmd FileType ruby setlocal omnifunc=lsp#complete
"   augroup END
" endif

let g:lsp_async_completion = 0

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
let g:closetag_filenames = "*.html*,*.js,*.jsx,*.vue"

"@parenmatch
let g:loaded_matchparen = 1

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
nmap <LocalLeader><Space> ysiw<Space><Space>
nmap <LocalLeader><LocalLeader>* ysiw*wysiw*

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
let g:neosnippet#snippets_directory='~/.vim/repos/github.com/Shougo/vim-snippets/snippets'

"@markdown
set conceallevel=2
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_folding_disabled = 1
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

nnoremap <silent> <LocalLeader>g :GoImports 
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
let g:ctrlp_user_command = 'files -A -i "^(\\.git|\\.hg|\\.svn|_darcs|\\.bzr|vendor|node_modules|tmp|\\.tmp)$" %s'
let g:ctrlp_match_func = {'match': 'pymatcher#PyMatch'}
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
      \ 'php': ['phpmd', 'php', 'phpcs'],
      \ 'html': []
      \}
let g:ale_pattern_options = {
\ '\.\(test\|spec\)\.js$': {'ale_linters': [], 'ale_fixers': []}
\}

"@FastFold
let g:fastfold_savehook = 0
" =============================================================================
" }}}

"filetype setting
autocmd rc BufNewFile,BufRead *.thor      setf ruby
autocmd rc BufNewFile,BufRead *.erb       setf html.eruby

"set default filetype markdown
autocmd rc VimEnter,BufNewFile,BufRead * if &ft == '' | set ft=markdown | endif
autocmd rc VimEnter,BufNewFile,BufRead * if &ft == 'vue' | syntax sync fromstart | endif

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
