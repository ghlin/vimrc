"" general mappings

" switch window via leader-key
nnoremap <leader>w <C-w>

" z-z to leave insert mode
inoremap zz <ESC>

nnoremap <leader>\\ :nohl<CR>

nnoremap <leader><leader>q   :close<CR>
nnoremap <leader><leader>x   :bd<CR>
nnoremap <leader><leader>X   :bd!<CR>
nnoremap <leader><leader>w   :w<CR>
nnoremap <leader><leader>Q   :wqa<CR>
     map <M-w>               <ESC>:close<CR>
    imap <M-w>               <ESC>:close<CR>
     map <M-s>               <ESC>:w<CR>
    imap <M-s>               <ESC>:w<CR>
     map <M-q>               <ESC>:q<CR>
    imap <M-q>               <ESC>:q<CR>
     map <M-S-q>             <ESC>:wqa<CR>
    imap <M-S-q>             <ESC>:wqa<CR>
     map <M-f>               <ESC>/
    imap <M-f>               <ESC>/
     map <M-S-p>             <ESC>:
    imap <M-S-p>             <ESC>:

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
nnoremap <leader>z      @=(foldlevel(line('.')) == 0 ? '<space>' : (foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" simpler way to navigate-to/create file.
function! NavigateToOrCreateFilePrompt()
  call inputsave()
  let newfile = input('Goto/New: ', expand('%:p:h') . '/', "file")
  call inputrestore()

  if newfile != ""
    exec 'e ' . newfile
  endif
endfunction

nnoremap <M-n> :call NavigateToOrCreateFilePrompt()<CR>
nnoremap <M-g> :call NavigateToOrCreateFilePrompt()<CR>

com! -nargs=0 LCD           :lcd       %:h
com! -nargs=0 CD            :cd        %:h
com! -nargs=0 P             :lcd       ..

" delete this file
com! -nargs=0 RmThis        :!rm       -v %

" ls
com! -nargs=0 LS            :!ls       %:h

" ls -al
com! -nargs=0 LL            :!ls -al   %:h

" when forget `sudo'
com! -nargs=0 SudoSave     :w !sudo tee % &>/dev/null

