au!  FileType cpp,c :exec 'setlocal makeprg =$HOME/.local/bin/rin\ --quiet\ ' . expand('%:p')
com! -nargs=* RunThis       :!%:p:r.exec <args>

" TODO: remove this
" TODO: rewrite rin (run it now) in VimL
