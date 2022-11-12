"        _                    
" __   _(_)_ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
"   \_/ |_|_| |_| |_|_|  \___|
"
"

let g:user  = "Keita Nakamura"
let g:email = "keita.nakamura.1109@gmail.com"

" Installed plugins {{{1
call plug#begin('~/.vim/plugged')
let g:plug_shallow = 0

Plug 'vim-jp/vimdoc-ja'
set helplang=ja,en

" general
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'henrik/vim-indexed-search'
Plug 'aperezdc/vim-template'

" formatting
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat' " for vim-surround
Plug 'godlygeek/tabular'

" languages
Plug 'JuliaLang/julia-vim'
Plug 'preservim/vim-markdown'
Plug 'cespare/vim-toml', { 'branch': 'main' }
Plug 'lervag/vimtex', {'for': 'tex'}

" navigation
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim' " for ag in 'ctrlp'

" view
Plug 'KeitaNakamura/neodark.vim'
Plug 'itchyny/lightline.vim'

call plug#end()

" Global setting {{{1

" color
set termguicolors
colorscheme neodark
set cursorline " highlight current line

" to get true color in vim+tmux
" see https://github.com/vim/vim/issues/993#issuecomment-255651605
" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" search
set hlsearch " highlight for search
nnoremap <silent> <ESC><ESC> :nohlsearch<CR>
set ignorecase
set smartcase
set incsearch

" view
set guicursor=n-v-c-i:block-Cursor
set pumheight=10 " number of lists of completion
set number " line number
set laststatus=2
set nowrap
set noshowmode

" move/map
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
nnoremap Y y$
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
nnoremap <silent> <Esc><Esc> :nohl<CR>

" misc
set shell=/bin/bash
set foldmethod=marker
set vb t_vb= " disable beep sound
set tabstop=4 " number of space for tab
set softtabstop=4 " for backspace
set shiftwidth=4 " width of auto indent
set expandtab
set backspace=indent,eol,start
set encoding=utf-8
set fileencodings=utf-8,sjis
set spelllang=en,cjk
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" tex
let g:tex_conceal="adgmb"
let g:tex_flavor = 'latex'

" yank to clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard
endif

" Local setting {{{1

"-----------+
" vimscript |
"-----------+
function! s:vimscript()
  setlocal tabstop=2 " number of space for tab
  setlocal shiftwidth=2 " width of auto indent
  setlocal expandtab
endfunction

augroup vimrc-vimscript
  autocmd!
  autocmd FileType vim call s:vimscript()
augroup END

"-------+
" shell |
"-------+
function! s:sh()
  setlocal tabstop=2 " number of space for tab
  setlocal shiftwidth=2 " width of auto indent
  setlocal foldmethod=indent
  setlocal expandtab
endfunction

augroup vimrc-sh
  autocmd!
  autocmd FileType sh call s:sh()
  autocmd FileType zsh call s:sh()
augroup END

"-----+
" tex |
"-----+
function! s:tex()
  setlocal nocursorline
  setlocal wrap
  setlocal linebreak
  setlocal expandtab
  setlocal spell
  setlocal foldmethod=manual
  setlocal tabstop=2
  setlocal shiftwidth=2
  setlocal colorcolumn=
  " setlocal autoindent
  setlocal conceallevel=2

  setlocal noautoindent
  setlocal nosmartindent
  setlocal indentexpr=
endfunction

augroup vimrc-tex
  autocmd!
  autocmd FileType tex call s:tex()
augroup END

"-------+
" julia |
"-------+
function! s:julia()
  setlocal expandtab
  setlocal foldmethod=indent
  hi link juliaFunctionCall Function
endfunction

augroup vimrc-julia
  autocmd!
  autocmd FileType julia call s:julia()
augroup END

"----------+
" markdown |
"----------+
function! s:markdown()
  setlocal spell
  setlocal wrap
  setlocal linebreak
  setlocal colorcolumn=
  setlocal foldlevel=2
  setlocal conceallevel=0
endfunction

augroup vimrc-markdown
  autocmd!
  autocmd FileType markdown call s:markdown()
  autocmd FileType pandoc call s:markdown()
augroup END

" Setting for each plugin {{{1

"---------------+
" nerdcommenter |
"---------------+
let g:NERDSpaceDelims = 1
let g:NERDCustomDelimiters = {'julia': { 'left': '#', 'leftAlt': '#=', 'rightAlt': '=#' }}

"----------+
" deoplete |
"----------+
let g:deoplete#enable_at_startup = 1

"--------------+
" vim-template |
"--------------+
let g:templates_no_builtin_templates = 1
let g:templates_directory = '~/.vim/templates'

"--------------+
" vim-markdown |
"--------------+
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_math = 1

"--------+
" vimtex |
"--------+
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_manual = 1 " improve performance
let g:vimtex_indent_enabled = 0
" for deoplete
call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
      \})

"----------+
" nerdtree |
"----------+
nnoremap <silent> <C-e> :NERDTreeToggle<CR>
let NERDTreeMapChangeRoot='l'
let NERDTreeMapUpdir='h'
let NERDTreeCascadeSingleChildDir=0
let NERDTreeCascadeOpenSingleChildDir=0
let NERDTreeChDirMode=2
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

"-------+
" CtrlP |
"-------+
if executable('ag')
  let g:ctrlp_use_caching = 0
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup -g ""'
endif

"-----------+
" lightline |
"-----------+
let g:lightline = {
\ 'enable': {'statusline': 1, 'tabline': 0},
\ 'colorscheme': 'neodark',
\ 'mode_map': { 'c': 'NORMAL' },
\ 'active': {
\   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
\ },
\ 'component_function': {
\   'modified': 'LightLineModified',
\   'readonly': 'LightLineReadonly',
\   'fugitive': 'LightLineFugitive',
\   'filename': 'LightLineFilename',
\   'fileformat': 'LightLineFileformat',
\   'filetype': 'LightLineFiletype',
\   'fileencoding': 'LightLineFileencoding',
\   'mode': 'LightLineMode',
\ },
\   'component': {
\     'readonly': '%{&readonly?"⭤":""}',
\   },
\ }

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

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
