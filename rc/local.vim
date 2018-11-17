let s:local_vimrc = expand('~/.config/nvim/local.vim')

if filereadable(s:local_vimrc)
  exec 'source' s:local_vimrc
endif
