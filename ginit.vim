if exists('g:GtkGuiLoaded')
  call rpcnotify(1, 'Gui', 'Font', 'Iosevka SS10 Medium 16')
  call rpcnotify(1, 'Gui', 'Popupmenu', 0)
  colorscheme Paperlike
elseif exists('g:gnvim')
  colorscheme an-old-hope
  set guifont=Iosevka\ SS10\ Medium:h18
else
  Guifont!      IBM\ Plex\ Mono:h14
  GuiPopupmenu  0
  GuiTabline    0
  colorscheme   jellybeans
  hi! link CocFloating PMenu
endif

