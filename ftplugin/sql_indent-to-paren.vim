
function! s:FixPos(pos, linum, clnum)
  call cursor(a:linum, a:clnum) "restore cursor pos
  if a:pos[0] >= a:linum | return [0, 0] | else | return a:pos | endif
endfunction

function! IndentToParen()
  let skip = 'synIDattr(synID(line("."), col("."), 0), "name") =~? "string\\|comment"'

  let this_line = line('.')
  let this_col  = col('.')

  let [l, c] = s:FixPos(searchpairpos('(',  '', ')',  'b', skip), this_line, this_col)

  if c == 0 | return | endif

  call cursor(this_line, 0)

  if c == 1
    s/^\s*//
  else
    s/^\s*/\=(repeat(' ', c - 1))/
  endif
endfunction


inoremap <C-\> <C-o>:call IndentToParen()<CR>

