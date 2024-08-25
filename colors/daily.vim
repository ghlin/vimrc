hi! clear
" set bg&
syntax reset

hi! clear Visual
hi! Visual ctermbg=none ctermfg=13 cterm=inverse

" hi! Pmenu  cterm=none  ctermbg=Magenta ctermfg=Black

hi! clear Folded
hi! Folded   ctermfg=245 cterm=none
hi! Comment  ctermfg=245

hi! clear Statement
hi! Statement ctermfg=DarkBlue
hi! clear Operator
hi! link Operator Normal

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

hi! clear CocFloating
hi! link  CocFloating Normal

hi! clear CocListLine
hi! link  CocListLine CocMenuSel

hi! clear CocMenuSel
hi! CocMenuSel cterm=inverse,bold

hi! clear IncSearch
hi! clear Search
hi! clear CurSearch

hi! link IncSearch Search
hi! link Search    Normal
hi! link CurSearch Normal
hi! Search      cterm=inverse
hi! CurSearch   cterm=inverse,underline

hi! Pmenu     ctermfg=7  ctermbg=0
hi! PmenuSel  ctermfg=0  ctermbg=15    cterm=italic,bold
hi! Type      ctermfg=DarkGreen

hi! clear Constant
hi! Constant ctermfg=247

hi! clear Special
hi! Special ctermfg=Blue cterm=none

hi! clear MatchParen
hi! MatchParen cterm=underline,bold   gui=underline,italic
hi! NonText    cterm=none             ctermfg=19

hi! ColorColumn ctermbg=233

hi! clear CursorLine
hi! link CursorLine Underline
hi! link CursorLine Underline
" hi! link typescriptReserved Normal
" hi! link typescriptInterpolationDelimiter Keyword
" hi! link typescriptInterpolation          Keyword

hi! Cursor     ctermfg=7* ctermbg=Magenta
hi! NonText    ctermfg=243

hi! Identifier cterm=none

let colors_name="daily"
