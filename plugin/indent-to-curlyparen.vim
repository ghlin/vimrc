
function! ManualIndentC()
  let skip = 'synIDattr(synID(line("."), col("."), 0), "name") =~? "string\\|comment"'

  let this_line = line('.')

  let [l, c] = searchpairpos('{', '', '}', 'b', skip)

  if c == 0
    return
  endif

  call cursor(this_line, 0)

  if c == 1
    s/^\s*//
  else
    s/^\s*/\=(repeat(' ', c - 1))/
  endif
endfunction


au! FileType cpp,c,javascript inoremap <C-\> <C-o>:call ManualIndentC()<CR>

