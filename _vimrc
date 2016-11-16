"        _                    
" __   _(_)_ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
"   \_/ |_|_| |_| |_|_|  \___|
"
"

let g:user  = "K.Nakamura"
let g:email = "keita.nakamura.1109@gmail.com"

" Installed plugins {{{1
call plug#begin('~/.vim/plugged')
let g:plug_shallow = 0
let g:plug_url_format = 'git@github.com:%s.git'

Plug 'vim-jp/vimdoc-ja'
set helplang=ja,en

" Plug 'jiangmiao/auto-pairs' " auto close brackets
Plug 'rking/ag.vim' " for ag in 'ctrlp'
Plug 'scrooloose/nerdcommenter'
" Plug 'Yggdroot/indentLine'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-fugitive'
Plug 'aperezdc/vim-template'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar' ", {'on': 'TagbarToggle'}
" Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax', {'for': 'markdown'}
Plug 'JuliaLang/julia-vim'
Plug 'Shougo/neoinclude.vim', {'for': ['h', 'cpp']}
Plug 'lervag/vimtex',        {'for': 'tex', 'commit': '5506728'}
Plug 'jpalardy/vim-slime'
Plug 'henrik/vim-indexed-search'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
Plug 'KeitaNakamura/highlighter.nvim', {'do': ':UpdateRemotePlugins'}
" Plug 'christoomey/vim-tmux-navigator'
if has('nvim')
  " Plug 'neomake/neomake'
else
  Plug 'scrooloose/syntastic'
  Plug 'tpope/vim-dispatch'
endif

" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-easytags'

" File explorer {{{2
Plug 'scrooloose/nerdtree'
Plug 'Shougo/unite.vim'
Plug 'ujihisa/unite-colorscheme'
" Plug 'Shougo/vimfiler.vim'
" Plug 'justinmk/vim-dirvish'
Plug 'kien/ctrlp.vim'
" }}}
" Status line {{{2
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
" Plug 'cocopon/lightline-hybrid.vim'
" }}}
" Auto completion {{{2
if has('nvim')
  Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
  Plug 'zchee/deoplete-jedi'
  Plug 'zchee/deoplete-clang'
  " Plug 'JuliaEditorSupport/deoplete-julia'
else
  Plug 'Shougo/vimproc.vim',   {'do': 'make'}
  Plug 'Shougo/neocomplete.vim'
  Plug 'davidhalter/jedi-vim', {'for': 'python'}
  Plug 'justmao945/vim-clang', {'for': ['h', 'cpp']}
endif
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
" Plug 'jpo/vim-railscasts-theme'         " railscasts
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
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'lifepillar/vim-wwdc16-theme'
Plug 'easysid/mod8.vim'
Plug 'junegunn/seoul256.vim'
" Plug 'therealechan/vim-railscasts-theme'

Plug 'KeitaNakamura/neodark.vim'
Plug 'KeitaNakamura/railscasts.vim'
Plug 'KeitaNakamura/lightline-railscasts.vim'
" }}}

call plug#end()

" Global setting {{{1
" Color {{{2
" let g:neodark#color='black'
let g:neodark#use_custom_terminal_theme=1
" let g:neodark#use_256color=1
colorscheme neodark

set cursorline " highlight current line
" hi clear CursorLine
set colorcolumn=80
nnoremap <silent> <C-n> :set cursorline!<CR>
noremap  <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>
" }}}
" Search {{{2
set hlsearch " highlight for search
nnoremap <silent> <ESC><ESC> :nohlsearch<CR>
set ignorecase
set smartcase
set incsearch
" }}}
" View {{{2
set guicursor=n-v-c-i:block-Cursor
set pumheight=10 " number of lists of completion
set number " line number
set laststatus=2
set nowrap
set noshowmode
set guioptions-=e " tab window for gui
" disable left and right sides scroll bar
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
" shape of cursor in CUI
" if exists('$TMUX')
  " let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  " let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
" else
  " let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  " let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" endif
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
nnoremap Y y$
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
" }}}
" Others {{{2
set shell=/bin/bash
set foldmethod=marker
set vb t_vb= " disable beep sound
set tabstop=4 " number of space for tab
set shiftwidth=4 " width of auto indent
set expandtab
set backspace=indent,eol,start
set encoding=utf-8
set fileencodings=utf-8,sjis
set spelllang=en,cjk
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
let g:tex_conceal="adgmb"
let g:tex_flavor = 'latex'
if !has('gui_running')
  set timeout timeoutlen=1000 ttimeoutlen=50
endif

" yank to clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

" get highlight information
function! s:get_syn_id(transparent)
    let synid = synID(line('.'), col('.'), 1)
    return a:transparent ? synIDtrans(synid) : synid
endfunction
function! s:get_syn_name(synid)
    return synIDattr(a:synid, 'name')
endfunction
function! s:get_highlight_info()
    execute "highlight " . s:get_syn_name(s:get_syn_id(0))
    execute "highlight " . s:get_syn_name(s:get_syn_id(1))
endfunction
command! HighlightInfo call s:get_highlight_info()
" }}}

" Local setting {{{1
" vimscript {{{2
function! s:vimscript()
  setlocal tabstop=2 " number of space for tab
  setlocal shiftwidth=2 " width of auto indent
  setlocal expandtab
endfunction

augroup vimrc-vimscript
  autocmd!
  autocmd FileType vim call s:vimscript()
augroup END

" shell {{{2
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
  setlocal foldmethod=manual
  setlocal tabstop=2
  setlocal shiftwidth=2
  setlocal colorcolumn=
  setlocal conceallevel=2
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
  setlocal foldmethod=indent
  setlocal foldlevel=1
endfunction

augroup vimrc-phthon
  autocmd!
  autocmd FileType python call s:python()
augroup END

" julia {{{2
function! s:julia()
  setlocal expandtab
  setlocal foldmethod=indent
  setlocal foldlevel=1
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
  " setlocal foldmethod=manual
  setlocal spell
  setlocal wrap
  setlocal linebreak
  setlocal tabstop=2
  setlocal shiftwidth=2
  setlocal colorcolumn=
  setlocal foldlevel=2
endfunction

augroup vimrc-markdown
  autocmd!
  autocmd FileType markdown call s:markdown()
  autocmd FileType pandoc call s:markdown()
augroup END
" Setting for each plugin {{{1
" caw (comment out plugin) {{{2
nmap <Leader>c <Plug>(caw:hatpos:toggle)
vmap <Leader>c <Plug>(caw:hatpos:toggle)

" nerdcommenter {{{2
let g:NERDSpaceDelims = 1
let g:NERDCustomDelimiters = {'julia': { 'left': '#', 'leftAlt': '#=', 'rightAlt': '=#' }}

" indentLine {{{2
let g:indentLine_fileTypeExclude = ['pandoc', 'tex']
let g:indentLine_color_term = 239

" indent-guides {{{2
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'tex']
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

" vim-template {{{2
let g:templates_no_builtin_templates = 1
let g:templates_directory = '$DOTPATH/_vim/templates'

" syntastic {{{2
let g:syntastic_quiet_messages = { "level": "warnings" }
let g:syntastic_error_symbol = '✗✗'

" neomake {{{2
" autocmd! BufWritePost * Neomake
let g:neomake_error_sign = {'text': '✗✗', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': '⚠', 'texthl': 'NeomakeWarningSign'}
let g:neomake_message_sign = {'text': '➤', 'texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}

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
let g:tagbar_type_pandoc = {
    \ 'ctagstype' : 'pandoc',
    \ 'kinds' : [
        \ 'h:Headline'
    \ ],
    \ 'sort' : 0,
\ }
let g:tagbar_iconchars = ['▸', '▾']
" for onedark color scheme with tagbar
highlight TagbarSignature term=bold ctermfg=59 gui=italic guifg=#5C6670

" vim-markdown {{{2
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_math = 1

" vim-pandoc {{{2
let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
let g:pandoc#filetypes#pandoc_markdown = 1
let g:pandoc#syntax#conceal#use = 0
let g:pandoc#folding#fdc = 0
let g:pandoc#biblio#bibs = ['/Users/nakamura/Documents/BibTeX/library.bib']
let g:pandoc#folding#fold_fenced_codeblocks = 1
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.pandoc= '@'

" previm {{{2
augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

" Julia {{{2
noremap <expr> <F7> LaTeXtoUnicode#Toggle()
inoremap <expr> <F7> LaTeXtoUnicode#Toggle()
let g:default_julia_versoin = "0.5" " not working

" vimtex {{{2
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_manual = 1 " improve performance
let g:vimtex_latexmk_options = '-pdfdvi'
let g:vimtex_quickfix_mode = 0
let g:vimtex_indent_enabled = 0
let g:vimtex_view_general_viewer = 'displayline'
let g:vimtex_view_general_options = '@line @pdf @tex'
" if has('nvim')
  " let g:vimtex_latexmk_progname = 'nvr' " for neovim
  " " Setting of Skim should be following:
  " " Preset: Custom
  " " Command: nvr
  " " Arguments: -c "%line" "%file"
" endif

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
" for Deoplete {{{3
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = '\\(?:'
      \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
      \ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
      \ . '|hyperref\s*\[[^]]*'
      \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
      \ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
      \ .')'
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

" vim-slime {{{2
let g:slime_target = "tmux"
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
let NERDTreeMapChangeRoot='l'
let NERDTreeMapUpdir='h'
let NERDTreeCascadeSingleChildDir=0
let NERDTreeCascadeOpenSingleChildDir=0
let NERDTreeChDirMode=2
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

" vimfiler {{{2
" noremap <C-e> :VimFilerBufferDir -split -simple -toggle <ENTER>
" noremap <C-e> :VimFilerBufferDir -simple -toggle <ENTER>
" noremap <C-e> :VimFiler -split -simple -winwidth=35 -no-quit -toggle <ENTER>
" noremap <C-e> :VimFiler -split -simple -winwidth=35 -no-quit<ENTER>
" noremap <C-e> :VimFilerExplorer -find -toggle<ENTER>
let g:vimfiler_as_default_explorer=1
let g:vimfiler_enable_auto_cd=1

" CtrlP {{{2
if executable('ag')
  let g:ctrlp_use_caching = 0
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup -g ""'
endif

" airline {{{2
let g:airline_left_sep=' '
let g:airline_right_sep=' '
" let g:airline_powerline_fonts=1
" let g:airline#extensions#tabline#enabled = 1

" Lightline {{{2

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
"   let g:neocomplete#keyword_patterns = {}
" endif
" let g:neocomplete#keyword_patterns._ = '\h\w*'

" Deoplete {{{2
let g:deoplete#enable_at_startup = 1
" for c++ {{{3
let g:deoplete#sources#clang#libclang_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header='/Library/Developer/CommandLineTools/usr/lib/clang'
" }}}

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
" UltiSnips {{{2
" let g:UltiSnipsExpandTrigger = "<nop>"
" inoremap <expr> <CR> pumvisible() ? "<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>" : "\<CR>"
" let g:UltiSnipsJumpForwardTrigger="<TAB>"
" let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"
" }}}
" neosnippet {{{2
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
" }}}
" vim-indexed-search {{{2
let g:indexed_search_numbered_only = 1
" }}}
" Highlighter {{{2
let g:highlighter#auto_update = 2
let g:highlighter#project_root_signs = ['.git']
" }}}
