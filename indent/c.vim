
" be a good citizen
"
if exists("b:did_indent")
   finish
endif

let b:did_indent = 1


setlocal indentexpr=GetCIndent(v:lnum)

if exists("*GetCIndent")
  finish
endif

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

function! GetCIndent(linum)
  if line('.') == 0
    return 0
  endif

  let skip = 'synIDattr(synID(line("."), col("."), 0), "name") =~? "string\\|comment"'

  let p1 = searchpairpos('(', '', ')', 'b', skip)
  let p2 = searchpairpos('\[', '', '\]', 'b', skip)

  let p = s:ComparePos(p1, p2)

  if p[1] != 0
    echom "will return " . (p[1] - 1)
    return p[1] - 1
  endif

  echom "will fallback with -1"
  return cindent(a:linum)
endfunction


