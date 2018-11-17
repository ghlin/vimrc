let s:language_setups = { }

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
  if !has_key(b:, 'project_root_ghc')
    let l:project_root_ghc = projectroot#get()
    let l:stack_yaml       = printf('%s/stack.yaml', l:project_root_ghc)
    if !filereadable(l:stack_yaml)
      echoerr 'Not a stack based project'
      return
    endif

    let b:project_root_ghc = l:project_root_ghc
  endif

  let &l:makeprg = printf('cd %s && stack build', b:project_root_ghc)
  " TODO: stack repl via :terminal
  " let b:run_this = printf('cd %s && stack repl', b:project_root_ghc)
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

function! s:LangSpecHook()
  if !has_key(s:language_setups, &ft)
    return
  endif

  let before = has_key(b:, 'run_this')
  call s:language_setups[&ft]()
  let after = has_key(b:, 'run_this')

  if !before && after
    command! -nargs=0 RunThis      :exec '!' b:run_this
  endif
endfunction

augroup langspec
  autocmd BufEnter,BufRead  * :call s:LangSpecHook()
augroup END
