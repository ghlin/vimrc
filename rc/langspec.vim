let s:lang_spec_table = {
      \ 'sh': { 'iskeyword_extra': '-' },
      \ 'haskell': { 'iskeyword_extra': "'" },
      \ 'python': { 'foldmethod': 'indent' }
      \ }

function! s:LangSpecHook()
  let spec = get(s:lang_spec_table, &ft, { })
  let keyword_extra = get(spec, 'iskeyword_extra', '')
  if keyword_extra != ''
    let &iskeyword = &iskeyword . ',' . keyword_extra
  endif
  let foldmethod = get(spec, 'foldmethod', &foldmethod)
  let &foldmethod = foldmethod
endfunction

let s:lang_spec_proto_table = {
      \ 'sh': { 'content': [ '#!/bin/sh' ] },
      \ 'PKGBUILD': { 'proto': '/usr/share/pacman/PKGBUILD-vcs.proto' }
      \ }
function! s:LangSpecProtoHook()
  let spec = get(s:lang_spec_proto_table, &ft, { })
  let content = get(spec, 'content', [])
  if len(content) != 0
    call append(0, content)
  endif
  let proto = get(spec, 'proto', '')
  if proto != ''
    execute "0r " . proto
  endif
  echo "LangSpecProtoHook"
endfunction

augroup langspec
  autocmd BufEnter,BufRead  * :call s:LangSpecHook()
  autocmd BufNewFile        * :call s:LangSpecProtoHook()
augroup END
