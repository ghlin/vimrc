" vim:foldmethod=marker:foldlevel=0

" For temporary buffer / scratch
Plug 'shougo/junkfile.vim'

" {{{ languages

" toggle comments
Plug 'scrooloose/nerdcommenter'

" LSP support
Plug 'neoclide/coc.nvim', { 'do': 'yarn install' }

" CR to trigger coc completion
inoremap <silent><expr> <cr>        coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>"
inoremap <silent><expr> <c-space>   coc#refresh()

Plug 'liuchengxu/vista.vim'
let g:vista_highlight_whole_line = 1
let g:vista_keep_fzf_colors      = 1
let g:vista_icon_indent          = ["`-> ", "+-> "]
let g:vista_fold_toggle_icons    = ['>', '-']
let g:vista_close_on_jump        = 1
let g:vista_default_executive    = 'coc'
let g:vista#renderer#enable_icon = 0

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
  if has_key(s:coc_supported_languages, &ft)
    silent call coc#rpc#request('fillDiagnostics', [bufnr('%')])
  endif
endfunction

function! s:SetupLanguageClient()
  if has_key(s:coc_supported_languages, &ft)
    nmap     <buffer><silent>       <F2>        <Plug>(coc-rename)
    nmap     <buffer><silent>       <C-]>       <Plug>(coc-definition)
    nmap     <buffer><silent>       <C-\>       <ESC>:call CocAction('doHover')<CR>
    nmap     <buffer><silent>       <F12>       <Plug>(coc-references)
    nmap     <buffer><silent>       <M-S-p>     <ESC>:CocCommand<CR>
    nmap     <buffer><silent>       <M-l>       <ESC>:Vista finder<CR>
  endif
endfunction

augroup LSPClientSettings
  autocmd!
  autocmd BufRead,BufEnter * :call s:SetupLanguageClient()
  autocmd CursorHold       * :call s:UpdateLanguageClient()
augroup END

" Haskell
Plug 'neovimhaskell/haskell-vim'

let g:haskell_conceal_wide  = 0
let g:haskell_quasi         = 1
let g:haskell_interpolation = 0
let g:haskell_regex         = 0
let g:haskell_jmacro        = 0
let g:haskell_shqq          = 0
let g:haskell_sql           = 0
let g:haskell_json          = 0
let g:haskell_xml           = 0
let g:haskell_hsp           = 0

" autocmd! FileType haskell call SetupMappingsForHaskell()

" typescript
" let g:yats_host_keyword = 0
" Plug 'HerringtonDarkholme/yats.vim'
let g:typescript_ignore_browserwords = 0
Plug 'leafgarland/typescript-vim', { 'frozen': 1 }
Plug 'quramy/vim-js-pretty-template'
Plug 'peitalin/vim-jsx-typescript'


" Markdown
Plug 'tpope/vim-markdown'
let g:markdown_fenced_languages = [ 'haskell', 'python', 'c', 'cpp', 'sh', 'json', 'javascript', 'js=javascript', 'typescript', 'ts=typescript', 'vim', 'help' ]
let g:markdown_syntax_conceal = 1

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

" Alda
Plug 'daveyarwood/vim-alda'

autocmd FileType alda call s:SetupAlda()

function! s:SetupAlda() abort
  nmap <buffer><C-x><C-p><C-p> <localleader>pp
  nmap <buffer><C-x><C-p>      <localleader>paw
  nmap <buffer><C-x><C-a><C-p> :AldaPlayBuffer<CR>
  vmap <buffer><C-x><C-p>      <localleader>p
endfunction


" }}}

" additional text objects
Plug 'kana/vim-textobj-user'    " required by vim-textobj-indent
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-function'

let g:vim_textobj_parameter_mapping = 'a'
Plug 'sgur/vim-textobj-parameter'
" Plug 'vim-scripts/argtextobj.vim'
" Plug 'vim-scripts/Parameter-Text-Objects'

let g:swap_no_default_key_mappings = 1
Plug 'machakann/vim-swap'

nmap gb      <Plug>(swap-next)
nmap gB      <Plug>(swap-prev)

" pair manip.
Plug 'tpope/vim-surround'
Plug 'vim-scripts/matchit.zip'

" align text easily
Plug 'junegunn/vim-easy-align'
vnoremap <silent> <Enter> :EasyAlign<Enter>

" NerdTree file explorer
Plug 'scrooloose/nerdtree'
nmap  <leader>E :NERDTreeToggle<CR>
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
let g:NERDTreeIgnore = [ 'node_modules', '\.swp$', '\~$', '\.dSYM' ]
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
      \ 'hl':      ['fg', 'Keyword'],
      \ 'fg+':     ['bg', 'Normal'],
      \ 'bg+':     ['fg', 'Normal'],
      \ 'hl+':     ['fg', 'IncSearch'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Special'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment']
      \ }

let $FZF_DEFAULT_OPTS='--border=sharp --preview-window=border-sharp'
let g:fzf_layout = { 'window': { 'height': 0.6, 'width': 0.9, 'border': 'sharp' } }

augroup FzfHooks
  autocmd! FileType fzf set titlestring=finder
        \| autocmd BufLeave <buffer> set titlestring=
augroup END

nnoremap <silent><M-b>     :Buffers<CR>
nnoremap <silent><M-p>     :Files<CR>
nnoremap <silent><M-o>     :Files<CR>
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

" git helper
let g:gitgutter_enabled              = 0
let g:gitgutter_preview_win_floating = 0
let g:gitgutter_map_keys             = 0
let g:gitgutter_async                = 0
Plug 'airblade/vim-gitgutter'

function! s:toggle_gitgutter() abort
  :GitGutterToggle
  if g:gitgutter_enabled
    set signcolumn=auto
  else
    set signcolumn=no
  endif
endfunction

function! s:with_gitgutter(command, cnt) abort
  if g:gitgutter_enabled == 0
    set signcolumn=auto
    :GitGutterEnable
  endif

  execute ':' . a:command . ' ' . a:cnt
endfunction

nnoremap <silent><M-S-g>      :call <SID>toggle_gitgutter()<CR>
nnoremap <silent>]c           :call <SID>with_gitgutter('GitGutterNextHunk', v:count1)<CR>
nnoremap <silent>[c           :call <SID>with_gitgutter('GitGutterPrevHunk', v:count1)<CR>
nnoremap <silent><leader>hp   :GitGutterPreviewHunk<CR>
nnoremap <silent><leader>hu   :GitGutterUndoHunk<CR>
nnoremap <silent><leader>hs   :GitGutterStageHunk<CR>

" Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
