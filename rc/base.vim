" basic settings

" use <space> as leader-key
let g:mapleader = "\<Space>"

" setup python library path for mac
if has('macunix')
  if !has('nvim')
  set pythonthreehome="/usr/local/Frameworks/Python.framework/Versions/3.7"
  set pythonthreedll="/usr/local/Frameworks/Python.framework/Versions/3.7/lib/libpython3.7m.dylib"
  endif

  " and haskell.
  let $PATH=$PATH . ":" . $HOME . "/Library/Haskell/bin"
endif

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

" match <, >
set matchpairs +=<:>
set matchtime   =4

" enable doxygen highlighting
let g:load_doxygen_syntax = 1

set statusline=[%n]%(\ %.30F%)%(\ \:\:\ %{ProjectNameGuess()}%)\ %=\ L%l/%L\ C%c%(\ %m\ %r%h%w%q%)%(\ %y%)
set fillchars=stl:\ ,stlnc:-

" where am i?
set ruler

" fold text formatting
set foldtext=FoldText()
function! FoldText()
  let foldlinecnt = v:foldend - v:foldstart
  let line        = substitute(getline(v:foldstart), '\t', repeat(' ', &tabstop), 'g')
  let spaces      = ' ... '
  let foldinfo    = ' ' . foldlinecnt . ' Ln. '
  let fillcnt     = winwidth(0) - len(line) - len(foldinfo) - len(spaces) - &number * &numberwidth

  return line . spaces . repeat(' ', fillcnt) . foldinfo
endfunction

" no line-numbers
set nonumber
set norelativenumber

" always keep 4 lines above and below the cursor.
set scrolloff     =4
" always keep 4 lines to the left and to the right
" of the cursor.
set sidescrolloff =4

set nowrap            " dont wrap long lines!
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
" set guicursor  =

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

" set working dir automatically?
" autocmd BufEnter * silent! lcd %:p:h

" quickfix window goes bottom most.
autocmd FileType qf wincmd J

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

  autocmd FileType qf setlocal wrap

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
