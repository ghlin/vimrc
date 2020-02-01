call plug#begin('~/.vim/plugs')
runtime rc/plugins.list.vim
runtime rc/plugins.local.vim
call plug#end()

runtime rc/plugins.post.vim
