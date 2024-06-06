set wildignore^=$HOME/.vim/plugs/*

" are we using Paperlike display?
if $PAPERLIKE == "PAPERLIKE"
  colorscheme Paperlike
else
  exec 'colorscheme ' . g:prefered_colorscheme
endif
