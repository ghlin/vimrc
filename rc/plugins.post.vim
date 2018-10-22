" setup unite/denite
if !has('nvim')
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
  call unite#filters#sorter_default#use(['sorter_ranker'])
else
  call denite#custom#map('normal', '<C-n>', '<denite:move_to_next_line>')
  call denite#custom#map('normal', '<C-p>', '<denite:move_to_previous_line>')
  call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>')
  call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>')

  call denite#custom#var('file/rec', 'command', ['scantree.py'])

  call denite#custom#var('grep', 'command', ['ag'])
  call denite#custom#var('grep', 'default_opts', [ '-i', '--vimgrep' ])
  call denite#custom#var('grep', 'pattern_opt', [])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])
end
