
" {{{ Unite
if !has('nvim')
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
  call unite#filters#sorter_default#use(['sorter_ranker'])
else
  call denite#custom#map('normal', '<C-n>', '<denite:move_to_next_line>')
  call denite#custom#map('normal', '<C-p>', '<denite:move_to_previous_line>')
  call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>')
  call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>')
end
" }}}

