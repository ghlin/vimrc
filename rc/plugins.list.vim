" vim:foldmethod=marker:foldlevel=0

" For temporary buffer / scratch
Plug 'shougo/junkfile.vim'
command! -nargs=0 TNote    call junkfile#open_immediately('tmp/' .. '%Y-%m-%d.%H%M%S'->strftime() .. printf("-%08x.txt", rand()))
command! -nargs=0 Scratch  call junkfile#open_immediately('%Y-%m-%d.txt'->strftime())

" {{{ languages

" toggle comments
Plug 'scrooloose/nerdcommenter'


" treesitter is nice.
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" conflicts with coc.nvim (autocomplete html tags)
" comment out for now.
"
" let g:matchup_matchparen_offscreen = {}
" Plug 'andymass/vim-matchup'

" LSP support
hi! link CocMenuSel PMenuSel " FIX: CocMenuSel defaults to unreadable colors

Plug 'neoclide/coc.nvim', { 'do': 'yarn install', 'branch': 'release' }
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}

let g:coc_fzf_preview='up:40%'

" CR to trigger coc completion
inoremap <silent><expr> <cr>        coc#pum#visible() ? coc#pum#confirm() : "<CR>"
inoremap <silent><expr> <c-space>   coc#refresh()

let s:coc_supported_languages = {
      \ 'typescript': 1,
      \ 'typescript.tsx': 1,
      \ 'typescriptreact': 1,
      \ 'javascript': 1,
      \ 'javascript.jsx': 1,
      \ 'javascriptreact': 1,
      \ 'json': 1,
      \ 'python': 1,
      \ 'java': 1,
      \ 'css': 1,
      \ 'scss': 1,
      \ 'c': 1,
      \ 'cpp': 1,
      \ 'vim': 1,
      \ 'vue': 1
      \ }

function! s:UpdateLanguageClient() abort
  if &buftype != 'nofile' && has_key(s:coc_supported_languages, &ft) && g:coc_enabled
    silent call coc#rpc#request('fillDiagnostics', [bufnr('%')])
  endif
endfunction

nnoremap <nowait><expr>  <C-j>  coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-j>"
nnoremap <nowait><expr>  <C-k>  coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-k>"

function! s:SetupKeybindings()
  if has_key(s:coc_supported_languages, &ft)
    nmap     <buffer><silent>       <F2>        <Plug>(coc-rename)
    nmap     <buffer><silent>       <C-]>       <Plug>(coc-definition)
    nmap     <buffer><silent>       gd          <Plug>(coc-definition)
    nmap     <buffer><silent>       gi          <Plug>(coc-implementation)
    nmap     <buffer><silent>       gH          <ESC>:call CocAction('highlight')<CR>
    nmap     <buffer><silent>       <C-\>       <ESC>:call CocAction('definitionHover')<CR>
    nmap     <buffer><silent>       gh          <ESC>:call CocAction('definitionHover')<CR>
    nmap     <buffer><silent>       <F12>       <Plug>(coc-references)
    nmap     <buffer><silent>       gfr         <Plug>(coc-references)
    nmap     <buffer><silent>       <F3>        <Plug>(coc-codeaction)
    xmap     <buffer><silent>       <F3>        <Plug>(coc-codeaction-selected)
    nmap     <buffer><silent>       gaa         <Plug>(coc-codeaction)
    xmap     <buffer><silent>       gaa         <Plug>(coc-codeaction-selected)
    nmap     <buffer><silent>       <M-S-p>     <ESC>:CocCommand<CR>
    nmap     <buffer><silent>       <M-x>       <ESC>:CocCommand<CR>
    nmap     <buffer><silent>       <M-l>       <ESC>:CocFzfList outline<CR>
    vmap     <buffer><silent>       gf          <Plug>(coc-format-selected)
    xmap     <buffer><silent>       gf          <Plug>(coc-format-selected)
    vmap     <buffer><silent>       =           <Plug>(coc-format-selected)
    xmap     <buffer><silent>       =           <Plug>(coc-format-selected)
  else
    nmap     <buffer><silent>       gd          <C-]>
  endif
endfunction

augroup LSPClientSettings
  autocmd!
  autocmd BufRead,BufEnter * :call s:SetupKeybindings()
  autocmd CursorHold       * :call s:UpdateLanguageClient()
augroup END

" Markdown

Plug 'iamcco/markdown-preview.vim'
let g:mkdp_py_version = 3

" C / C++
Plug 'vim-jp/cpp-vim'
Plug 'rhysd/vim-clang-format'

autocmd! FileType c,cpp vnoremap <buffer>gq :ClangFormat<CR>

" XML / HTML
Plug 'mattn/emmet-vim'

let g:user_emmet_leader_key     = '<c-e>'
let g:user_emmet_expandword_key = '<c-e>'
let g:user_emmit_expandabbr_key = '<c-e>'

let g:use_emmet_complete_tag    = 1

" }}}

" pair manip.
Plug 'tpope/vim-surround'
let g:surround_60 = "<\r>"
let g:surround_47 = "</\r>"

" align text easily
Plug 'junegunn/vim-easy-align'
vnoremap <silent> <Enter> :EasyAlign<Enter>

" NerdTree file explorer
Plug 'scrooloose/nerdtree'
nmap <silent> <leader>E :NERDTreeToggle<CR>
nmap <silent> <leader>S :NERDTreeFind<CR>

let g:NERDTreeHighlightCursorline = 0
let g:NERDTreeDirArrows           = 0
let g:NERDTreeWinSize             = 25
let g:NERDTreeMinimalUI           = 1
let g:NERDTreeHijackNetrw         = 1
let g:NERDTreeDirArrowExpandable  = "+"
let g:NERDTreeDirArrowCollapsible = "-"
let g:NERDTreeSortOrder = [
                \   '\/$'
                \ , '\.lst$', '\.txt$', '\.vim$'
                \ , '\.md$'
                \ , '\.lua$'
                \ , '\.run$'
                \ , '*', '\.swp$', '\~$', '.dSYM' ]
let g:NERDTreeIgnore = ['node_modules', '\.swp$', '\~$', '\.dSYM', 'dist', '\.js.map']
let g:NERDTreeQuitOnOpen=0

hi link NERDTreePart     Normal
hi link NERDTreePartFile Normal

" visualize undo tree

let g:undotree_RelativeTimestamp = 0
" let g:gundo_prefer_python3=1
Plug 'mbbill/undotree'

nmap <leader><leader><BS>    :UndotreeToggle<CR>

" insert sequence
Plug 'vim-scripts/VisIncr'

" fzf, byebye denite.
Plug 'junegunn/fzf.vim'
let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'fg+':     ['fg', 'Normal', 'Comment', 'Directory'],
      \ 'bg+':     ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Keyword'],
      \ 'hl+':     ['fg', 'Keyword'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Special'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment']
      \ }

let $FZF_DEFAULT_OPTS='--border=sharp --preview-window=border-sharp --color="fg+:underline,bg+:-1,gutter:-1,hl+:italic:bold:underline,bg:-1"'
let g:fzf_layout = { 'window': { 'height': 0.8, 'width': 0.95, 'border': 'sharp' } }

augroup FzfHooks
  autocmd! FileType fzf set titlestring=finder
        \| autocmd BufLeave <buffer> set titlestring=
augroup END

nnoremap <silent><M-b>     :Buffers<CR>
nnoremap <silent><M-p>     :Files<CR>
nnoremap <silent><M-e>     :Files<CR>
nnoremap <silent><M-o>     :Files %:h<CR>
nnoremap <silent><M-m>     :History<CR>
nnoremap <silent><M-k>     :Marks<CR>

" guess project root
Plug 'dbakker/vim-projectroot'

function! ProjectNameGuess()
  return substitute(fnamemodify(ProjectRootGuess(), ":t"), "\\(\\w\\)\\(\\w*\\)", "\\U\\1\\L\\2", "g")
endfunction

com! -nargs=0 R             :call ProjectRootCD()

nnoremap <leader>! :ProjectRootExe<space>

" per-project vimrc
let g:localvimrc_persistence_file = expand('~') . "/.local/share/nvim/localvimrc_persistent"
let g:localvimrc_persistent = 1
Plug 'embear/vim-localvimrc'

" snipets
Plug 'SirVer/ultisnips'
