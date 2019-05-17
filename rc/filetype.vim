autocmd! BufEnter,BufRead *.md   setlocal ft=markdown
autocmd! BufEnter,BufRead *.ejs  setlocal ft=ejs
autocmd! BufEnter,BufRead *.gyp  setlocal ft=json
autocmd! BufEnter,BufRead *.tsx  setlocal ft=typescript.tsx
autocmd! BufEnter,BufRead *.jsx  setlocal ft=javascript.jsx
autocmd! FileType json syntax match Comment +\/\/.\+$+

