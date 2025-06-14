" general mappings

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

xnoremap <C-Insert>     "+y
vnoremap <C-Insert>     "+y
nnoremap <S-Insert>     "+p
inoremap <S-Insert>     <CR>"+p

xnoremap <M-y>     "+y
vnoremap <M-y>     "+y

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

" <C-/> is actually <C-_> for some reason...
inoremap       <C-_>       <C-o>dT/
inoremap       <C-/>       <C-o>dT/
cnoremap <expr><C-_>       &cedit . 'dT/<C-c>'
cnoremap <expr><C-/>       &cedit . 'dT/<C-c>'

" toggle fold
nnoremap <silent> <leader>z      @=(foldlevel(line('.')) == 0 ? '<space>' : (foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" create / navigate to a file within the same directory of
" the currently-editing file
function! s:NavigateToOrCreateFilePrompt(verb)
  call inputsave()

  echohl None

  let cwd          = getcwd()
  let cwd_slash    = cwd . '/'
  let buf_dir      = expand('%:p:h')
  let inside_cwd   = buf_dir[0:len(cwd) - 1] ==# cwd
  let default_text = inside_cwd ? buf_dir[len(cwd) + 1:-1] : buf_dir

  if len(default_text)
    let default_text = default_text . '/'
  endif

  let newfile = inside_cwd
        \ ? cwd_slash . input('Goto/New: ' . cwd_slash, default_text, 'file')
        \ :             input('Goto/New: ',             default_text, 'file')

  call inputrestore()

  if !empty(newfile) && (!inside_cwd || newfile != cwd_slash)
    exec a:verb . ' ' . newfile
  endif
endfunction

nnoremap <silent><M-n> :call <SID>NavigateToOrCreateFilePrompt('e')<CR>
nnoremap <silent><M-v> :call <SID>NavigateToOrCreateFilePrompt('vs')<CR>

com! -nargs=0 LCD           :lcd       %:h
com! -nargs=0 CD            :cd        %:h

" delete this file
com! -nargs=0 RmThis        :!rm       -v %

" when forget `sudo'
com! -nargs=0 SudoSave     :w !sudo tee % &>/dev/null

function! s:TogglePaperlikeMode()
  if get(g:, 'colors_name', 'default') == 'Paperlike'
    silent exec 'colorscheme ' . g:prefered_colorscheme
  else
    silent colorscheme Paperlike
  endif

  echo 'Colorscheme set to: ' . g:colors_name
endfunction

nnoremap <silent><M-S-h> :call <SID>TogglePaperlikeMode()<CR>

" Search only over a visual range.
vnoremap g/ <Esc>/\%><C-R>=line("'<")-1<CR>l\%<<C-R>=line("'>")+1<CR>l
vnoremap g? <Esc>?\%><C-R>=line("'<")-1<CR>l\%<<C-R>=line("'>")+1<CR>l

" command line mappings (readline style).
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
