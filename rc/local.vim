let s:local_vimrc = expand('~/AppData/Local/nvim/local.vim')

if filereadable(s:local_vimrc)
  exec 'source' s:local_vimrc
endif
