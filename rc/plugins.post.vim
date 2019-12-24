" setup unite/denite
if !has('nvim')
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
  call unite#filters#sorter_default#use(['sorter_ranker'])
else
  call denite#custom#var('file/rec', 'command',
        \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

  call denite#custom#var('grep', 'command', ['ag'])
  call denite#custom#var('grep', 'default_opts', [ '-i', '--vimgrep' ])
  call denite#custom#var('grep', 'pattern_opt', [])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])

  let s:denite_options = {
        \ 'prompt': '> ',
        \ 'start_filter': 1,
        \ 'split': 'floating',
        \ 'auto_resize': 0,
        \ 'highlight_filter_background': 'Pmenu',
        \ 'highlight_prompt': 'Pmenu',
        \ 'direction': 'dynamicbottom',
        \ 'winwidth': &columns - 6,
        \ 'wincol': 3
        \ }
  call denite#custom#option('default', s:denite_options)
end

set wildignore^=$HOME/.vim/plugs/*
