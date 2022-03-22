let s:dict   = {}
let s:loaded = 0

function! s:read_cdb(cdbpath)
  let sql = 'select T.id id, name, desc, atk, def, level,
        \ ((type & 0x000000000001) <> 0) _MONSTER,
        \ ((type & 0x000000000002) <> 0) _SPELL,
        \ ((type & 0x000000000004) <> 0) _TRAP,
        \ ((type & 0x000000000010) <> 0) _NORMAL,
        \ ((type & 0x000000000020) <> 0) _EFFECT,
        \ ((type & 0x000000000040) <> 0) _FUSION,
        \ ((type & 0x000000000080) <> 0) _RITUAL,
        \ ((type & 0x000000000100) <> 0) _TRAPMONSTER,
        \ ((type & 0x000000000200) <> 0) _SPIRIT,
        \ ((type & 0x000000000400) <> 0) _UNION,
        \ ((type & 0x000000000800) <> 0) _DUAL,
        \ ((type & 0x000000001000) <> 0) _TUNER,
        \ ((type & 0x000000002000) <> 0) _SYNCHRO,
        \ ((type & 0x000000004000) <> 0) _TOKEN,
        \ ((type & 0x000000010000) <> 0) _QUICKPLAY,
        \ ((type & 0x000000020000) <> 0) _CONTINUOUS,
        \ ((type & 0x000000040000) <> 0) _EQUIP,
        \ ((type & 0x000000080000) <> 0) _FIELD,
        \ ((type & 0x000000100000) <> 0) _COUNTER,
        \ ((type & 0x000000200000) <> 0) _FLIP,
        \ ((type & 0x000000400000) <> 0) _TOON,
        \ ((type & 0x000000800000) <> 0) _XYZ,
        \ ((type & 0x000001000000) <> 0) _PENDULUM,
        \ ((type & 0x000002000000) <> 0) _SPSUMMON,
        \ ((type & 0x000004000000) <> 0) _LINK,
        \ case
        \   when ((attribute & 0x000000000001) <> 0) then "EARTH"
        \   when ((attribute & 0x000000000002) <> 0) then "WATER"
        \   when ((attribute & 0x000000000004) <> 0) then "FIRE"
        \   when ((attribute & 0x000000000008) <> 0) then "WIND"
        \   when ((attribute & 0x000000000010) <> 0) then "LIGHT"
        \   when ((attribute & 0x000000000020) <> 0) then "DARK"
        \   when ((attribute & 0x000000000040) <> 0) then "DEVINE"
        \   else attribute end attr
        \ from texts T, datas D
        \ where T.id = D.id'
  let entries = json_decode(system("(echo '.mode json'; echo '" .. sql .. ";') | sqlite3 " .. a:cdbpath))
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

let s:tkeys = [
      \   'MONSTER'
      \ , 'SPELL'
      \ , 'TRAP'
      \ , 'NORMAL'
      \ , 'EFFECT'
      \ , 'FUSION'
      \ , 'RITUAL'
      \ , 'TRAPMONSTER'
      \ , 'SPIRIT'
      \ , 'UNION'
      \ , 'DUAL'
      \ , 'TUNER'
      \ , 'SYNCHRO'
      \ , 'TOKEN'
      \ , 'QUICKPLAY'
      \ , 'CONTINUOUS'
      \ , 'EQUIP'
      \ , 'FIELD'
      \ , 'COUNTER'
      \ , 'FLIP'
      \ , 'TOON'
      \ , 'XYZ'
      \ , 'PENDULUM'
      \ , 'SPSUMMON'
      \ , 'LINK'
      \ ]

function! s:lookup_and_display(word)
  let code  = substitute(a:word, "\\\D", '', 'g')
  let found = s:lookup(code)
  echo repeat('-', &columns)
  echo ' id:    ' . found['id']
  echo ' name:  ' . found['name']

  let types = []
  for k in s:tkeys
    if found['_' .. k]
      call add(types, k)
    endif
  endfor

  echo ' type:  ' . join(types, ', ')

  if found['_MONSTER']
    if found['_LINK']
      echo ' Link:  ' . found['level']
      echo ' Atk:   ' . found['atk']
    elseif found['_XYZ']
      echo ' Rank:  ' . found['level']
      echo ' Atk:   ' . found['atk']
      echo ' Def:   ' . found['def']
    else
      echo ' Level: ' . found['level']
      echo ' Atk:   ' . found['atk']
      echo ' Def:   ' . found['def']
    endif
  endif

  echo "\n"
  echo substitute(found['desc'], "\r", "\\\n", 'g')
  echo repeat('-', &columns)
endfunction

nnoremap <silent><F8> :call <SID>lookup_and_display(expand("<cword>"))<CR>

" test: 44508094
"
