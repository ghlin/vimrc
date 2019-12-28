" vim:foldmethod=marker:foldlevel=0

" For temporary buffer / scratch
Plug 'shougo/junkfile.vim'

" {{{ languages

" toggle comments
Plug 'scrooloose/nerdcommenter'

" LSP support
Plug 'neoclide/coc.nvim', { 'tag': '*', 'do': 'yarn install' }
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
    map     <buffer><silent> <F2>                   <Plug>(coc-rename)
    map     <buffer><silent> <C-]>                  <Plug>(coc-definition)
    map     <buffer><silent> <C-\>                  <ESC>:call CocAction('doHover')<CR>
    map     <buffer><silent> <M-S-p>                <ESC>:Denite   coc-command<CR>
    map     <buffer><silent> <leader><leader><CR>   <ESC>:Denite   coc-symbols<CR>
    " noremap <buffer><silent> <C-x><C-p> :call LanguageClient_contextMenu()<CR>
  endif
endfunction

augroup lang_client
  autocmd BufRead,BufEnter * :call s:SetupLanguageClient()
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
let g:typescript_ignore_browserwords = 1
Plug 'quramy/vim-js-pretty-template'
Plug 'leafgarland/typescript-vim'
hi! link typescriptHtmlEvents Normal

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

" colorschemes
Plug 'fxn/vim-monochrome'
Plug 'jaredgorski/SpaceCamp'
Plug 'nanotech/jellybeans.vim'
Plug 'morhetz/gruvbox'
let g:lucius_style = 'light'
let g:lucius_contrast = 'high'

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

" let g:gundo_prefer_python3=1
Plug 'mbbill/undotree'

nmap <leader><leader><BS>    :UndotreeToggle<CR>

" grep
Plug 'mileszs/ack.vim'

" insert sequence
Plug 'vim-scripts/VisIncr'

" unite / denite
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
Plug 'Shougo/denite.nvim', {
      \ 'do': ':UpdateRemotePlugins',
      \ }

nnoremap <silent><leader><leader><leader> :DeniteProjectDir  buffer<CR>
nnoremap <silent><M-b>                    :Denite            buffer<CR>
nnoremap <silent><leader><leader>b        :Denite            buffer<CR>
nnoremap <silent><M-p>                    :DeniteProjectDir  buffer     file/rec<CR>
nnoremap <silent><leader><leader>\        :Denite            buffer     file/old<CR>
nnoremap <silent><leader><leader><CR>     :Denite            unite:outline<CR>
nnoremap <silent><leader><leader>/        :DeniteProjectDir  grep<CR>
nnoremap <silent><M-S-f>                  :DeniteProjectDir  grep<CR>
nnoremap <silent><leader><leader>?        :Denite            change<CR>
nnoremap <silent><leader><leader>:        :Denite            command_history<CR>

autocmd FileType denite        call s:SetupDenite()
autocmd FileType denite-filter call s:SetupDeniteFilter()

function! s:SetupDenite() abort
  nnoremap <silent><buffer><expr> <CR>   denite#do_map('do_action')
  nnoremap <silent><buffer><expr> i      denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <tab>  denite#do_map('choose_action')
endfunction

function! s:SetupDeniteFilter() abort
  inoremap <silent><buffer>        <C-n>   <ESC><C-w>p:call cursor(line('.') + 1, 0)<CR><C-w>pA
  inoremap <silent><buffer>        <C-p>   <ESC><C-w>p:call cursor(line('.') - 1, 0)<CR><C-w>pA
  inoremap <silent><buffer><expr>  <CR>    denite#do_map('do_action')
  inoremap <silent><buffer><expr>  <ESC>   denite#do_map('quit')
  inoremap <silent><buffer><expr>  <C-c>   denite#do_map('quit')
  inoremap <silent><buffer><expr>  <M-n>   denite#do_map('quit')
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

nnoremap <leader><leader>!     :ProjectRootExe<space>

" per-project vimrc
Plug 'embear/vim-localvimrc'

" snipets
Plug 'SirVer/ultisnips'
