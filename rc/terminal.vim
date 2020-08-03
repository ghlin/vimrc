set title
set termencoding=utf-8
set ttyfast

if has('nvim')
  " au! VimLeave * set guicursor=a:ver1
else
  let &t_ti   .= "\e]50;CursorShape=0\x7"
  let &t_te   .= "\e]50;CursorShape=1\x7"
  let &t_SI   .= "\e]50;CursorShape=1\x7"
  let &t_EI   .= "\e]50;CursorShape=0\x7"
endif

" are we using Paperlike display?
if $PAPERLIKE == "PAPERLIKE"
  colorscheme Paperlike
else
  exec 'colorscheme ' . g:prefered_colorscheme
endif

augroup ColorschemeOverrides
  autocmd!

  autocmd ColorScheme *
        \   hi! clear MatchParen
        \ | hi! MatchParen cterm=underline,italic gui=underline,italic
        \ | hi! link CocFloating PMenu
augroup END

set guicursor=i-ci-ve:ver25,r-cr-o:hor25,n-v-c:block

set guifont=Consolas:h17

