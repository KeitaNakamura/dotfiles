"*********************************************************************
" File:        .vimrc
" Description: A vim setting file which is compatible with Mac OS X.
" Author:      Keita Nakamura
"*********************************************************************

" SETTING FOR PLUGIN MANAGER 'VUNDLE' {{{1

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add plugin from here {{{

"< Help in Japanese >
Plugin 'vim-jp/vimdoc-ja'

"< File explorer >
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimfiler.vim'
Plugin 'ujihisa/unite-colorscheme'

"< CtrlP >
Plugin 'kien/ctrlp.vim'

"< fugitive >
Plugin 'tpope/vim-fugitive'

"< Auto close brackets >
Plugin 'jiangmiao/auto-pairs'

"< Julia-vim >
Plugin 'JuliaLang/julia-vim'

"< Jedi >
" Plugin 'davidhalter/jedi-vim'

"< Auto complete >
Plugin 'Valloric/YouCompleteMe'
" You need to compile YCM with semantic support for C-family languages:
" cd ~/.vim/bundle/YouCompleteMe
" ./install.py --clang-completer

" Plugin 'justmao945/vim-clang'

"< Syntastic >
" Plugin 'scrooloose/syntastic'

"< Ctags >
Plugin 'soramugi/auto-ctags.vim'

"< Tagbar >
Plugin 'majutsushi/tagbar'

"< Status line >
Plugin 'itchyny/lightline.vim'
" Plugin 'cocopon/lightline-hybrid.vim'
" Plugin 'bling/vim-airline'

"< For using gdb debugger >
" Plugin 'vim-scripts/Conque-GDB'

"< Comment out >
Plugin 'tyru/caw.vim'

"< UltiSnips >
" Plugin 'SirVer/ultisnips'

"< Snippets >
" Plugin 'honza/vim-snippets'

"< Supertab >
" Plugin 'ervandew/supertab'

"< Align >
Plugin 'Align'

"< Tag highlight >
Plugin 'skroll/vim-taghighlight'

"< Indent line >
Plugin 'Yggdroot/indentLine'

"< Ag >
Plugin 'rking/ag.vim'

"< Latex >
Plugin 'lervag/vimtex'

"< Template >
Plugin 'aperezdc/vim-template'

"< Previm >
Plugin 'kannokanno/previm'

"< Color scheme (:Unite colorscheme -auto-preview) >
" Plugin 'altercation/vim-colors-solarized' " solarized
Plugin 'jwhitley/vim-colors-solarized'    " solarized for syntastic
Plugin 'croaker/mustang-vim'              " mustang
Plugin 'jeffreyiacono/vim-colors-wombat'  " wombat
Plugin 'nanotech/jellybeans.vim'          " jellybeans
Plugin 'vim-scripts/Lucius'               " lucius
Plugin 'vim-scripts/Zenburn'              " zenburn
Plugin 'mrkn/mrkn256.vim'                 " mrkn256
Plugin 'jpo/vim-railscasts-theme'         " railscasts
Plugin 'therubymug/vim-pyte'              " pyte
Plugin 'tomasr/molokai'                   " molokai
Plugin 'chriskempson/vim-tomorrow-theme'  " tomorrow night
Plugin 'vim-scripts/twilight'             " twilight
Plugin 'w0ng/vim-hybrid'                  " hybrid

"< Tmux Navigator >
Plugin 'christoomey/vim-tmux-navigator'

"< Tmux Navigator >
" Plugin 'Shougo/vimshell.vim'

" }}}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" SETTING FOR PLUGINS {{{1

" CtrlP {{{2
if executable('ag')
  let g:ctrlp_use_caching = 0
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup -g ""'
endif
" let g:ctrlp_root_markers = ['makefile']
" nnoremap <C-f> :CtrlP <ENTER>
" Prefix: f
" nnoremap f <Nop>
" nnoremap fa :<C-u>CtrlP<Space>
" nnoremap fb :<C-u>CtrlPBuffer<CR>
" nnoremap fd :<C-u>CtrlPDir<CR>
" nnoremap ff :<C-u>CtrlP<CR>
" nnoremap fl :<C-u>CtrlPLine<CR>
" nnoremap fm :<C-u>CtrlPMRUFiles<CR>
" nnoremap fq :<C-u>CtrlPQuickfix<CR>
" nnoremap fs :<C-u>CtrlPMixed<CR>
" nnoremap ft :<C-u>CtrlPTag<CR>
" let g:ctrlp_map = '<Nop>'
" let g:ctrlp_extensions = ['tag', 'quickfix', 'dir', 'line', 'mixed']

" NERD tree {{{2
nnoremap <silent> <C-e> :NERDTreeToggle<CR>
" nnoremap <silent> <Leader>e :NERDTreeToggle<CR>

" vimfiler {{{2
" noremap <C-e> :VimFilerBufferDir -split -simple -toggle <ENTER>
" noremap <C-e> :VimFilerBufferDir -simple -toggle <ENTER>
" noremap <C-e> :VimFiler -split -simple -winwidth=35 -no-quit -toggle <ENTER>
" noremap <C-e> :VimFiler -split -simple -winwidth=35 -no-quit<ENTER>
" noremap <C-e> :VimFilerExplorer -find -toggle<ENTER>

" Jedi {{{2
" let g:jedi#show_call_signatures = 2
" let g:jedi#completions_enabled = 0

" Julia {{{2
" let g:latex_to_unicode_auto = 1

" YouCompleteMe {{{2
set completeopt=menuone
let g:ycm_global_ycm_extra_conf = '~/dotfiles/_ycm_extra_conf.py'
" let g:ycm_filetype_specific_completion_to_disable = {'python': 1}

" vim-clang {{{2
let g:clang_c_options = '-std=gnu11'
let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'

" Syntastic {{{2
" let g:syntastic_python_checkers = ['flake8']

" caw (comment out plugin) {{{2
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)

" indentLine {{{2
let g:indentLine_color_term = 239

" Tagbar {{{2
nmap <F8> :TagbarToggle<CR>

" Lightline {{{2
let g:lightline = {
\   'colorscheme': 'default',
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
" let g:lightline = {
" \   'colorscheme': 'default',
" \   'mode_map': { 'c': 'NORMAL' },
" \   'active': {
" \     'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
" \   },
" \   'component_function': {
" \     'modified': 'LightLineModified',
" \     'readonly': 'LightLineReadonly',
" \     'fugitive': 'LightLineFugitive',
" \     'filename': 'LightLineFilename',
" \     'fileformat': 'LightLineFileformat',
" \     'filetype': 'LightLineFiletype',
" \     'fileencoding': 'LightLineFileencoding',
" \     'mode': 'LightLineMode',
" \   },
" \     'component': {
" \     	'readonly': '%{&readonly?"⭤":""}',
" \     },
" \   'separator': { 'left': '⮀', 'right': '⮂' },
" \   'subseparator': { 'left': '⮁', 'right': '⮃' }
" \   }

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

" vimtex {{{2
let g:vimtex_fold_enabled = 1
let g:vimtex_latexmk_continuous = 1
let g:vimtex_latexmk_background = 1
let g:vimtex_latexmk_options = '-pdfdvi'
let g:vimtex_quickfix_mode = 0
" let g:vimtex_view_general_viewer = '/opt/homebrew-cask/Caskroom/skim/1.4.13/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_viewer = '/usr/local/bin/displayline'
let g:vimtex_view_general_options = '@line @pdf @tex'
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = [
            \ 're!\\[A-Za-z]*(ref|cite)[A-Za-z]*([^]]*])?{([^}]*, ?)*'
            \ ]

" ConqueGdb {{{2
" let g:ConqueGdb_Leader = '<Space>'
" let g:ConqueTerm_Color = 2         " 1: strip color after 200 lines, 2: always with color
" let g:ConqueTerm_CloseOnEnd = 1    " close conque when program ends running
" let g:ConqueTerm_StartMessages = 0 " display warning messages if conqueTerm is configured incorrectly 

" vim-template {{{2

let g:vimtex_indent_enabled = 0

" }}}
" UltiSnips {{{2

" let g:UltiSnipsExpandTrigger="<s-cr>"
" let g:UltiSnipsListSnippets="<c-s-tab>"

" }}}
" Supertab {{{2

" let g:SuperTabDefaultCompletionType = ‘<C-Tab>’

" }}}
" Previm {{{2

let g:previm_open_cmd = 'open -a Safari'
let g:previm_show_header = 0
" let g:previm_enable_realtime = 1
augroup PrevimSetting
	autocmd!
	autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

" }}}

" GLOBAL SETTING {{{1

let g:user  = "K.Nakamura"
let g:email = "nakamura-keita-kn@ynu.jp"

" let g:hybrid_use_Xresources = 1 " for GVim
" colorscheme hybrid
colorscheme molokai
let g:molokai_original = 1
set background=dark
syntax on
hi clear cursorLine

set vb t_vb=
set number
set hlsearch
set ignorecase
set smartcase
set tabstop=4
set shiftwidth=4
set incsearch
set whichwrap=b,s,h,l,<,>,[,]
" set colorcolumn=110
set colorcolumn=80
set laststatus=2
set nowrap
set noshowmode
" set noswapfile
set scrolloff=2
set cursorline
" hi clear cursorLine
set foldmethod=marker
set mouse=a
set encoding=utf-8
set fileencodings=utf-8,sjis
vnoremap <silent> <C-p> "0p<CR>
nnoremap <silent> <ESC><ESC> :nohlsearch<CR>
" nnoremap <C-n> gt
" nnoremap <C-p> gT
" nnoremap j gj
" nnoremap k gk
au QuickfixCmdPost grep,grepadd,vimgrep copen
set spelllang=en,cjk
let g:tex_conceal = ''
let g:tex_flavor = 'latex'
let g:templates_no_builtin_templates = 1
let g:templates_directory = '~/.vim/template'

set backspace=indent,eol,start

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

inoremap <special> <Esc> <Esc>hl
" set guicursor+=i:blinkwait0

set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L


" LOCAL SETTING {{{1

" c++ {{{2
function! s:cpp()
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
    setlocal expandtab
    " setlocal autoindent
    setlocal spell
	" setlocal wrap
	" setlocal textwidth=80
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
