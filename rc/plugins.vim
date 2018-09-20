" required by Vundle
filetype off
set rtp +=~/.vim/bundle/Vundle.vim

call vundle#begin()
runtime rc/plugins.list.vim
call vundle#end()

runtime rc/plugins.post.vim

filetype plugin indent on
