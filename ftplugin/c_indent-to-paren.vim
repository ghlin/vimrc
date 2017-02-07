function! s:ComparePos(pos1, pos2)
  if a:pos1[0] > a:pos2[0]
    return a:pos1
  endif

  if a:pos1[0] < a:pos2[0]
    return a:pos2
  endif

  if a:pos1[1] > a:pos2[1]
    return a:pos1
  endif

  if a:pos1[1] < a:pos2[1]
    return a:pos2
  endif

  return a:pos1
endfunction


function! IndentToCurly()
  let skip = 'synIDattr(synID(line("."), col("."), 0), "name") =~? "string\\|comment"'

  let this_line = line('.')

  let p1 = searchpairpos('{', '', '}', 'b', skip)
  let p2 = searchpairpos('\[', '', '\]', 'b', skip)
  let p3 = searchpairpos('(', '', ')', 'b', skip)
  let p4 = searchpairpos('<', '', '>', 'b', skip)

  let [l, c] = s:ComparePos(s:ComparePos(p1, p2), s:ComparePos(p3, p4))

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


inoremap <C-\> <C-o>:call IndentToCurly()<CR>

