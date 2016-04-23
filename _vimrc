"************************************************
let g:user  = "K.Nakamura"
let g:email = "nakamura-keita-kn@ynu.jp"
"************************************************

" Installed plugins {{{1
call plug#begin('~/.vim/plugged')

Plug 'vim-jp/vimdoc-ja'
set helplang=ja,en

Plug 'jiangmiao/auto-pairs' " auto close brackets
Plug 'rking/ag.vim' " for ag in 'ctrlp'
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
Plug 'aperezdc/vim-template'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
" Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'kannokanno/previm',       {'for': 'markdown'}
Plug 'tyru/open-browser.vim',   {'for': 'markdown'}
Plug 'scrooloose/syntastic'
Plug 'JuliaLang/julia-vim'
Plug 'Shougo/neoinclude.vim', {'for': ['h', 'cpp']}
Plug 'justmao945/vim-clang', {'for': ['h', 'cpp']}
Plug 'lervag/vimtex',        {'for': 'tex'}
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'Shougo/vimproc.vim',   {'do': 'make'}
" Plug 'Shougo/vimshell.vim'

" File explorer {{{2
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'Shougo/unite.vim'
Plug 'ujihisa/unite-colorscheme'
" Plug 'Shougo/vimfiler.vim'
Plug 'kien/ctrlp.vim'
" }}}
" Status line {{{2
Plug 'itchyny/lightline.vim'
" Plug 'cocopon/lightline-hybrid.vim'
" Plug 'vim-airline/vim-airline'
" }}}
" Auto completion {{{2
Plug 'Shougo/neocomplete.vim'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
" }}}
" Color scheme (:Unite colorscheme -auto-preview) {{{2
Plug 'altercation/vim-colors-solarized' " solarized
Plug 'croaker/mustang-vim'              " mustang
Plug 'jeffreyiacono/vim-colors-wombat'  " wombat
Plug 'nanotech/jellybeans.vim'          " jellybeans
Plug 'vim-scripts/Lucius'               " lucius
Plug 'vim-scripts/Zenburn'              " zenburn
Plug 'mrkn/mrkn256.vim'                 " mrkn256
Plug 'jpo/vim-railscasts-theme'         " railscasts
Plug 'therubymug/vim-pyte'              " pyte
Plug 'tomasr/molokai'                   " molokai
Plug 'chriskempson/vim-tomorrow-theme'  " tomorrow night
Plug 'vim-scripts/twilight'             " twilight
Plug 'w0ng/vim-hybrid'                  " hybrid
Plug 'freeo/vim-kalisi'                 " kalisi
Plug 'morhetz/gruvbox'                  " gruvbox
Plug 'toupeira/vim-desertink'           " desertink
Plug 'sjl/badwolf'                      " badwolf
Plug 'itchyny/landscape.vim'            " landscape
Plug 'joshdick/onedark.vim'             " onedark in atom
Plug 'gosukiwi/vim-atom-dark'           " atom-dark
" }}}

call plug#end()

" Global setting {{{1
" Color {{{2
colorscheme onedark
set background=dark
syntax on
set cursorline " highlight current line
hi clear CursorLine
set colorcolumn=80
" }}}
" Search {{{2
set hlsearch " highlight for search
nnoremap <silent> <ESC><ESC> :nohlsearch<CR>
set ignorecase
set smartcase
set incsearch
" }}}
" View {{{2
set pumheight=10 " number of lists of completion
set number " line number
set laststatus=2
set nowrap
set noshowmode
" disable left and right sides scroll bar
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
" shape of cursor in CUI
if exists('$TMUX')
	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" }}}
" Movement {{{2
set whichwrap=b,s,h,l,<,>,[,]
set mouse=a " enable mouse
set scrolloff=5
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
" }}}
" Others {{{2
set shell=/bin/bash
set foldmethod=marker
set vb t_vb= " disable beep sound
set tabstop=4 " number of space for tab
set shiftwidth=4 " width of auto indent
set backspace=indent,eol,start
set encoding=utf-8
set fileencodings=utf-8,sjis
set spelllang=en,cjk
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
let g:tex_conceal = ''
let g:tex_flavor = 'latex'
" }}}

" Local setting {{{1
" c++ {{{2
function! s:cpp()
	" setlocal path+=/usr/local/include/eigen3
    setlocal expandtab
    setlocal autoindent
    setlocal smartindent
    setlocal cinoptions+=:0,g0
	" setlocal foldmethod=syntax
	" setlocal foldcolumn=1
    " nnoremap <F5> :make build_run<cr>
    " nnoremap <F6> :make run<cr>
    nnoremap <buffer> <F7> :make<cr>
endfunction

augroup vimrc-cpp
    autocmd!
    autocmd FileType cpp call s:cpp()
augroup END

" tex {{{2
function! s:tex()
	setlocal nocursorline
	setlocal wrap
	setlocal linebreak
    setlocal expandtab
    setlocal spell
	" setlocal foldmethod=manual
	setlocal tabstop=2
	setlocal shiftwidth=2
endfunction

augroup vimrc-tex
    autocmd!
    autocmd FileType tex call s:tex()
augroup END

" python {{{2
function! s:python()
    setlocal autoindent
    " setlocal smartindent
	setlocal indentkeys+=0#
endfunction

augroup vimrc-phthon
    autocmd!
    autocmd FileType python call s:python()
augroup END

" julia {{{2
function! s:julia()
    setlocal expandtab
	setlocal foldmethod=indent
endfunction

augroup vimrc-julia
    autocmd!
    autocmd FileType julia call s:julia()
	" autocmd FileType julia nnoremap <buffer> <Leader>r :exec '!clear; julia' shellescape(@%, 1)<cr>
augroup END

" fortran {{{2
function! s:fortran()
	let fortran_do_enddo=1
	let fortran_free_source=1
	let fortran_fold=1
	filetype plugin indent on
	setlocal smarttab
    setlocal expandtab
    setlocal smartindent
    setlocal autoindent
	setlocal tabstop=2
	setlocal shiftwidth=2
endfunction

augroup vimrc-fortran
    autocmd!
    autocmd FileType fortran call s:fortran()
augroup END
" markdown {{{2
function! s:markdown()
	setlocal wrap
endfunction

augroup vimrc-markdown
    autocmd!
    autocmd FileType markdown call s:markdown()
augroup END
" Setting for each plugin {{{1
" caw (comment out plugin) {{{2
nmap <Leader>c <Plug>(caw:hatpos:toggle)
vmap <Leader>c <Plug>(caw:hatpos:toggle)

" nerdcommenter {{{2
let g:NERDSpaceDelims = 1
let g:NERDCustomDelimiters = {'julia': { 'left': '#', 'leftAlt': '#=', 'rightAlt': '=#' }}

" indentLine {{{2
let g:indentLine_color_term = 239

" vim-template {{{2
let g:templates_no_builtin_templates = 1
let g:templates_directory = '~/.vim/template'

" syntastic {{{2
let g:syntastic_quiet_messages = { "level": "warnings" }
let g:syntastic_error_symbol = '✗✗'

" tagbar {{{2
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_julia = {
    \ 'ctagstype' : 'julia',
    \ 'kinds'     : ['a:abstract', 'i:immutable', 't:type', 'f:function', 'm:macro']
    \ }
let g:tagbar_type_tex = {
	\ 'ctagstype' : 'latex',
	\ 'kinds'     : [
		\ 's:sections',
		\ 'g:graphics:0:0',
		\ 'l:labels',
		\ 'r:refs:1:0',
		\ 'p:pagerefs:1:0'
	\ ],
	\ 'sort'    : 0,
\ }
let g:tagbar_iconchars = ['▸', '▾']
" for onedark color scheme with tagbar
highlight TagbarSignature term=bold ctermfg=59 gui=italic guifg=#5C6670

" vim-markdown {{{2
let g:vim_markdown_folding_style_pythonic = 1

" previm {{{2
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

" Julia {{{2
noremap <expr> <F7> LaTeXtoUnicode#Toggle()
inoremap <expr> <F7> LaTeXtoUnicode#Toggle()

" vimtex {{{2
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_manual = 1 " improve performance
let g:vimtex_latexmk_continuous = 1
let g:vimtex_latexmk_background = 1
let g:vimtex_latexmk_options = '-pdfdvi'
let g:vimtex_quickfix_mode = 0
let g:vimtex_indent_enabled = 0
let g:vimtex_latexmk_build_dir = ''
let g:vimtex_view_general_viewer = '/usr/local/bin/displayline'
let g:vimtex_view_general_options = '@line @pdf @tex'
" for NeoComplete {{{3
if !exists('g:neocomplete#sources#omni#input_patterns')
let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.tex =
	\ '\v\\%('
	\ . '\a*cite\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
	\ . '|\a*ref%(\s*\{[^}]*|range\s*\{[^,}]*%(}\{)?)'
	\ . '|hyperref\s*\[[^]]*'
	\ . '|includegraphics\*?%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
	\ . '|%(include%(only)?|input)\s*\{[^}]*'
	\ . ')'
" }}}
" for YouCompleteMe {{{3
if !exists('g:ycm_semantic_triggers')
let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = [
	\ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
	\ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
	\ 're!\\hyperref\[[^]]*',
	\ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
	\ 're!\\(include(only)?|input){[^}]*'
	\ ]
" }}}

" jedi-vim {{{2
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
" for NeoComplete {{{3
if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
" }}}

" vim-clang {{{2
" disable auto completion for vim-clang
let g:clang_auto = 0
let g:clang_check_syntax_auto = 1
" default 'longest' can not work with neocomplete
" let g:clang_c_completeopt = 'menuone,preview'
" let g:clang_cpp_completeopt = 'menuone,preview'
let g:clang_c_completeopt = 'menuone'
let g:clang_cpp_completeopt = 'menuone'

" use neocomplete
" input patterns
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

" for c and c++
let g:neocomplete#force_omni_input_patterns.c =
	  \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.cpp =
	  \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'

" NERD tree {{{2
nnoremap <silent> <C-e> :NERDTreeToggle<CR>
augroup nerdtree-bugfix
    autocmd!
augroup END
autocmd nerdtree-bugfix filetype nerdtree nmap <buffer> x po

" vimfiler {{{2
" noremap <C-e> :VimFilerBufferDir -split -simple -toggle <ENTER>
" noremap <C-e> :VimFilerBufferDir -simple -toggle <ENTER>
" noremap <C-e> :VimFiler -split -simple -winwidth=35 -no-quit -toggle <ENTER>
" noremap <C-e> :VimFiler -split -simple -winwidth=35 -no-quit<ENTER>
" noremap <C-e> :VimFilerExplorer -find -toggle<ENTER>

" CtrlP {{{2
if executable('ag')
  let g:ctrlp_use_caching = 0
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup -g ""'
endif

" Lightline {{{2
let g:lightline = {
\   'colorscheme': 'wombat',
\   'mode_map': { 'c': 'NORMAL' },
\   'active': {
\     'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
\   },
\   'component_function': {
\     'modified': 'LightLineModified',
\     'readonly': 'LightLineReadonly',
\     'fugitive': 'LightLineFugitive',
\     'filename': 'LightLineFilename',
\     'fileformat': 'LightLineFileformat',
\     'filetype': 'LightLineFiletype',
\     'fileencoding': 'LightLineFileencoding',
\     'mode': 'LightLineMode',
\   },
\     'component': {
\     	'readonly': '%{&readonly?"⭤":""}',
\     },
\   }

function! LightLineModified()
  return &ft =~ 'help\|vimfiler' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler' && &readonly ? '⭤' : ''
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
		\ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ 'NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = '⭠ '  " edit here for cool mark
      let _ = fugitive#head()
      return strlen(_) ? mark._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return fname == 'ControlP' ? 'CtrlP' :
		\ fname == '__Tagbar__' ? 'Tagbar' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

" augroup AutoSyntastic
"   autocmd!
"   autocmd BufWritePost *.c,*.cpp call s:syntastic()
" augroup END
" function! s:syntastic()
"   SyntasticCheck
"   call lightline#update()
" endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

" NeoComplete {{{2
let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#enable_ignore_case = 1
" let g:neocomplete#enable_smart_case = 1
" let g:neocomplete#enable_enable_camel_case_completion = 0
" if !exists('g:neocomplete#keyword_patterns')
" 	let g:neocomplete#keyword_patterns = {}
" endif
" let g:neocomplete#keyword_patterns._ = '\h\w*'
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

" neoinclude {{{2
if !exists('g:neoinclude#exts')
  let g:neoinclude#exts = {}
endif
let g:neoinclude#exts.cpp = ['', 'h', 'hpp', 'hxx']
" let g:neoinclude#_paths = '/usr/local/include/'

" YouCompleteMe {{{2
set completeopt=menuone
let g:ycm_global_ycm_extra_conf = '~/dotfiles/_ycm_extra_conf.py'
" let g:ycm_filetype_specific_completion_to_disable = {'python': 1}
" }}}
