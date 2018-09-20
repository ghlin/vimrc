" required by Vundle
filetype off
set rtp +=~/.vim/bundle/Vundle.vim

call vundle#begin()
source $HOME/.vim/rc/plugins.list.vim
call vundle#end()

source $HOME/.vim/rc/plugins.post.vim

filetype plugin indent on
