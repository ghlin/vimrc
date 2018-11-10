" basic settings

" {{{ use <space> as leader-key
let g:mapleader = "\<Space>"
" }}}

" {{{ setup python paths for mac
if has('macunix')
  if !has('nvim')
  set pythonthreehome="/usr/local/Frameworks/Python.framework/Versions/3.7"
  set pythonthreedll="/usr/local/Frameworks/Python.framework/Versions/3.7/lib/libpython3.7m.dylib"
  endif

  " and haskell.
  let $PATH=$PATH . ":" . $HOME . "/Library/Haskell/bin"
endif
" }}}

" {{{ sainer tab behavior
set expandtab
set shiftwidth  =2
set softtabstop =2
set tabstop     =2
" }}}

" {{{ better editor inteface
set hidden
set laststatus =0
set cmdheight  =1
set novisualbell
set noerrorbells
set showmatch
set matchpairs +=<:>
set matchtime   =4

" enable doxygen highlighting
let g:load_doxygen_syntax = 1

set statusline=[%n]%(\ %.30F%)%(\ \:\:\ %{ProjectNameGuess()}%)%=\ L%l/%L\ C%c%(\ %m\ %r%h%w%q%)%(\ %y%)

" where am i?
set ruler

" nicer fold text
function! FoldText() " {{{
  let foldlinecnt = v:foldend - v:foldstart
  let line        = substitute(getline(v:foldstart), '\t', repeat(' ', &tabstop), 'g')
  let spaces      = ' ... '
  let foldinfo    = ' ' . foldlinecnt . ' Ln. '
  let fillcnt     = winwidth(0) - len(line) - len(foldinfo) - len(spaces) - &number * &numberwidth

  return line . spaces . repeat(' ', fillcnt) . foldinfo
  return left . right
endfunction " }}}

set foldtext=FoldText()

" no line-numbers
set nonu
set nornu
set so         =4

" wrap long lines
set wrap
set linebreak
set breakindent
set breakindentopt =shift:3,sbr
set breakat        =\ ^I!@*-+;:,./?\(\[\{        " break at these chars
let &showbreak     ='↪ '

" set fdc=1
set foldmethod =marker
set foldlevel  =3

" }}}

" {{{ better editing experience

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

set completeopt =menu,longest
set pumheight   =12
" }}}

" {{{ searching options
set hlsearch
set incsearch
set smartcase
set ignorecase
set noinfercase

if has('nvim')
  " as a regex muggle...
  set inccommand =split
endif
" }}}

" {{{ autocmds
" set working dir automatically?
" autocmd BufEnter * silent! lcd %:p:h

" quickfix window goes bottom most.
autocmd FileType qf wincmd J
" }}}

" {{{ formats && encoding stuff
set fileformat    =unix
set fileformats   =unix,mac,dos
set fileencodings =utf-8,ucs-bom,cp936,gb18030,big5,euc-jp,euc-kr,sjis,latin1
set fileencoding  =utf-8
set encoding      =utf-8
" }}}

" {{{ misc
" remember more history commands
set history    =2048

set timeoutlen =600

set list
set listchars    =tab:\ \ ,trail:⌴,extends:»,precedes:«   ",eol:¬, "⋅
set conceallevel =2

" completion & :find command
set path^=~/.local/include,.,.. "/usr/local/include makes code completion slow
set path^=*,**                  " this is awesome.

set ambiwidth=double

" split window to the right
set splitright

" tab completion for commands
set wildmenu
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

  " very useful when saving a file in new folder
  autocmd BufWritePre *
        \ if !isdirectory(expand('<afile>:p:h')) |
        \   call mkdir(expand('<afile>:p:h'), 'p') |
        \ endif

  " restore cursor position
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line('$') |
        \   execute 'normal! g`"' |
        \ endif
augroup END
" }}}
