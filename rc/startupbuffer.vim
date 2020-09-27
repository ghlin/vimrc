" make a scratch buffer on startup when
" no command line arguments passed

let s:startup_buffer_loaded = 0
function! s:make_scratch_buffer()
  if s:startup_buffer_loaded != 0
    return
  endif

  " no filetype
  " setlocal filetype=markdown
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal buflisted
  setlocal noswapfile
  file     \[Scratch]

  call append(line('^'),
        \ [ 'This is a scratch buffer, type anything you want, this file will not be saved to disk anyway.'
        \ , '' ])

  autocmd! Startup VimEnter
  let s:startup_buffer_loaded = 1
endfunction

if argc() == 0
  augroup Startup
    autocmd!

    autocmd! VimEnter * :call s:make_scratch_buffer()
  augroup END
endif

