runtime rc/base.vim
runtime rc/mappings.vim
runtime rc/filetype.vim
runtime rc/langspec.vim
runtime rc/terminal.vim
runtime rc/plugins.vim

" make a scratch buffer on startup when
" no command line arguments passed

let s:startup_buffer_loaded = 0
let s:session_path = join([ $HOME, '.vim', 'sessions' ], '/')
let s:session_mapping = { }

function! s:make_session()
  let temp_file = tempname()
  let cwd = getcwd()
  execute 'mksession' fnameescape(temp_file)
  let session_name = strftime('%Y-%m-%d %H:%M.session.vim')
  let lines = [ '" ' . cwd ] + readfile(temp_file)
  let session_file = join([ s:session_path, session_name ], '/')
  call writefile(lines, session_file)
endfunction

function! s:delete_session()
  if !has('v:this_session') | return | endif

  call delete(v:this_session)
endfunction

command! -nargs=0 MkSession :call s:make_session()

function! s:unify_session_directory(dir)
  let home_len = len($HOME)
  let prefix = a:dir[:home_len - 1]
  if prefix == $HOME
    return '~' . a:dir[home_len:]
  else
    return a:dir
  endif
endfunction

function! s:glob_sessions()
  let session_files = split(glob(printf('%s/*.session.vim', s:session_path)), '\n')

  for session_file in session_files
    let lines = readfile(session_file)
    let session_directory = s:unify_session_directory(lines[0][2:])
    let session_time = matchstr(session_file, '\d\d\d\d-\d\d-\d\d \d\d:\d\d')
    let s:session_mapping[session_time] = [ session_file, session_time, session_directory ]
  endfor
endfunction

function! s:try_get_session(line)
  let match_result = matchstrpos(a:line, '.*\*\d\d\d\d-\d\d-\d\d \d\d:\d\d\*')
  if match_result[1] != -1
    let session_time = match_result[0][4:-2]
    let session_file = printf('%s/%s.session.vim', s:session_path, session_time)
    return session_file
  else
    return ''
  endif
endfunction

function! LoadSessionUnderCursor()
  let session_file = s:try_get_session(getline('.'))
  if filereadable(session_file)
    execute 'source' fnameescape(session_file)
  endif
endfunction

function! DeleteSessionUnderCursor()
  let session_file = s:try_get_session(getline('.'))
  if !filereadable(session_file)
    echoerr 'No session to delete!'
    return
  endif

  let choice = confirm(printf('Delete session %s?', session_file), "&yes\n&no", 2, 'W')
  if choice == 0 || choice == 2
    echo 'Canceled'
  else
    if !delete(session_file)
      normal dd
      echo 'Deleted!'
    else
      echoerr 'Cannot delete!'
    endif
  endif
endfunction

function! s:make_scratch_buffer()
  if s:startup_buffer_loaded != 0
    return
  endif

  setlocal filetype=markdown
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal buflisted
  setlocal noswapfile

  call s:glob_sessions()
  let has_sessions = empty(s:session_mapping) == 0

  if has_sessions
    call append(line('^'), '# Sessions')

    for [ session_file, session_time, session_directory ] in values(s:session_mapping)
      call append(line('$'), printf(' * *%s* at `%s`', session_time, session_directory))
    endfor
  endif

  " do we have `task` installed?
  if executable('task')
    if !has_sessions
      call append(line('^'), [ '', '# TODOs' ])
    else
      call append(line('$'), [ '', '# TODOs', '' ])
    endif

    let tasks = json_decode(system("task export"))
    for task in tasks
      let status = get(task, 'status', 'deleted')
      if status != 'deleted' && status != 'completed'
        call append(line('$'), ' * `' . get(task, 'description', '...') . '`')
      endif
    endfor
  elseif !has_sessions
    call append(line('^'), [ "# What to do now?", '' ])
  endif

  nnoremap <buffer> <CR> :call LoadSessionUnderCursor()<CR>
  nnoremap <buffer> <BS> :call DeleteSessionUnderCursor()<CR>

  autocmd! startup VimEnter
  let s:startup_buffer_loaded = 1
endfunction

if argc() == 0
  augroup startup
    autocmd! VimEnter * :call s:make_scratch_buffer()
  augroup END
endif

