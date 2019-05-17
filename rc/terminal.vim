set title
set termencoding=utf-8
set ttyfast

if !has('nvim')
  let &t_ti   .= "\e]50;CursorShape=0\x7"
  let &t_te   .= "\e]50;CursorShape=1\x7"
  let &t_SI   .= "\e]50;CursorShape=1\x7"
  let &t_EI   .= "\e]50;CursorShape=0\x7"
endif

" fix colorscheme
let current_scheme = get(g:, 'colors_name', 'default')

" are we using Paperlike display?
if $PAPERLIKE == "PAPERLIKE"
  colorscheme Paperlike
elseif current_scheme == 'default'
  hi! clear Visual
  hi! Visual cterm=inverse

  " hi! Pmenu  cterm=none  ctermbg=Megenta ctermfg=Black

  hi! clear Folded
  hi! Folded cterm=italic

  hi! clear Statement
  hi! Statement ctermfg=DarkBlue

  hi! clear StorageClass
  hi! StorageClass cterm=none ctermfg=DarkBlue

  hi! clear VertSplit
  hi! VertSplit cterm=none

  hi! clear SignColumn
  hi! SignColumn ctermfg=DarkRed  ctermbg=none

  hi! DiffAdd    ctermfg=Black
  hi! DiffText   ctermfg=Black
  hi! DiffChange ctermfg=Black
  hi! DiffDelete ctermfg=Black

  " TODO: what if terminal's colorscheme has a light background?
  hi! TabLine     ctermfg=White ctermbg=Black cterm=none
  hi! TabLineFill ctermfg=White ctermbg=Black cterm=none

  hi! CocFloating ctermbg=235

  hi! Pmenu     ctermfg=15     ctermbg=232
  hi! PmenuSel  ctermfg=White  ctermbg=235    cterm=italic,bold

  hi! TabLine      cterm=underline
  hi! TabLineSel   cterm=underline
  hi! TabLineFill  cterm=underline
endif

hi! clear MatchParen
hi! MatchParen cterm=underline,italic gui=underline,italic
