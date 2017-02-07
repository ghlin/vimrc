" ====================================================================================
" typing ...
"
"      auto xxx = SomeStruct { .first_field = blahblah | <-- cursor here...       E-N-T-E-R!!!
"
" indent to:
"
"      auto xxx = SomeStruct { .first_field = blahblah
"        | <-- cursor here.
"
" eh... not so good..., hit <C-\>
"
"      auto xxx = SomeStruct { .first_field = blahblah
"                            | <-- cursor moved to here!!!
"
" then you just continue:
"
"      auto xxx = SomeStruct { .first_field = blahblah
"                            , .second_field = blahblab
"                            , ... };
"
" also works for ( ), [ ], { }, < >
"
" ====================================================================================

function! s:ComparePos(pos1, pos2)
  if a:pos1[0] > a:pos2[0] | return a:pos1 | endif
  if a:pos1[0] < a:pos2[0] | return a:pos2 | endif
  if a:pos1[1] > a:pos2[1] | return a:pos1 | endif
  if a:pos1[1] < a:pos2[1] | return a:pos2 | endif

  return a:pos1
endfunction

function! s:FixPos(pos, linum)
  if a:pos[0] >= a:linum | return [0, 0] | else | return a:pos | endif
endfunction

function! IndentToParen()
  let skip = 'synIDattr(synID(line("."), col("."), 0), "name") =~? "string\\|comment"'

  let this_line = line('.')

  let p1 = s:FixPos(searchpairpos('{',  '', '}',  'b', skip), this_line)
  let p2 = s:FixPos(searchpairpos('\[', '', '\]', 'b', skip), this_line)
  let p3 = s:FixPos(searchpairpos('(',  '', ')',  'b', skip), this_line)
  let p4 = s:FixPos(searchpairpos('<',  '', '>',  'b', skip), this_line)

  let [l, c] = s:ComparePos(s:ComparePos(p1, p2), s:ComparePos(p3, p4))

  if c == 0 | return | endif

  call cursor(this_line, 0)

  if c == 1
    s/^\s*//
  else
    s/^\s*/\=(repeat(' ', c - 1))/
  endif
endfunction


inoremap <C-\> <C-o>:call IndentToParen()<CR>

