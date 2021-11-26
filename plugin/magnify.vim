function! s:get_visual_selection()
    " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    return getline(line_start, line_end)
endfunction

function! s:magnify()
  let filename = expand('%:p')
  let content = s:get_visual_selection()
  let filetype = &ft

  tabedit
  call append(line('^'), content)
  exec 'setlocal ft=' . filetype
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal buflisted
  setlocal noswapfile

  exec 'file ' . filename . ' \[Magnified]'
  " silent Goyo 90%
endfunction

command! -range -nargs=0 Magnify :call s:magnify()
