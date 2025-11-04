augroup rc
  autocmd!
augroup END
let g:mapleader = ','

" ===== DISPLAYING ===== {{{
" always show statusline
set laststatus=2

" show no line number
set nonumber

" no putting message
set noshowmode
set shortmess+=c "surpress messages like 'match 1 of 6'

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

" show current line
nnoremap <silent> ,ul :set cursorline<CR>
nnoremap <silent> ,uL :set nocursorline<CR>

" use init dir same as a file opening for selecting file
set browsedir=buffer
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

" set runtimepath+=$HOME/.vim/repos/github.com/Shougo/dein.vim
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

call dein#begin($HOME.'/.cache/dein')
call dein#add($HOME.'/.cache/dein/repos/github.com/Shougo/dein.vim')

"## Shougo-ware
call dein#add('neoclide/coc.nvim', { 'merged': 0, 'rev': 'release' })
"### visual effect
call dein#add('itchyny/lightline.vim')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('cocopon/iceberg.vim')
call dein#add('simeji/winresizer')
"## extend working
call dein#add('vim-scripts/surround.vim')
call dein#add('scrooloose/nerdtree', {'on_cmd': 'NERDTreeToggle'})
call dein#add('tomtom/tcomment_vim')
call dein#add('thinca/vim-quickrun', {'on_cmd': 'QuickRun'})
" call dein#add('terryma/vim-multiple-cursors')
call dein#add('tyru/open-browser.vim')
call dein#add('tyru/open-browser-github.vim')
call dein#add('kana/vim-metarw')
call dein#add('ivalkeen/vim-ctrlp-tjump')
call dein#add('AndrewRadev/linediff.vim')
call dein#add('rhysd/vim-healthcheck')
call dein#add('github/copilot.vim')
call dein#add('junegunn/fzf', #{ build: { -> fzf#install() } })
call dein#add('junegunn/fzf.vim')
call dein#add('kana/vim-textobj-user')
call dein#add('kana/vim-textobj-indent')
call dein#add('haya14busa/vim-edgemotion')
"### backend utility
call dein#add('Konfekt/FastFold')
call dein#add('osyo-manga/vim-over')
"### git
call dein#add('tpope/vim-fugitive')
"## search and open
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('mattn/ctrlp-matchfuzzy')
"### coding support
call dein#add('dense-analysis/ale')
call dein#add('tpope/vim-endwise')
"### treat specific type file
call dein#add('elzr/vim-json')
call dein#add('preservim/vim-markdown')
call dein#add('junegunn/vim-easy-align')
"### Ruby
call dein#add('slim-template/vim-slim')
call dein#add('pocke/rbs.vim')
"### python
call dein#add('Vimjas/vim-python-pep8-indent')
"### Scala
call dein#add('derekwyatt/vim-scala')
"### Rust
call dein#add('rust-lang/rust.vim')
"### HTML
call dein#add('othree/html5.vim')
call dein#add('alvan/vim-closetag')
"### Go
call dein#add('fatih/vim-go')
"### JavaScript
call dein#add('pangloss/vim-javascript')
call dein#add('jelera/vim-javascript-syntax')
call dein#add('yuezk/vim-js')
call dein#add('maxmellon/vim-jsx-pretty')
"### TypeScript
call dein#add('leafgarland/typescript-vim')
call dein#add('pantharshit00/vim-prisma')
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
"@Coc
set updatetime=300
set signcolumn=yes

function! s:CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ <SID>CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <c-@> coc#refresh()
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gn <Plug>(coc-rename)
nmap <silent> gh <Plug>(coc-hover)
nnoremap <silent><nowait><expr> <C-J> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-F>"
nnoremap <silent><nowait><expr> <C-K> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-B>"
inoremap <silent><nowait><expr> <C-J> coc#float#has_scroll() ? "\<C-R>=coc#float#scroll(1)\<CR>" : "\<Right>"
inoremap <silent><nowait><expr> <C-K> coc#float#has_scroll() ? "\<C-R>=coc#float#scroll(0)\<CR>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-J> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-F>"
vnoremap <silent><nowait><expr> <C-K> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-B>"

"@autofmt
set formatexpr=autofmt#japanese#formatexpr()
let autofmt_allow_over_tw=1
set formatoptions+=mM
set smartindent

"@lightline
let g:lightline = {
  \ 'colorscheme': 'one',
  \ 'active': {
  \   'left': [ ['mode', 'paste'],
  \             ['branch', 'readonly', 'filename', 'modified'] ]
  \ },
  \ 'component_function': {
  \   'branch': 'FugitiveHead'
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

"@vim-json
let g:vim_json_syntax_conceal = 0

"@vim-markdown
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_new_list_item_indent = 2

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
nnoremap <Leader>q :QuickRun<CR>
vnoremap <Leader>q :QuickRun<CR>

"@open-browser.vim
nnoremap <Leader>b <Plug>(openbrowser-open)

"@open-browser-github.vim
nnoremap <Leader>o :OpenGithubFile<CR>
vnoremap <Leader>o :OpenGithubFile<CR>

"@vim-ctrlp-tjump
let g:ctrlp_tjump_only_silent = 1

"@tag jump
nnoremap <c-]> :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>

"@NERDTree
let g:NERDTreeWinSize=30
let g:NERDTreeShowHidden=1
nnoremap <silent> <Leader>nt :<C-u>NERDTreeToggle<CR>
nnoremap <silent> <Leader>nf :<C-u>NERDTreeFind<CR>
" close at once with vim
autocmd rc bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"@fzf.vim
nnoremap <silent> <Leader>g :Rg<Space>
nnoremap <silent> <Leader>G :RG<Space>

"@operator-search
nnoremap <Space>s <Plug>(operator-search)
nnoremap <Space>/ <Plug>(operator-search)if

"@vim-edgemotion
map <C-j> <Plug>(edgemotion-j)
map <C-k> <Plug>(edgemotion-k)

"@VimOver
nnoremap <silent> <Leader>s :OverCommandLine<CR>%s/
vnoremap <silent> <Leader>s :OverCommandLine<CR>s/

"@golang setting {
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_bin_path = $HOME.'/dev/bin/'
"}

"@CtrlP
nnoremap <silent> <c-p><c-p> :CtrlP<CR>
nnoremap <silent> <c-p><c-d> :CtrlPBookmarkDir<CR>
nnoremap <silent> <c-p><c-l> :CtrlPLine<CR>
nnoremap <silent> <c-p><c-u> :CtrlPMRU<CR>
nnoremap <silent> <c-p><c-t> :CtrlPTag<CR>

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['Dockerfile', 'kubernetes', '*.gemspec', 'tsconfig.*', '.git', 'README.md', 'pyproject.toml']
let g:ctrlp_match_window = 'order:btt'
let g:ctrlp_max_height = 60
let g:ctrlp_max_depth = 40
let g:ctrlp_max_files = 500000
let g:ctrlp_match_func = {'match': 'ctrlp_matchfuzzy#matcher'}
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

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
  \ 'html': [],
  \ 'markdown': [],
  \ 'go': ['revive'],
	\}
" let g:ale_python_auto_poetry = 1
" let g:ale_python_auto_virtualenv = 1
" let g:ale_python_ruff_auto_poetry = 1
" let g:ale_python_ruff_change_directory = 1
" let g:ale_pattern_options = {
" \ '\.\(test\|spec\)\.js$': {'ale_linters': [], 'ale_fixers': []}
" \}
let g:ale_deno_executable = ''
nnoremap <silent> <Leader>e :ALENext<CR>

"https://www.drumm.sh/blog/2021/05/29/vim-python-dev-environment/
" autocmd rc VimEnter,BufNewFile,BufRead * if &ft == 'python' | let g:ale_disable_lsp = 1 | endif
autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'pyproject.toml', 'pyrightconfig.json']

"@FastFold
let g:fastfold_savehook = 0
" =============================================================================
" }}}

"@ For ruby
autocmd rc FileType ruby setlocal iskeyword+=?

"@ For go
autocmd rc VimEnter,BufNewFile,BufRead * if &ft == 'go' | nnoremap <silent> ,gi :GoInfo<CR> | nnoremap <silent> FF :GoFmt<CR> | set noignorecase | endif

""filetype setting
" autocmd rc BufNewFile,BufRead *.thor      setf ruby
" autocmd rc BufNewFile,BufRead *.erb       setf html.eruby

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
autocmd rc FileType scala      setlocal sw=2 sts=2 ts=2 et
autocmd rc FileType haml       setlocal sw=2 sts=2 ts=2 et
autocmd rc FileType eruby      setlocal sw=2 sts=2 ts=2 et
autocmd rc FileType sql        setlocal sw=4 sts=4 ts=4 et
autocmd rc FileType vim        setlocal sw=2 sts=2 ts=2 et
autocmd rc FileType xml        setlocal sw=4 sts=4 ts=4 noet
autocmd rc FileType yaml       setlocal sw=2 sts=2 ts=2 et
autocmd rc FileType zsh        setlocal sw=2 sts=2 ts=2 et
autocmd rc FileType markdown   setlocal sw=2 sts=2 ts=2 et

" syntax highlight
syntax on

" colorscheme setting
set background=dark
silent! colorscheme iceberg
