if exists('g:GtkGuiLoaded')
  call rpcnotify(1, 'Gui', 'Font', 'Iosevka SS10 Medium 16')
  call rpcnotify(1, 'Gui', 'Popupmenu', 0)
  colorscheme Paperlike
elseif exists('g:gnvim')
  colorscheme an-old-home
  set guifont=Iosevka\ SS10\ Medium:h18
else
  Guifont Iosevka SS10 Medium:h16
endif

