" make a emacs-like scratch buffer on startup when
" no command line arguments passed

let s:startup_buffer_loaded = 0

function! s:make_sketch_buffer()
  if s:startup_buffer_loaded != 0
    return
  endif

  setlocal filetype=markdown
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal buflisted
  setlocal noswapfile
  setlocal so=0

  file     \[Scratch Buffer]

  call append(line('^'), [
        \ "# Scratch Buffer",
        \ '',
        \ "Write anything you want, this file will not be saved to disk.",
        \ '' ])

  normal gg

  autocmd! startup VimEnter
  let s:startup_buffer_loaded = 1
endfunction

function! s:vim_startup()
  exec 'cd ' . expand('~')
  call s:make_sketch_buffer()
endfunction

if argc() == 0
  augroup startup
    autocmd! VimEnter * :call s:vim_startup()
  augroup END
endif

