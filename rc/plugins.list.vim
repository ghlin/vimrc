" vim:foldmethod=marker:foldlevel=-1

" For temporary buffer / scratch
Plug 'shougo/junkfile.vim'

" {{{ languages

" toggle comments
Plug 'scrooloose/nerdcommenter'

" LSP support

let g:LanguageClient_serverCommands = {
      \   'haskell': [ 'hie-wrapper', '--lsp' ]
      \ }

Plug 'junegunn/fzf'
Plug 'autozimu/LanguageClient-neovim', {
      \ 'do': 'bash install.sh',
      \ 'branch': 'next'
      \ }

function! s:SetupLanguageClient()
  if has_key(g:LanguageClient_serverCommands, &ft)
    map     <F2>       :call LanguageClient#textDocument_rename()<CR>
    map     <C-]>      :call LanguageClient#textDocument_definition()<CR>
    map     <C-\>      :call LanguageClient#textDocument_hover()<CR>
    noremap <C-x><C-p> :call LanguageClient_contextMenu()<CR>
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

function! SetupMappingsForHaskell()
  function! ListSymbols()
    call LanguageClient#textDocument_documentSymbol()
    call ToggleList("Symbols", 'l')
  endfunction

  function! ListAllSymbols()
    call LanguageClient_workspace_symbol()
    call ToggleList("All Symbols", 'l')
  endfunction

  function! ClosePreviewIfAny()
    let last_hover_window_id = win_getid(bufwinnr(bufnr('__LanguageClient__')))
    let winnr = win_id2win(last_hover_window_id)
    if winnr > 0
      execute winnr . 'wincmd c'
    else
      normal <C-c>
    endif
  endfunction

  function! HIESplitCase()
    let arguments = [
          \ {
          \   'file': 'file://' . expand('%:p'),
          \   'pos': { 'line': line('.') - 1, 'character': col('.') - 1 }
          \ }
          \ ]
    call LanguageClient#workspace_executeCommand('ghcmod:casesplit', arguments)
  endfunction

  command! -bang -nargs=? SplitCase   :call HIESplitCase()

  noremap <buffer>         <C-x><C-s> :call ListSymbols()<CR>
  noremap <buffer>         <C-x><C-a> :call ListAllSymbols()<CR>
  noremap <silent><buffer> <C-c>      :call ClosePreviewIfAny()<CR>
endfunction

autocmd! FileType haskell call SetupMappingsForHaskell()

" typescript
Plug 'quramy/vim-js-pretty-template'
Plug 'leafgarland/typescript-vim'
hi! link typescriptHtmlEvents Normal

" Markdown
Plug 'tpope/vim-markdown'
let g:markdown_fenced_languages = [ 'haskell', 'python', 'c', 'cpp', 'sh' ]
let g:markdown_syntax_conceal = 1

Plug 'iamcco/markdown-preview.vim'
let g:mkdp_py_version = 2

" C / C++
if has('macunix')
  let g:clang_library_path         = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
endif

let g:clang_complete_auto        = 1
let g:clang_auto_select          = 1
let g:clang_complete_copen       = 1
let g:clang_use_library          = 1
let g:clang_complete_auto        = 0
let g:clang_snippets             = 1
let g:clang_snippets_engine      = 'ultisnips'
let g:clang_hl_errors            = 0
let g:clang_complete_macros      = 1
let g:clang_complete_patterns    = 1
let g:clang_periodic_quickfix    = 0
let g:clang_close_preview        = 0
let g:clang_trailing_placeholder = 1

nnoremap <leader>q       :call g:ClangUpdateQuickFix()<CR>

Plug 'Rip-Rip/clang_complete'
Plug 'vim-jp/cpp-vim'

" XML / HTML
Plug 'mattn/emmet-vim'

let g:user_emmet_leader_key     = '<c-e>'
let g:user_emmet_expandword_key = '<c-e>'
let g:user_emmit_expandabbr_key = '<c-e>'

let g:use_emmet_complete_tag    = 1
" }}}

" colorschemes
Plug 'fxn/vim-monochrome'

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
let g:NERDTreeDirArrows=0
let g:NERDTreeWinSize  = 25
let g:NERDTreeSortOrder = [
                \   '\/$'
                \ , '\.lst$', '\.txt$', '\.vim$'
                \ , '\.md$'
                \ , '\.lua$'
                \ , '\.run$'
                \ , '*', '\.swp$', '\~$', '.dSYM' ]
let g:NERDTreeIgnore = [ 'node_modules', '\.swp$', '\~$', '\.dSYM' ]
let g:NERDTreeQuitOnOpen=1

hi link NERDTreePart     Normal
hi link NERDTreePartFile Normal

" visualize undo tree
Plug 'vim-scripts/Gundo'

nmap <leader><leader><BS>    :GundoToggle<CR>

" grep
Plug 'mileszs/ack.vim'

" insert sequence
Plug 'vim-scripts/VisIncr'

" unite / denite
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'

if !has('nvim')
  Plug 'Shougo/neomru.vim'
  Plug 'Shougo/neoyank.vim'
  Plug 'thinca/vim-unite-history'
  Plug 'osyo-manga/unite-filetype'
  Plug 'ujihisa/unite-colorscheme'

  let g:unite_source_history_yank_enable = 1
  let g:unite_enable_auto_select         = 0

  nnoremap <leader><leader>f       :<C-u>Unite -no-split -start-insert file<CR>
  nnoremap <leader><leader>F       :<C-u>Unite -no-split -start-insert file_rec/async<CR>
  nnoremap <leader><leader><space> :<C-u>Unite -no-split -start-insert buffer bookmark<CR>
  nnoremap <leader><leader>b       :<C-u>Unite -no-split -start-insert bookmark<CR>
  nnoremap <leader><leader>\       :<C-u>Unite -no-split -start-insert bookmark neomru/file<CR>
  nnoremap <leader><leader><CR>    :<C-u>Unite -no-split -start-insert outline<CR>
  nnoremap <leader><leader>y       :<C-u>Unite -no-split -start-insert history/yank<CR>
  nnoremap <leader><leader>?       :<C-u>Unite -no-split -start-insert history/search<CR>
  nnoremap <leader><leader>:       :<C-u>Unite -no-split -start-insert history/command<CR>
  nnoremap <leader><leader>t       :<C-u>Unite -no-split -start-insert filetype<CR>
  nnoremap <leader><leader>T       :<C-u>Unite -no-split -start-insert colorscheme<CR>

  autocmd Filetype unite call s:unite_settings()

  function! s:unite_settings() "{{{ unite settings
  endfunction " }}}
else
  Plug 'Shougo/denite.nvim', {
      \ 'do': ':UpdateRemotePlugins'
      \ }

  nnoremap <leader><leader><leader> :<C-u>DeniteProjectDir buffer file/rec<CR>
  nnoremap <M-p>                    :<C-u>DeniteProjectDir buffer file/rec<CR>
  nnoremap <leader><leader>\        :<C-u>Denite buffer file/old<CR>
  nnoremap <leader><leader><CR>     :<C-u>Denite unite:outline<CR>
  nnoremap <leader><leader>/        :<C-u>DeniteProjectDir grep<CR>
  nnoremap <M-S-f>                  :<C-u>DeniteProjectDir grep<CR>
  nnoremap <leader><leader>?        :<C-u>Denite change<CR>
  nnoremap <leader><leader>:        :<C-u>Denite command_history<CR>
  nnoremap <leader><leader>b        :<C-u>Denite buffer<CR>
endif

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

" complete
" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif
" let g:deoplete#enable_at_startup = 1

"if has('py3')
"  let g:UltiSnipsUsePythonVersion = 2
"endif

"Plug 'Shougo/neosnippet.vim'
"Plug 'Shougo/neosnippet-snippets'
"
"imap <Tab>     <Plug>(neosnippet_expand_or_jump)
"smap <Tab>     <Plug>(neosnippet_expand_or_jump)
"xmap <Tab>     <Plug>(neosnippet_expand_target)
"
"smap <expr><C-j> neosnippet#expandable_or_jumpable() ?
"      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<C-j>"
"
"if has('conceal')
"  set conceallevel=2 concealcursor=niv
"endif
