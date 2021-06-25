autocmd! BufEnter,BufRead *.md   setlocal ft=markdown
autocmd! BufEnter,BufRead *.ejs  setlocal ft=ejs
autocmd! BufEnter,BufRead *.gyp  setlocal ft=json
autocmd! BufEnter,BufRead *.tsx  setlocal ft=typescriptreact
autocmd! BufEnter,BufRead *.jsx  setlocal ft=javascriptreact
autocmd! FileType json syntax match Comment +\/\/.\+$+

