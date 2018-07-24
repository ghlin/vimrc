" ====================================================================================
" typing ...
"
"             void some_function( some_type first_arg| <-- cursor here...    E-N-T-E-R!!!
"
" indent to:
"
"             void some_function( some_type first_arg
"                               | <-- cursor here
"
" then you just continue:
"
"            void some_function( some_type first_arg
"                              , some_type second_arg
"                              , ...)
"
"
" also works for [ ], but not for { } or < >
"
" ====================================================================================


" FIXME:
" comma first indent causes lambda-issue:
" function_accepts_lambda([] (...)
"                        {
"                        | <- indent goes here.
"                        });

finish

" be a good citizen
if exists("b:did_indent")
   finish
endif

let b:did_indent = 1

setlocal indentexpr=GetCIndent(v:lnum)

if exists("*GetCIndent")
  finish
endif


function! s:ComparePos(pos1, pos2)
  if a:pos1[0] > a:pos2[0] | return a:pos1 | endif
  if a:pos1[0] < a:pos2[0] | return a:pos2 | endif
  if a:pos1[1] > a:pos2[1] | return a:pos1 | endif
  if a:pos1[1] < a:pos2[1] | return a:pos2 | endif

  return a:pos1
endfunction

function! GetCIndent(linum)
  if a:linum == 0 | return 0 | endif

  " skip string & comment
  let skip = 'synIDattr(synID(line("."), col("."), 0), "name") =~? "string\\|comment"'

  " search for paren
  let p1 = searchpairpos('(', '', ')', 'b', skip)
  let p2 = searchpairpos('\[', '', '\]', 'b', skip)

  " dont care parens below a:linum
  if p1[0] >= a:linum | let p1 = [0, 0] | endif
  if p2[0] >= a:linum | let p2 = [0, 0] | endif

  let p = s:ComparePos(p1, p2)

  if p[1] != 0
    return p[1] - 1
  endif

  " fallback to cindent
  return cindent(a:linum)
endfunction


