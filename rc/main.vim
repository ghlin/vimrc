runtime rc/base.vim
runtime rc/mappings.vim
runtime rc/filetype.vim
runtime rc/terminal.vim
runtime rc/plugins.vim

" make a scratch buffer on startup when
" no command line arguments specified

let s:startup_buffer_loaded = 0

function! s:make_scratch_buffer()
  if s:startup_buffer_loaded != 0
    return
  endif

  call append(line('^'), [ "# Scratch!" ])
  setlocal filetype=markdown
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal buflisted
  setlocal noswapfile

  autocmd! startup VimEnter
  let s:startup_buffer_loaded = 1
endfunction

if argc() == 0
  augroup startup
    autocmd! VimEnter * :call s:make_scratch_buffer()
  augroup END
endif

