hi clear

set nocul
set background=light
let colors_name = "Paperlike"

hi! clear Statement
hi! clear NormalFloat

hi!  Normal           term=none cterm=none                   ctermfg=Black              ctermbg=none
hi!  Comment          term=none cterm=italic,bold            ctermfg=DarkGray           ctermbg=White
hi!  Constant         term=none cterm=none                   ctermfg=DarkGray
hi!  DiffAdd          term=none cterm=bold                   ctermfg=White              ctermbg=DarkGray
hi!  DiffChange       term=none cterm=italic                 ctermfg=Black              ctermbg=253
hi!  DiffDelete       term=none cterm=none                   ctermfg=Black              ctermbg=none
hi!  DiffText         term=none cterm=none                   ctermfg=White              ctermbg=Black
hi!  Directory        term=none cterm=underline              ctermfg=Black
hi!  FoldColumn       term=none cterm=none                   ctermfg=242                ctermbg=none
hi!  Folded           term=none cterm=italic                 ctermfg=Black              ctermbg=none
hi!  Identifier       term=none cterm=none                   ctermfg=Black
hi!  IncSearch        term=none cterm=italic,underline
hi!  MatchParen       term=none cterm=underline,bold,italic  ctermfg=Black              ctermbg=none
hi!  ModeMsg          term=none cterm=bold
hi!  MoreMsg          term=none cterm=none                   ctermfg=Black
hi!  NonText          term=none cterm=none                   ctermfg=253
hi!  Pmenu            term=none cterm=none                   ctermfg=White              ctermbg=Black
hi!  PmenuSel         term=none cterm=underline,bold,italic  ctermfg=Black              ctermbg=none
hi!  PreProc          term=none cterm=none                   ctermfg=Black
hi!  Question         term=none cterm=none                   ctermfg=Black
hi!  Search           term=none cterm=underline,italic       ctermfg=White              ctermbg=242
hi!  Special          term=none cterm=underline,bold         ctermfg=Black              ctermbg=none
hi!  SpecialKey       term=none cterm=underline,bold         ctermfg=Black
hi!  Operator         term=none cterm=none                   ctermfg=Black              ctermbg=None
hi!  Statement        term=none cterm=bold                   ctermfg=Black
hi!  TabLineSel       term=none cterm=bold                   ctermfg=White              ctermbg=Black
hi!  TabLine          term=none cterm=underline              ctermfg=Black              ctermbg=none
hi!  TabLineFill      term=none cterm=underline              ctermfg=Black              ctermbg=none
hi!  Title            term=none cterm=none                   ctermfg=Black
hi!  Todo             term=none cterm=underline,bold         ctermfg=White              ctermbg=Black
hi!  Type             term=none cterm=bold                   ctermfg=Black
hi!  Visual           term=none cterm=bold                   ctermfg=White              ctermbg=DarkGray
hi!  VisualNOS        term=none cterm=underline
hi!  WarningMsg       term=none cterm=bold,italic            ctermfg=Black              ctermbg=none
hi!  ErrorMsg         term=none cterm=bold,italic            ctermfg=Black              ctermbg=none
hi!  WildMenu                                                ctermfg=Black              ctermbg=none
hi!  Error            term=none cterm=italic,strikethrough   ctermfg=DarkRed            ctermbg=none

"just patch here
hi! clear CursorLineNr
hi! clear CursorLine
hi! clear ColorColumn
hi! clear LineNr
hi! clear StatusLine
hi! clear StatusLineNC
hi! clear VertSplit

hi! ColorColumn      cterm=none                                      ctermbg=Black
hi! CursorLine       cterm=inverse,inverse
hi! CursorLineNr     cterm=bold            ctermfg=Black
hi! LineNr           cterm=none            ctermfg=Gray
hi! StatusLine       cterm=bold            ctermfg=White             ctermbg=Black
hi! StatusLineNC                           ctermfg=White             ctermbg=Black
hi! VertSplit                              ctermfg=DarkGray

" for c/cpp
" hi! cStatement     cterm=bold,underline
" hi! cConditional   cterm=bold,underline
" hi! cRepeat        cterm=bold,underline
hi! cType          cterm=bold,underline
" hi! cppStatement   cterm=bold,underline
" hi! cppConditional cterm=bold,underline
" hi! cppRepeat      cterm=bold,underline
hi! cppType        cterm=bold,underline

hi! Delimiter      cterm=bold ctermfg=DarkGray
hi! hsDelimiter    cterm=bold ctermfg=DarkGray
hi! hsStructure    cterm=bold ctermfg=DarkGray
hi! hsOperator     cterm=bold ctermfg=Black

hi! doxygenStartSkip cterm=bold,italic ctermfg=Black
hi! doxygenStart     cterm=bold,italic ctermfg=Black
hi! doxygenComment   cterm=bold,italic ctermfg=Black
hi! doxygenBody      cterm=bold,italic ctermfg=Black

" denite
hi! deniteMatchedChar  cterm=underline,italic,bold ctermfg=Black ctermbg=none
hi! deniteMatchedRange cterm=underline             ctermfg=Black ctermbg=none
hi! CocFloating        ctermbg=250 ctermfg=Black
hi! NormalFloat        ctermbg=250 ctermfg=Black

" make
hi! makeSpecial       cterm=none                   ctermfg=Black ctermbg=none

" ================================== gui ===============================

hi!  Normal           gui=none                   guifg=Black              guibg=White
hi!  Comment          gui=italic,underline       guifg=#999999            guibg=White
hi!  Constant         gui=none                   guifg=#888888
hi!  DiffAdd          gui=none                                            guibg=Black
hi!  DiffChange       gui=italic                 guifg=Black              guibg=#DADADA
hi!  DiffDelete       gui=none                   guifg=White              guibg=Black
hi!  DiffText         gui=none                   guifg=#FFFF00
hi!  Directory        gui=none                   guifg=#585858
hi!  FoldColumn       gui=none                   guifg=#B2B2B2            guibg=none
hi!  Folded           gui=bold,italic,underline  guifg=DarkGray
hi!  Identifier       gui=none                   guifg=Black
hi!  IncSearch        gui=reverse
hi!  MatchParen       gui=underline,bold,italic  guifg=Black              guibg=none
hi!  ModeMsg          gui=bold
hi!  MoreMsg          gui=none                   guifg=Black
hi!  NonText          gui=none                   guifg=#999999
hi!  Pmenu            gui=none                   guifg=White              guibg=Black
hi!  PmenuSel         gui=bold,italic            guifg=Black              guibg=White
hi!  PreProc          gui=none                   guifg=Black
hi!  Question         gui=none                   guifg=Black
hi!  Search           gui=bold,underline,italic  guifg=Black              guibg=White
hi!  Special          gui=bold,underline         guifg=Black
hi!  SpecialKey       gui=bold,underline         guifg=Black
hi!  Operator         gui=none                   guifg=Black              guibg=none
hi!  Statement        gui=bold,underline         guifg=Black
hi!  TabLineSel       gui=bold,underline         guifg=White              guibg=Black
hi!  TabLine          gui=underline              guifg=Black              guibg=White
hi!  TabLineFill      gui=underline              guifg=Black              guibg=White
hi!  Title            gui=none                   guifg=Black
hi!  Todo             gui=underline,bold         guifg=White              guibg=Red
hi!  Type             gui=bold                   guifg=Black
hi!  Visual           gui=bold                   guifg=White              guibg=DarkGray
hi!  VisualNOS        gui=underline
hi!  WarningMsg       gui=bold,italic            guifg=DarkRed            guibg=White
hi!  ErrorMsg         gui=bold,italic            guifg=DarkRed            guibg=White
hi!  WildMenu                                    guifg=Black              guibg=White
hi!  SignColumn       gui=none                                            guibg=White

hi! ColorColumn        gui=none                                        guibg=Black
hi! CursorLine         gui=inverse,inverse
hi! CursorLineNr       gui=bold              guifg=Black
hi! LineNr             gui=none              guifg=Gray
hi! StatusLine         gui=bold              guifg=White               guibg=Black
hi! StatusLineNC                             guifg=White               guibg=Black
hi! VertSplit                                guifg=DarkGray

hi! Delimiter      gui=bold guifg=DarkGray
hi! hsDelimiter    gui=bold guifg=DarkGray
hi! hsStructure    gui=bold guifg=DarkGray
hi! hsOperator     gui=bold guifg=Black

hi! doxygenStartSkip gui=bold,italic guifg=DarkGreen
hi! doxygenStart     gui=bold,italic guifg=DarkGreen
hi! doxygenComment   gui=bold,italic guifg=DarkGreen
hi! doxygenBody      gui=bold,italic guifg=DarkGreen

" denite
hi! deniteMatchedChar  gui=underline,italic,bold guifg=Black    guibg=White
hi! deniteMatchedRange gui=underline             guifg=Black    guibg=White
hi! CocFloating                                  guibg=#DADADA  guifg=Black
hi! NormalFloat                                  guibg=#DADADA  guifg=Black

" make
hi! makeSpecial       gui=none                   guifg=Black    guibg=White

" misc
hi! link Conceal            Normal
hi! link hsExprKeyword      Statement
hi! link shCommandSub       Normal
" hi! link typescriptReserved Normal
