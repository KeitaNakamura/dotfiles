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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
Plug 'preservim/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'

" view
Plug 'KeitaNakamura/neodark.vim'
Plug 'KeitaNakamura/aurora.vim'
Plug 'itchyny/lightline.vim'

call plug#end()

" Global setting {{{1

" color
set termguicolors
" let g:aurora#smart_cursor=1
colorscheme aurora
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
set maxmempattern=10000 " fix E363: pattern uses more memory than 'maxmempattern', '1000' by default
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

"------+
" toml |
"------+
function! s:toml()
  " for TOMLX.jl
  syntax match TOMLJuliaMacro "@jl"
  syntax match TOMLJuliaMacro "@julia"
  hi link TOMLJuliaMacro Macro
endfunction

augroup vimrc-toml
  autocmd!
  autocmd FileType toml call s:toml()
augroup END

" Setting for each plugin {{{1

"---------------+
" nerdcommenter |
"---------------+
let g:NERDSpaceDelims = 1
let g:NERDCustomDelimiters = {'julia': { 'left': '#', 'leftAlt': '#=', 'rightAlt': '=#' }}

"--------------+
" vim-template |
"--------------+
let g:templates_no_builtin_templates = 1
let g:templates_directory = '~/.vim/templates'

"-----------+
" julia-vim |
"-----------+
let g:latex_to_unicode_file_types = ".*"

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

"----------+
" nerdtree |
"----------+
nnoremap <silent> <C-e> :NERDTreeToggle<CR>:call lightline#update()<CR>
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
      \ 'colorscheme': 'aurora',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'filename' ], ['ctrlpmark'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \   'fileencoding': 'LightlineFileencoding',
      \   'mode': 'LightlineMode',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }
function! LightlineModified()
  return &ft ==# 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction
function! LightlineReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction
function! LightlineFilename()
  let fname = expand('%:t')
  return fname ==# 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
        \ fname =~# '^NERD_tree' ? '' :
        \ (LightlineReadonly() !=# '' ? LightlineReadonly() . ' ' : '') .
        \ (fname !=# '' ? fname : '[No Name]') .
        \ (LightlineModified() !=# '' ? ' ' . LightlineModified() : '')
endfunction
function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction
function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction
function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction
function! LightlineMode()
  let fname = expand('%:t')
  return fname ==# 'ControlP' ? 'CtrlP' :
        \ fname =~# 'NERD_tree' ? 'NERDTree' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction
function! CtrlPMark()
  if expand('%:t') ==# 'ControlP' && has_key(g:lightline, 'ctrlp_item')
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
