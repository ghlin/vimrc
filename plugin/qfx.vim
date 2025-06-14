"""""""""""""""""""""""""""""""""""""""""""
"  toggle quickfix window - from vim wiki  "
"""""""""""""""""""""""""""""""""""""""""""

function! GetBufferList()
  redir =>buflist
  silent! ls
  redir END
  return split(buflist, '\n')
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(buflist, 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx . 'close')
      return
    endif
  endfor

  if a:pfx == 'l' && len(getloclist(0)) == 0
      return
  endif

  let winnr = winnr()
  exec(a:pfx . 'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

nmap <silent> <S-l>     :call ToggleList("Location List", 'l')<CR>
nmap <silent> <S-q>     :call ToggleList("Quickfix List", 'c')<CR>

command! -bang QClear  :call setqflist([], 'f')
command! -bang QBuffer :caddbuffer
