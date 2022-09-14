let s:dict   = {}
let s:loaded = 0

function! s:read_cdb(cdbpath)
  let sql = 'select T.id id, name, desc, atk, def,
        \ ((level & 0x00FF))       level,
        \ ((level >> 24) & 0x00FF) scale,
        \ case
        \   when ((race & 0x000000000001) <> 0) then "WARRIOR"
        \   when ((race & 0x000000000002) <> 0) then "SPELLCASTER"
        \   when ((race & 0x000000000004) <> 0) then "FAIRY"
        \   when ((race & 0x000000000008) <> 0) then "FIEND"
        \   when ((race & 0x000000000010) <> 0) then "ZOMBIE"
        \   when ((race & 0x000000000020) <> 0) then "MACHINE"
        \   when ((race & 0x000000000040) <> 0) then "AQUA"
        \   when ((race & 0x000000000080) <> 0) then "PYRO"
        \   when ((race & 0x000000000100) <> 0) then "ROCK"
        \   when ((race & 0x000000000200) <> 0) then "WINDBEAST"
        \   when ((race & 0x000000000400) <> 0) then "PLANT"
        \   when ((race & 0x000000000800) <> 0) then "INSECT"
        \   when ((race & 0x000000001000) <> 0) then "THUNDER"
        \   when ((race & 0x000000002000) <> 0) then "DRAGON"
        \   when ((race & 0x000000004000) <> 0) then "BEAST"
        \   when ((race & 0x000000008000) <> 0) then "BEASTWARRIOR"
        \   when ((race & 0x000000010000) <> 0) then "DINOSAUR"
        \   when ((race & 0x000000020000) <> 0) then "FISH"
        \   when ((race & 0x000000040000) <> 0) then "SEASERPENT"
        \   when ((race & 0x000000080000) <> 0) then "REPTILE"
        \   when ((race & 0x000000100000) <> 0) then "PSYCHO"
        \   when ((race & 0x000000200000) <> 0) then "DEVINE"
        \   when ((race & 0x000000400000) <> 0) then "CREATORGOD"
        \   when ((race & 0x000000800000) <> 0) then "WYRM"
        \   when ((race & 0x000001000000) <> 0) then "CYBERSE"
        \   else null
        \ end race,
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
        \   else null
        \ end attr
        \ from texts T, datas D
        \ where T.id = D.id'
  let entries = json_decode(system("(echo '.mode json'; echo '" .. sql .. ";') | sqlite3 " .. a:cdbpath))
  for entry in entries
    let s:dict[string(entry['id'])] = entry
  endfor
  let s:loaded = 1
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

function! s:show_preview_window()
  let l:command = "silent! pedit! +setlocal\\ " .
                \ "buftype=nofile\\ nobuflisted\\ " .
                \ "noswapfile\\ nonumber\\ wrap __YGOINFO__"

  exe l:command
endfunction

function! s:lookup_and_display(word)
  if !s:loaded
    call s:read_cdb(g:cdbpath)
  endif

  let l:code  = substitute(a:word, "\\\D", '', 'g')
  if has_key(s:dict, l:code) == 0
    return
  endif

  let l:found = s:dict[l:code]
  let l:lines = []

  call add(l:lines, '   Code:  ' . l:code)
  call add(l:lines, '   Name:  ' . l:found['name'])

  let types = []
  for k in s:tkeys
    if l:found['_' .. k]
      call add(types, k)
    endif
  endfor

  call add(l:lines, '   Type:  ' . join(types, ', '))

  if l:found['_MONSTER']
    call add(l:lines, '   Attr:  ' . l:found['attr'])
    call add(l:lines, '   Race:  ' . l:found['race'])
    if l:found['_LINK']
      call add(l:lines, '   Link:  ' . l:found['level'])
      call add(l:lines, '   Atk:   ' . l:found['atk'])
    elseif l:found['_XYZ']
      call add(l:lines, '   Rank:  ' . l:found['level'])
      call add(l:lines, '   Atk:   ' . l:found['atk'])
      call add(l:lines, '   Def:   ' . l:found['def'])
    else
      call add(l:lines, '   Level: ' . l:found['level'])
      call add(l:lines, '   Atk:   ' . l:found['atk'])
      call add(l:lines, '   Def:   ' . l:found['def'])
    endif
  endif

  for l:line in split(l:found['desc'], '\n', 0)
    call add(l:lines, substitute(l:line, '\\\r', '', 'g'))
  endfor

  if &previewwindow
    " if not?
  else
    call s:show_preview_window()
  endif

  let l:bufnr = bufnr("__YGOINFO__")

  call nvim_buf_set_lines(l:bufnr, 0, -1, 0, l:lines)
endfunction

nnoremap <silent><F8> :call <SID>lookup_and_display(expand("<cword>"))<CR>
command! YLookup      call <SID>lookup_and_display(expand("<cword>"))

" test: 44508094
" test: 10000
"
