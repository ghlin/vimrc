let s:ginit_override_rc = expand('~/.ginit.vim')
let g:gui_running       = 1

if filereadable(s:ginit_override_rc)
  exec 'source ' . s:ginit_override_rc
elseif exists('g:GtkGuiLoaded')
  call rpcnotify(1, 'Gui', 'Font', 'Iosevka SS10 Medium 16')
  call rpcnotify(1, 'Gui', 'Popupmenu', 0)
  colorscheme Paperlike
elseif exists('g:gnvim')
  colorscheme an-old-hope
  set guifont=Iosevka\ SS10\ Medium:h18
else
  " Guifont!      IBM\ Plex\ Mono:h14
  "silent GuiFont!      Consolas:h13
  " silent set guifont=Consolas:h13
  let g:prefered_colorscheme = 'xcodelighthc'
  GuiFont! Lucida\ Console:h11
  GuiPopupmenu  0
  GuiTabline    0
  " colorscheme   jellybeans
  hi! link CocFloating PMenu
endif

