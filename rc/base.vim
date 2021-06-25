" basic settings

" use <space> as leader-key
let g:mapleader      = "\<Space>"
let g:maplocalleader = "\<Space>"

set expandtab
set shiftwidth  =2
set softtabstop =2
set tabstop     =2

set hidden
set laststatus =0
set cmdheight  =1
set novisualbell
set noerrorbells
set showmatch

set virtualedit=block  " allow selection past end of line

" match <, >
set matchpairs +=<:>
set matchtime   =4

" enable doxygen highlighting
let g:load_doxygen_syntax = 1
let g:yats_host_keyword = 0

" set statusline=[%n]%(\ %.35F%)\ %=\ L%l/%L\ C%c%(\ %m\ %r%h%w%q%)%(\ %y%)
set statusline=-
set fillchars=stl:-,stlnc:-,vert:¦

function! s:apply_status_line_style_hack() abort
  hi! clear VertSplit
  hi! clear StatusLine
  hi! clear StatusLineNC
  hi! link VertSplit    Normal
  hi! link StatusLine   Normal
  hi! link StatusLineNC Normal

  " :help hl-StatusLineNC says:
  "
  " StatusLineNC
  " status lines of not-current windows
  "     Note: if this is equal to "StatusLine" Vim will use "^^^" in
  "     the status line of the current window.
  if get(g:, 'gui_running', 0) == 1
    hi! StatusLine    gui=bold cterm=none
    hi! StatusLineNC  gui=bold cterm=bold
  else
    hi! StatusLine    gui=bold cterm=none
    hi! StatusLineNC  gui=none cterm=none
  endif
endfunction

augroup ColorSchemeOverride
  autocmd!

  autocmd ColorScheme *
        \   call s:apply_status_line_style_hack()
        \ | hi! clear MatchParen
        \ | hi! MatchParen cterm=underline,italic,bold gui=underline,italic,bold
        \ | hi! link typescriptBrowserObjects Normal
        \ | hi! link typescriptBraces         Normal
        \ | hi! link typescriptParens         Normal
        \ | hi! link typescriptMessage        Normal
        \ | hi! link typescriptGlobal         Normal
        \ | hi! link typescriptHtmlEvents     Normal
        \ | hi! link typescriptMember         Normal
        \ | hi! link typescriptKeywordOp      Normal
        \ | hi! link typescriptObjectLabel    Normal
        \ | hi! link typescriptCall           Normal
        \ | hi! link typescriptFuncComma      Normal
        \ | hi! link typescriptFuncType       Normal
        \ | hi! link typescriptExport         Keyword
        \ | hi! link typescriptImport         Keyword
        \ | hi! link typescriptVariable       Keyword
        \ | hi! link typescriptIdentifier     Keyword
        \ | hi! link cppType                  Type
        \ | hi! link cType                    Type
        \ | hi! link vimContinue              Normal
        \ | hi! link xmlTagName               htmlTagName
        \ | hi! link xmlEndTag                htmlEndTag
augroup END

" where am i?
set ruler

" fold text formatting
set foldtext=FoldText()
function! FoldText()
  let foldlinecnt = v:foldend - v:foldstart
  let line        = substitute(getline(v:foldstart), '\t', repeat(' ', &tabstop), 'g')
  let text        = substitute(line, '\({{{\s*\)\|\(//\s*\)\|\(/\*\s*\)', '', 'g')
  let spaces      = ' ... '
  let foldinfo    = ' ' . foldlinecnt . ' Ln. '
  let fillcnt     = winwidth(0) - strdisplaywidth(text) - len(foldinfo) - len(spaces) - &number * &numberwidth

  return text . spaces . repeat(' ', fillcnt) . foldinfo
endfunction

" no line-numbers
set nonumber
set norelativenumber

" always keep 4 lines above and below the cursor.
set scrolloff     =4
" always keep 4 lines to the left and to the right
" of the cursor.
set sidescrolloff =4

set nowrap            " don't wrap long lines!
set linebreak
set breakindent
set breakindentopt =shift:3,sbr
set breakat        =\ ^I!@*-+;:,./?\(\[\{        " break at these chars
let &showbreak     ='↪ '

set foldmethod =marker
set foldlevel  =3

" enable syntax highlight
syntax on

" indentation settings
filetype indent on
set autoindent
set smartindent
set cindent
set cino =Ls,:0,g0,N-s,(0,w0,Ws,k-1s,t0

" tell (neo)vim how to split words
set iskeyword   ^=_,\$,?

" backspace can erase:
set backspace =eol,start,indent

" mouse would help.
set mouse=a

" disable cursor style changes
set guicursor  =

" insert longest common text, show a menu unless
" there's only one match
set completeopt =menu,longest
set pumheight   =7

" searching options
set hlsearch
set incsearch
set smartcase
set ignorecase
set noinfercase

if has('nvim')
  " as a regex muggle...
  set inccommand =split
endif

" formats && encoding
set fileformat    =unix
set fileformats   =unix,mac,dos
set fileencodings =utf-8,ucs-bom,cp936,gb18030,big5,euc-jp,euc-kr,sjis,latin1
set fileencoding  =utf-8
set encoding      =utf-8

set timeoutlen    =600
set updatetime    =800

set list
set listchars    =tab:»\ ,trail:˽,extends:»,precedes:«   ",eol:¬, "⋅
set conceallevel =2
" set signcolumn   =yes

" completion & :find command
set path^=~/.local/include,.,.. "/usr/local/include makes code completion slow
set path^=*,**                  " this is awesome.

set ambiwidth=single

" split window to the right
set splitright

" tab completion for commands
set wildmenu
set wildignorecase
set wildignore^=*.o,*.~,*.swp,*.pyc,*.luac,*.so
set wildignore^=*.DS_Store,*.run,*.dSYM
set wildignore^=node_modules,.vscode,.git,.build,.stack-work

" no backup/swap files
set nobackup
set nowritebackup
set noswapfile

" poor man's version control...
set undofile

augroup Misc
  autocmd!

  " set working dir automatically?
  " autocmd BufEnter * silent! lcd %:p:h

  autocmd FileType qf
        \   wincmd J       " quickfix window goes bottom
        \ | setlocal wrap

  " create directory recursively when necessary, this is
  " very useful when saving a file in new folder
  autocmd BufWritePre *
        \ if !isdirectory(expand('<afile>:p:h')) |
        \   call mkdir(expand('<afile>:p:h'), 'p') |
        \ endif

  " restore cursor position, stolen from vimwiki
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line('$') |
        \   execute 'normal! g`"' |
        \ endif
augroup END

" the silver_searcher
set grepprg=ag\ --nogroup\ --nocolor

" {{{ digraph subscripts.
execute "digraphs ks " . 0x2096 
execute "digraphs as " . 0x2090
execute "digraphs es " . 0x2091
execute "digraphs hs " . 0x2095
execute "digraphs is " . 0x1D62
execute "digraphs ks " . 0x2096
execute "digraphs ls " . 0x2097
execute "digraphs ms " . 0x2098
execute "digraphs ns " . 0x2099
execute "digraphs os " . 0x2092
execute "digraphs ps " . 0x209A
execute "digraphs rs " . 0x1D63
execute "digraphs ss " . 0x209B
execute "digraphs ts " . 0x209C
execute "digraphs us " . 0x1D64
execute "digraphs vs " . 0x1D65
execute "digraphs xs " . 0x2093
" }}}

" sql.vim:
let g:sql_type_default = 'mysql'

let g:prefered_colorscheme = 'daily'

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

nnoremap <F10> :call SynStack()<CR>
