hi! clear
set bg&
syntax reset

hi! clear Visual
hi! Visual cterm=inverse

" hi! Pmenu  cterm=none  ctermbg=Magenta ctermfg=Black

hi! clear Folded
hi! Folded cterm=italic

hi! clear Statement
hi! Statement ctermfg=DarkBlue

hi! clear StorageClass
hi! StorageClass cterm=none ctermfg=DarkBlue

hi! clear VertSplit
hi! VertSplit cterm=none

hi! clear SignColumn
hi! SignColumn ctermfg=DarkRed  ctermbg=none

hi! DiffAdd    ctermfg=Black
hi! DiffText   ctermfg=Black
hi! DiffChange ctermfg=Black
hi! DiffDelete ctermfg=Black

" TODO: what if terminal's colorscheme has a light background?
hi! TabLineSel  ctermfg=White ctermbg=Black cterm=bold,italic,underline
hi! TabLine     ctermfg=Gray  ctermbg=Black cterm=underline
hi! TabLineFill ctermfg=Gray  ctermbg=Black cterm=underline

hi! CocFloating ctermbg=235

hi! Pmenu     ctermfg=15     ctermbg=232
hi! PmenuSel  ctermfg=White  ctermbg=235    cterm=italic,bold
hi! Type      ctermfg=Green

hi! clear MatchParen
hi! MatchParen cterm=underline,italic gui=underline,italic
hi! NonText    cterm=none             ctermfg=19

hi! ColorColumn ctermbg=233

hi! clear CursorLine
hi! CursorLine ctermbg=235
" hi! link typescriptReserved Normal

hi! Cursor     ctermfg=White ctermbg=Magenta
hi! NonText    ctermfg=235

let colors_name="daily"
