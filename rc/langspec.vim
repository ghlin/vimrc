let s:language_setups = { }

function! s:local_chdir()
  silent! lcd %:p:h
endfunction

function! s:setup_shell()
  setlocal iskeyword  ^=-
  setlocal iskeyword  -=$

  let &l:makeprg = printf('shellcheck %s', expand('%'))
endfunction

function! s:language_setups['sh']()
  call s:setup_shell()
endfunction

function! s:language_setups['bash']()
  call s:setup_shell()
endfunction

function! s:language_setups['zsh']()
  call s:setup_shell()
endfunction

function! s:language_setups['haskell']()
  setlocal formatprg=brittany
  setlocal matchpairs=(:),[:],{:}
  " setlocal signcolumn=yes
  if !has_key(b:, 'project_root')
    let l:project_root = projectroot#get()
    let l:stack_yaml       = printf('%s/stack.yaml', l:project_root)
    if !filereadable(l:stack_yaml)
      " not a stack based project.
      return
    endif

    let b:project_root = l:project_root
  endif

  let &l:makeprg = printf('cd %s && stack build', b:project_root)
  " TODO: stack repl via :terminal
  " let b:run_this = printf('cd %s && stack repl', b:project_root)
endfunction

function! s:language_setups['python']()
  setlocal foldmethod =indent
endfunction

function! s:language_setups['javascript']()
  let b:run_this = printf('node %s', expand('%'))
endfunction

function! s:language_setups['typescript']()
  let b:run_this = printf('ts-node %s', expand('%'))
endfunction

function! s:language_setups['c']()
  " call s:local_chdir()
endfunction

function! s:language_setups['cpp']()
  " call s:local_chdir()
endfunction

function! s:setup_language_spec_settings()
  if has_key(b:, 'done_set_lang_spec_settings') || !has_key(s:language_setups, &ft)
    return
  endif
  let b:done_set_lang_spec_settings = 1

  call s:language_setups[&ft]()

  if has_key(b:, 'run_this')
    command! -nargs=0 RunThis      :exec '!' b:run_this
  endif
endfunction

augroup PerLanguageSettings
  autocmd!
  autocmd BufEnter,BufRead  * :call s:setup_language_spec_settings()
augroup END
