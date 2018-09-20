
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

if current_scheme == 'default'
  hi! clear Visual
  hi! Visual cterm=inverse

  hi! clear Folded
  hi! Folded cterm=italic

  hi! clear Statement
  hi! Statement ctermfg=White
endif