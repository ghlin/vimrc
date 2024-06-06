set title
set termencoding=utf-8
set ttyfast

if has('nvim')
  " au! VimLeave * set guicursor=a:ver1
  set notermguicolors
else
  let &t_ti   .= "\e]50;CursorShape=0\x7"
  let &t_te   .= "\e]50;CursorShape=1\x7"
  let &t_SI   .= "\e]50;CursorShape=1\x7"
  let &t_EI   .= "\e]50;CursorShape=0\x7"
endif

