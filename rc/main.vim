runtime rc/base.vim
runtime rc/mappings.vim
runtime rc/filetype.vim
runtime rc/langspec.vim
runtime rc/terminal.vim
runtime rc/plugins.vim

" make a scratch buffer on startup when
" no command line arguments passed

let s:startup_buffer_loaded = 0
let s:session_path          = join([ $HOME, '.vim', 'sessions' ], '/')
let s:session_by_time       = { }
let s:session_by_file       = { }

function! s:make_session()
  let l:this_session = get(v:, 'this_session')
  let cwd            = getcwd()
  let time           = strftime('%Y-%m-%d %H:%M')
  let session_name   = printf('%s.session.vim', time)
  let session_file   = join([ s:session_path, session_name ], '/')
  let project        = ProjectNameGuess()
  let project_dir    = expand(get(get(s:session_by_file, l:this_session, { }), 'working_dir'))

  if !empty(l:this_session) && cwd == project_dir
    let session_file = l:this_session
  endif

  let metainfo = { 'working_dir': cwd, 'project': project, 'time': time, 'file': session_file }
  let metaline = json_encode(metainfo)

  let temp_file = tempname()
  execute 'mksession' fnameescape(temp_file)

  let lines        = [ '" ' . metaline ] + readfile(temp_file)

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
    let lines             = readfile(session_file)
    let metaline          = lines[0][2:]
    let metainfo          = json_decode(metaline)
    let session_directory = s:unify_session_directory(get(metainfo, 'working_dir'))
    let session_time      = get(metainfo, 'time')

    let s:session_by_time[session_time] = metainfo
    let s:session_by_file[session_file] = metainfo
  endfor
endfunction

function! s:try_get_session(line)
  let match_result = matchstrpos(a:line, '.*\*\d\d\d\d-\d\d-\d\d \d\d:\d\d\*')
  if match_result[1] != -1
    let session_time = match_result[0][4:-2]
    let session_meta = get(s:session_by_time, session_time, ['','',''])
    return get(session_meta, 'file')
  else
    return ''
  endif
endfunction

function! LoadSessionUnderCursor()
  let session_file = s:try_get_session(getline('.'))
  if filereadable(session_file)
    execute 'source' fnameescape(session_file)
    let g:current_session = session_file
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
  let has_sessions = empty(s:session_by_time) == 0

  if has_sessions
    call append(line('^'), '# Sessions')

    for session_meta in values(s:session_by_time)
      let session_time      = get(session_meta, 'time')
      let session_directory = get(session_meta, 'working_dir')
      let session_project   = get(session_meta, 'project')
      call append(line('$'), printf(' * *%s* `%s :: %s`', session_time, session_project, session_directory))
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

