hi clear

set nocul
let colors_name = "an-old-hope"

"  Black    Red    Green  Yellow   Blue   Magenta  Cyan    Gray
" #000000 #B11400 #029004 #DBD600 #0040ED #8D00A4 #007E80 #D4D4D4
" #5E5E5E #EF2929 #00D30D #FCE94F #0077FF #B75FAD #34E2E2 #FFFFFF
" #E5E6E6 #EA3556 #3EBD92         #5193E2                 #EDE5E2
"         #CB4054 #8EBB6A #DFCD60 #61D2D6
"         #ED146F         #D37A35 #77B3D6
"                                 #9BF0E9
"                                 #007792

hi Normal           gui=none            guifg=#E5E6E6           guibg=#000000
hi Comment          gui=none            guifg=#5E5E5E
hi Constant         gui=none            guifg=#7E7E7E
hi DiffAdd                                                      guibg=#0040ED
hi DiffChange                                                   guibg=#00D30D
hi DiffDelete                           guifg=#0077FF           guibg=#B11400
hi DiffText                                                     guibg=#D4D4D4
hi Directory                            guifg=#0077FF
hi ErrorMsg                             guifg=#FFFFFF           guibg=#B11400
hi FoldColumn                           guifg=#61D2D6           guibg=bg
hi Folded                               guifg=#5E5E5E           guibg=bg
hi Identifier       gui=bold            guifg=#0077FF
hi IncSearch        gui=reverse
hi MatchParen       gui=none            guifg=#DFCD60           guibg=bg
hi ModeMsg          gui=bold
hi MoreMsg          gui=bold            guifg=#029004
hi NonText                              guifg=#333333
hi Pmenu                                                        guibg=#5E5E5E
hi PmenuSel                             guifg=#FFFFFF           guibg=#B75FAD
hi PreProc          gui=none            guifg=#3EBD92
hi Question                             guifg=#3EBD92
hi Search                               guifg=#FFFFFF           guibg=#EF2929
hi Special          gui=none            guifg=#ED146F
hi SpecialKey                           guifg=#CB4054
hi Statement        gui=bold            guifg=#3EBD92
hi TabLine          gui=none                                    guibg=bg
hi TabLineFill      gui=none
hi TabLineSel       gui=bold            guifg=#FFFFFF           guibg=#5E5E5E
hi Title                                guifg=#0077FF
hi Todo             gui=underline,bold  guifg=#EF2929           guibg=bg
hi Type             gui=none            guifg=#B75FAD
hi VertSplit        gui=none            guifg=#232323           guibg=#000000
hi Visual           gui=reverse                                 guibg=bg
hi VisualNOS        gui=underline,bold
hi WarningMsg                           guifg=#B11400
hi WildMenu                             guifg=#FFFFFF           guibg=#EF2929

"just patch here
hi clear CursorLineNr
hi clear CursorLine
hi clear ColorColumn
hi clear LineNr
hi clear StatusLine
hi clear StatusLineNC

hi! ColorColumn                                                 guibg=#D4D4D4
hi! CursorLine       gui=none                                   guibg=#181818
hi! CursorLineNr     gui=bold           guifg=#5193E2           guibg=#181818
hi! LineNr           gui=none           guifg=#5E5E5E           guibg=#181818
hi! StatusLine                          guifg=#FFFFFF           guibg=#0077FF
hi! StatusLineNC                        guifg=#000000           guibg=#5E5E5E

"hi! link Operator          Folded

hi! link cInclude          PreProc
hi! link cPreProc          PreProc
hi! link cDefine           PreProc
hi! link cPreCondit        PreProc
hi! link cParen            Operator

