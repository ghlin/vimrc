" setup unite/denite
if !has('nvim')
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
  " call unite#filters#sorter_default#use(['sorter_ranker'])
else
  " ['ag', '--follow', '--nocolor', '--nogroup', '-g', '']
  call denite#custom#var('file/rec', 'command',
        \ ['fd', '--type', 'f', ''])

  call denite#custom#var('grep', 'command', ['ag'])
  call denite#custom#var('grep', 'default_opts', [ '-i', '--vimgrep' ])
  call denite#custom#var('grep', 'pattern_opt', [])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])

  function! s:update_denite_options() abort
    let denite_options = {
          \ 'prompt': '> ',
          \ 'start_filter': 1,
          \ 'split': 'floating',
          \ 'auto_resize': 1,
          \ 'highlight_filter_background': 'Pmenu',
          \ 'highlight_prompt': 'Pmenu',
          \ 'direction': 'dynamicbottom',
          \ 'winwidth': &columns,
          \ 'wincol': 0,
          \ 'winheight': 10,
          \ 'winrow': &lines - 12
          \ }
    call denite#custom#option('default', denite_options)
  endfunction

  augroup DeniteSettings
    autocmd!

    autocmd VimResized * :call s:update_denite_options()
  augroup END

  call s:update_denite_options()
end

set wildignore^=$HOME/.vim/plugs/*
