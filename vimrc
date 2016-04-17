" 2012.2.9.ghl@gmail.com
"
"        /-\       ,-\
"       |   \     /   |
"       |    \   /    /
"       |     >-/    /
"        \         /`
"         >-- /\ -<
"        (   /  \  )
"         |/     \/
"         /
"
"
"                       反　魂　蝶　で　あ　る　！

function! LoadPlugins() "{{{
  " required by Vundle
  filetype off
  set rtp +=~/.vim/bundle/Vundle.vim

  call vundle#begin()
  source ~/.vim/vackages.vim
  call vundle#end()

  filetype plugin indent on
endfunction "}}}

function! PreSettings() "{{{
  let g:mapleader = ','
endfunction "}}}

function! BasicSettings() "{{{
  syntax on
  filetype plugin indent on

  set autoindent
  set smartindent
  set cino         =N-s,:s,b1,g0,t0,(0,Ws,ks,l1
  set iskeyword   ^=_,\$,?
  set expandtab
  set shiftwidth   =2
  set softtabstop  =2
  set tabstop      =2
  set whichwrap   +=<,>,h,l
  set list
  set conceallevel =2
  set listchars    =tab:\ \ ,trail:- ",eol:¶
  "set textwidth    =80
  "set colorcolumn  =+1

  set backspace    =2
  set hidden

  " buffer operation
  nmap  <leader><  :bp<CR>
  nmap  <leader>>  :bn<CR>

  set ruler
  set showcmd
  set wildmenu
  set laststatus =2
  set cmdheight  =1
  set report     =0
  set novisualbell
  set noerrorbells

  set hlsearch
  set incsearch
  set smartcase
  set ignorecase
  set showmatch
  set matchtime  =4

  set timeoutlen =600

  " iterm2 only.
  let &t_SI = "\<Esc>]50;CursorShape=1 \x7"
  let &t_EI = "\<Esc>]50;CursorShape=0 \x7"

  " set working dir automatically.
  autocmd BufEnter * silent! lcd %:p:h

  nnoremap \\ :nohl<CR>

  command! -bang -nargs=? Q    :q
  command! -bang -nargs=? Qa   :qa
  command! -bang -nargs=? W    :w
  command! -bang -nargs=? Wa   :wa
  command! -bang -nargs=? Wqa  :wqa
  " command! -bang -nargs=? Vs   :vs <args>

  " path
  set path^=~/.local/include,.,.. "/usr/local/include makes code completion slow

  " formats
  set fileformat   =unix
  set fileformats  =unix,dos
  set fileencoding =utf-8
  set encoding     =utf-8

  if has('win32')
    set ssl  " Use `/' as dir spearator
    language C
  endif

  if has('spell')
    set spelllang    =en_us
  endif

  " z-z to leave insert mode
  inoremap zz <ESC>

  " jump out of a ()
  inoremap <C-q> <esc>f)a
  " jump out of a []
  inoremap <C-b> <esc>f]a
  " jump out of a {}
  inoremap <C-]> <esc>f}a

  " toggle fold
  nnoremap <space>      @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

  " remember more history commands
  set history=2048

  " toggle spell
  function! ToggleSpell()
    if !has("spell")
      echo "require spell"
      return
    endif

    let &spell = !&spell
    if &spell == 1
      echo "Enable spell checking"
    else
      echo "Disable spell checking"
    endif
  endfunction
  nnoremap <leader>s    :call ToggleSpell()<CR>

  " toggle show tabline
  function! ToggleTab()
    let &stal = !&stal
    if &stal == 1
      echo "Show Tabline"
    else
      echo "Hide Tabline"
    endif
  endfunction

  nnoremap <leader>l    :call ToggleTab()<CR>

  " hide Visual mode
  nmap    <S-q>       <leader>Q

  set nu
  set rnu
  set so         =4
  set nowrap
  " set fdc=1
  set foldmethod =marker
  set foldlevel  =3

  autocmd! BufEnter,BufRead *.md   setlocal ft=markdown

  set errorformat^=%-GIn\ file\ included\ from\ %.%#
  let g:c_gnu = 1

  set completeopt=menu,longest

  "set wildmode=list:full
  set wildignore=*.o,*.~,*.swp,*.pyc,*.luac,*.so,*.DS_Store,*.run,*.dSYM

  set cscopequickfix=s-,c-,d-,i-,t-,e-,g-

  " XXX
  com! -nargs=0 LCD           :lcd       %:h
  com! -nargs=0 CD            :cd        %:h

  " delete this file
  com! -nargs=0 RmThis        :!rm       % -v

  " ls
  com! -nargs=0 LS            :!ls       %:h

  " ls -al
  com! -nargs=0 LL            :!ls -al   %:h

  " when forget `sudo'
  com! -nargs=0 ForceSave     :w !sudo tee % &>/dev/null

 " function! SDCVFromInput()
 "   let @z = input('sdcv >>> ')
 "   redir =>dict
 "   silent exec '!sdcv --non-interactive ' . @z
 "   redir END
 "   echo dict
 " endfunction

 " com! -nargs=0 SDCV          :call SDCVFromInput()

 " if has('gui_running')
 "   set keywordprg         =ydcv\ --color=never
 " else
 "   set keywordprg         =ydcv
 " endif

  " <C-R>=ExecPipe('colo') ==> solarized
  function! ExecPipe(cmd)
    redir =>output
    silent exec a:cmd
    redir END

    return output
  endfunction

  function! ExecPipe_Put(cmd)
    redir =>output
    silent exec a:cmd
    redir END

    put=output
  endfunction

  " enable doxygen highlighting
  let g:load_doxygen_syntax = 1
endfunction "}}}

function! GuiSettings() "{{{
  set guicursor   =n-v-c:block-Cursor/lCursor
  set guicursor  ^=ve:ver5-Cursor
  set guicursor  ^=o:hor5-Cursor/lCursor
  set guicursor  ^=i-ci:ver1-Cursor/lCursor
  set guicursor  ^=r-cr:hor1-Cursor/lCursor
  set guicursor  ^=sm:block-Cursor-blinkwait75-blinkoff55-blinkon55

  set guioptions  =fmei

  "set guifont     =CamingoCode:h16
  "set guifont     =Consolas:h16 " Consolas is the BEST!
  "set guifont     =Courier:h14
  "set guifont     =Courier\ New:h14
  "set guifont     =Fantasque\ Sans\ Mono:h16
  "set guifont     =Fira\ Code:h13
  "set guifont     =Inconsolata:h14
  "set guifont     =Linux\ Libertine\ Mono:h12
   set guifont     =M+\ 1m:h16
  "set guifont     =Menlo\ Regular:h14
  "set guifont     =Monofur:h18
  "set guifont     =Share-TechMonoTrue:h15
  "set guifont     =Source\ Code\ Pro:h12
  "set guifont     =Terminus\ (TTF):h14
  "set guifont     =Ubuntu\ Mono:h14
  "set guifont     =pointfree:h14
  "set guifont     =Iosevka\ Slab:h18

  set background=dark
  "colorscheme      efede6
  "colorscheme      eclipse-mod
  "colorscheme      github
  "colorscheme      solarized
  "colorscheme      dracula
  "colorscheme      eye
  "colorscheme      PerfectDark
  colorscheme      pencil

  set              cul

  set mouse       =
endfunction "}}}

function! TermSettings() "{{{
  colorscheme      console
  set title
  set termencoding=utf-8
endfunction "}}}

"{{{ apply the settings

call PreSettings()
call BasicSettings()
call LoadPlugins()

if has('gui_running')
  call GuiSettings()
else
  call TermSettings()
endif


"}}}

" vim:foldmethod=marker


