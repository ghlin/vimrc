if exists('g:GtkGuiLoaded')
  call rpcnotify(1, 'Gui', 'Font', 'Consolas 15')
else
  Guifont Inconsolata:h16
endif

colorscheme an-old-hope
hi Normal guibg=Black
hi MatchParen gui=italic,underline

hi! clear SignColumn
hi! SignColumn guifg=DarkBlue guibg=Black
