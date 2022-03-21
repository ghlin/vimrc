let s:dict   = {}
let s:loaded = 0

function! s:read_cdb(cdbpath)
  let entries =
        \ json_decode(
        \   system("(echo '.mode json'; echo 'select id, name, desc from texts;') | sqlite3 " .. a:cdbpath)
        \ )
  for entry in entries
    let s:dict[string(entry['id'])] = entry
  endfor
  let s:loaded = 1
endfunction

function! s:lookup(code)
  if !s:loaded 
    call s:read_cdb(g:cdbpath)
  endif

  return s:dict[a:code]
endfunction

function! s:lookup_and_display(word)
  let code  = substitute(a:word, "\\\D", '', 'g')
  let found = s:lookup(code)
  echo ' id:   ' . found['id']
  echo ' name: ' . found['name']
  echo "\n"
  echo substitute(' ' . found['desc'], "\r", "\\\n", 'g')
  echo "\n"
endfunction

nnoremap <silent><F8> :call <SID>lookup_and_display(expand("<cword>"))<CR>

" test: 44508094
