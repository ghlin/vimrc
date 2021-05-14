" vim:foldmethod=marker:foldlevel=0

" For temporary buffer / scratch
Plug 'shougo/junkfile.vim'

" {{{ languages

" toggle comments
Plug 'scrooloose/nerdcommenter'

" LSP support
Plug 'neoclide/coc.nvim', { 'do': 'yarn install' }
Plug 'neoclide/coc-denite'

" Plug 'junegunn/fzf'

let s:coc_supported_languages = {
      \ 'typescript': 1,
      \ 'typescript.tsx': 1,
      \ 'javascript': 1,
      \ 'javascript.jsx': 1,
      \ 'json': 1,
      \ 'python': 1,
      \ 'css': 1,
      \ 'scss': 1,
      \ 'c': 1,
      \ 'cpp': 1
      \ }

function! s:SetupLanguageClient()
  if has_key(s:coc_supported_languages, &ft)
    nmap     <buffer><silent> <F2>                   <Plug>(coc-rename)
    nmap     <buffer><silent> <C-]>                  <Plug>(coc-definition)
    nmap     <buffer><silent> <C-\>                  <ESC>:call CocAction('doHover')<CR>
    nmap     <buffer><silent> <M-S-p>                <ESC>:Denite   coc-command<CR>
    nmap     <buffer><silent> <M-l>                  <ESC>:Denite   coc-symbols<CR>
  endif
endfunction

function! s:UpdateLanguageClient() abort
  if has_key(s:coc_supported_languages, &ft)
    silent call coc#rpc#request('fillDiagnostics', [bufnr('%')])
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
let g:yats_host_keyword = 0
Plug 'HerringtonDarkholme/yats.vim'
Plug 'quramy/vim-js-pretty-template'

" let g:typescript_ignore_browserwords = 1
" Plug 'leafgarland/typescript-vim'

" Markdown
Plug 'tpope/vim-markdown'
let g:markdown_fenced_languages = [ 'haskell', 'python', 'c', 'cpp', 'sh', 'json', 'javascript', 'js=javascript', 'typescript', 'ts=typescript' ]
let g:markdown_syntax_conceal = 1

Plug 'iamcco/markdown-preview.vim'
let g:mkdp_py_version = 2

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

Plug 'vim-scripts/swap-parameters'

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

" denite
Plug 'Shougo/denite.nvim', {
      \ 'do': ':UpdateRemotePlugins',
      \ }

nnoremap <silent><M-b>                    :Denite            buffer<CR>
nnoremap <silent><M-p>                    :DeniteProjectDir  file/rec<CR>
nnoremap <silent><M-o>                    :Denite            file<CR>
nnoremap <silent><M-m>                    :Denite            file/old<CR>
nnoremap <silent><M-l>                    :Denite            outline<CR>

autocmd FileType denite        call s:SetupDenite()
autocmd FileType denite-filter call s:SetupDeniteFilter()

function! s:SetupDenite() abort
  setlocal cul

  nnoremap <silent><buffer><expr> <CR>   denite#do_map('do_action')
  nnoremap <silent><buffer><expr> i      denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <tab>  denite#do_map('choose_action')
endfunction

function! s:SetupDeniteFilter() abort
  setlocal cul

  inoremap <silent><buffer>        <C-n>   <ESC><C-w>p:call cursor(line('.') + 1, 0)<CR><C-w>pA
  inoremap <silent><buffer>        <C-p>   <ESC><C-w>p:call cursor(line('.') - 1, 0)<CR><C-w>pA
  inoremap <silent><buffer><expr>  <CR>    denite#do_map('do_action')
  inoremap <silent><buffer><expr>  <ESC>   denite#do_map('quit')
  inoremap <silent><buffer><expr>  <C-c>   denite#do_map('quit')
  inoremap <silent><buffer><expr>  <M-n>   denite#do_map('quit')
  inoremap <silent><buffer><expr>  <M-p>   denite#do_map('quit')
  inoremap <silent><buffer><expr>  <M-l>   denite#do_map('quit')
  inoremap <silent><buffer><expr>  <M-o>   denite#do_map('quit')
  inoremap <silent><buffer><expr>  <M-w>   denite#do_map('quit')
  inoremap <silent><buffer><expr>  zz      denite#do_map('quit')
  inoremap <silent><buffer><expr>  <tab>   denite#do_map('choose_action')
endfunction

" guess project root
Plug 'dbakker/vim-projectroot'

function! ProjectNameGuess()
  return substitute(fnamemodify(ProjectRootGuess(), ":t"), "\\(\\w\\)\\(\\w*\\)", "\\U\\1\\L\\2", "g")
endfunction

com! -nargs=0 R             :call ProjectRootCD()

nnoremap <leader>! :ProjectRootExe<space>

" per-project vimrc
Plug 'embear/vim-localvimrc'

" snipets
Plug 'SirVer/ultisnips'
