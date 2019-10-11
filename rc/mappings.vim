"" general mappings

" switch window via leader-key
nnoremap <leader>w <C-w>

" z-z to leave insert mode
inoremap zz <ESC>

nnoremap <leader>\\ :nohl<CR>

map  <M-w> <ESC>:close<CR>
imap <M-w> <ESC>:close<CR>
map  <M-s> <ESC>:w<CR>
imap <M-s> <ESC>:w<CR>
map  <M-q> <ESC>:q<CR>
imap <M-q> <ESC>:q<CR>
map  <M-f> <ESC>:find 
imap <M-f> <ESC>:find 

com! -bang -nargs=? Q    :close
com! -bang -nargs=? Qa   :qa
com! -bang -nargs=? W    :w
com! -bang -nargs=? Wa   :wa
com! -bang -nargs=? Wqa  :wqa

" jump out of a ()
inoremap <C-q> <esc>f)a
" jump out of a []
"inoremap <C-b> <esc>f]a
" jump out of a {}
"inoremap <C-]> <esc>f}a

" toggle fold
nnoremap <silent> <leader>z      @=(foldlevel(line('.')) == 0 ? '<space>' : (foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" create / navigate to a file within the same directory of
" the currently-editing file
function! NavigateToOrCreateFilePrompt()
  call inputsave()
  let newfile = input('Goto/New: ', expand('%:p:h') . '/', "file")
  call inputrestore()

  if !empty(newfile)
    exec 'e' newfile
  endif
endfunction

nnoremap <M-n> :call NavigateToOrCreateFilePrompt()<CR>
nnoremap <M-g> :call NavigateToOrCreateFilePrompt()<CR>

com! -nargs=0 LCD           :lcd       %:h
com! -nargs=0 CD            :cd        %:h

" delete this file
com! -nargs=0 RmThis        :!rm       -v %

" when forget `sudo'
com! -nargs=0 SudoSave     :w !sudo tee % &>/dev/null

function! TogglePaperlikeMode()
  if get(g:, 'colors_name', 'default') == 'Paperlike'
    colorscheme default
  else
    colorscheme Paperlike
  endif
endfunction

nnoremap <M-S-h> :call TogglePaperlikeMode()<CR>

