" {{{ Vundle
  Plugin 'VundleVim/Vundle.vim'
" }}}

" {{{ Filetype Plugin

" {{{ EBNF
" Plugin 'ebnf.vim'
" }}}

" {{{ Paredit
" Plugin 'paredit.vim'
" }}}

" {{{
  Plugin 'shougo/junkfile.vim'
" }}}

" {{{ QuickRun
  Plugin 'thinca/vim-quickrun'
" }}}

" {{{ Haskell
    Plugin 'neovimhaskell/haskell-vim'
  " Plugin 'itchyny/vim-haskell-indent'
  " Plugin 'dag/vim2hs'
  " Plugin 'eagletmt/ghcmod-vim'
  " Plugin 'eagletmt/neco-ghc'

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

" }}}

" {{{ typescript
  Plugin 'quramy/tsuquyomi'
  Plugin 'quramy/vim-js-pretty-template'
  Plugin 'leafgarland/typescript-vim'
  hi! link typescriptHtmlEvents Normal


  let g:tsuquyomi_use_vimproc          = 1
  let g:tsuquyomi_use_local_typescript = 0
  let g:tsuquyomi_definition_split     = 2
  let g:tsuquyomi_single_quote_import  = 1
  let g:tsuquyomi_completion_preview   = 0
  let g:tsuquyomi_javascript_support   = 1

  autocmd Filetype typescript setlocal completeopt+=preview
" }}}

" {{{ ES6
  Plugin 'isruslan/vim-es6'"
" }}}

" {{{ Squirrel
" Plugin 'xevz/vim-squirrel'
" }}}

" {{{ Ejs
" Plugin 'briancollins/vim-jst'
" }}}

" {{{ CSS
" Plugin 'ap/vim-css-color'
" }}}

" {{{ Markdown
  Plugin 'tpope/vim-markdown'

  Plugin 'iamcco/markdown-preview.vim'
  let g:mkdp_py_version = 2

  if has('macunix')
    let g:mkdp_path_to_chrome = "/Users/ghlin/.local/bin/urlhandler"
  endif
" }}}

" {{{ Perl
  Plugin 'vim-perl/vim-perl'
" }}}

" {{{ Lua
" Plugin 'vim-misc' " required by lua.vim
" Plugin 'lua.vim'
" }}}

" {{{ Gtk
" Plugin 'gtk-mode'
" }}}

" {{{ Jade/Pug
" Plugin 'digitaltoad/vim-jade'
" Plugin 'digitaltoad/vim-pug'
" }}}

" {{{ C / C++
  Plugin 'vim-jp/cpp-vim'
" Plugin 'octol/vim-cpp-enhanced-highlight'

" {{{ Clang Complete
  Plugin 'Rip-Rip/clang_complete'

  if has('macunix')
    " let g:clang_library_path         = '/Library/Developer/CommandLineTools/usr/lib'
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
" }}}

" }}}

" }}}

" {{{ Colorscheme

" {{{ Solarized
" Plugin 'altercation/solarized'
" }}}

" {{{ One
" Plugin 'rakr/vim-one'
" }}}

" {{{ onehalf (for neovim-gtk)
  Plugin 'sonph/onehalf', { 'rtp': 'vim/' }
" }}}

" {{{
  Plugin 'thinkpad.vim'
" }}}

" {{{ codeschool
" Plugin 'antlypls/vim-colors-codeschool'
" }}}

" {{{ Github
  "Plugin 'acarapetis/vim-colors-github'
" }}}

" {{{ Molokai
" Plugin 'tomasr/molokai'
" }}}

" {{{ Pencil
" Plugin 'reedes/vim-colors-pencil'
" }}}

" {{{ Paper-Color
" Plugin 'NLKNguyen/papercolor-theme'
" }}}

" {{{ monochrome
  Plugin 'fxn/vim-monochrome'
" }}}
" }}}

" {{{ Utilites

" {{{ vim-textobj-indent
  Plugin 'kana/vim-textobj-user'    " required by vim-textobj-indent
  Plugin 'kana/vim-textobj-indent'
" }}}

" {{{ argtextobj
  Plugin 'argtextobj.vim'
  Plugin 'Parameter-Text-Objects'
" }}}

" {{{ expand region
  Plugin 'terryma/vim-expand-region'
" }}}

" {{{ indentLine
" Plugin 'Yggdroot/indentLine'
  let g:indentLine_faster = 1
" }}}

" {{{ indent guide
" Plugin 'nathanaelkane/vim-indent-guides'
" }}}

" {{{ rainbow
" Plugin 'luochen1990/rainbow'
  let g:rainbow_active = 1

  let g:rainbow_conf = {
        \   'guifgs'     : [ '#EF2929', '#ED146F', '#D37A35', '#DFCD60',
        \                    '#B75FAD', '#3EBD92', '#61D2D6', '#B75FAD' ],
        \   'ctermfgs'   : ['DarkBlue', 'DarkGreen', 'DarkYellow', 'DarkRed', 'Red' ],
        \   'separately': {
        \     '*':       0,
        \     'c':       { 'parentheses': [ 'start=/(/ end=/)/', 'start=/\[/ end=/\]/' ] },
        \     'cpp':     { 'parentheses': [ 'start=/(/ end=/)/', 'start=/\[/ end=/\]/' ] },
        \     'scheme':  {},
        \     'lisp':    {},
        \     'elisp':   {},
        \     'haskell': { 'parentheses': [ 'start=/(/ end=/)/', 'start=/\[/ end=/\]/' ] },
        \   }
        \ }
" }}}

" {{{ tablify   generate tables
  "Plugin 'Stormherz/tablify'
" }}}

" {{{ EasyAlign
  Plugin 'junegunn/vim-easy-align'
  vnoremap <silent> <Enter> :EasyAlign<Enter>
" }}}

" {{{ Tabular, for vim2hs
  Plugin 'godlygeek/tabular'
" }}}

" {{{ Tagbar
" Plugin 'majutsushi/tagbar'
  let g:tagbar_width     = 20
  nmap  <leader>T :TagbarToggle<CR>
  nmap  <leader>p :TagbarTogglePause<CR>
" }}}

" {{{ NerdCommenter
  Plugin 'scrooloose/nerdcommenter'
" }}}

" {{{ NerdTree
  Plugin 'scrooloose/nerdtree'
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
" }}}

" {{{ Surround
  Plugin 'tpope/vim-surround'
" }}}

" {{{ VimShell
" Plugin 'Shougo/vimproc.vim'
" Plugin 'Shougo/vimshell.vim'
" }}}

" {{{ Emmit (ZenCoding)
  Plugin 'mattn/emmet-vim'

  let g:user_emmet_leader_key     = '<c-e>'
  let g:user_emmet_expandword_key = '<c-e>'
  let g:user_emmit_expandabbr_key = '<c-e>'

  let g:use_emmet_complete_tag    = 1
" }}}

" {{{ Gundo
  Plugin 'Gundo'

  nmap <leader><leader><BS>    :GundoToggle<CR>
" }}}

" {{{ UltiSnips
  Plugin 'SirVer/ultisnips'
" Plugin 'alexbyk/vim-ultisnips-js-testing'

  "let g:UltiSnipsExpandTrigger = "<C-a>"

  " use py3: clang_complete [snippets engine not found]
  if has('py3')
    let g:UltiSnipsUsePythonVersion = 2
  endif
" }}}

" {{{ Swap Parameters
  Plugin 'swap-parameters'
" }}}

" {{{ Easy Grep
  Plugin 'EasyGrep'
" }}}

" {{{ Ack
  Plugin 'mileszs/ack.vim'
" }}}

" {{{ Quickfix filter
  Plugin 'sk1418/QFGrep'
" }}}

" {{{ VisIncr
  Plugin 'VisIncr'
" }}}

" {{{ ReplaceWithRegister
  Plugin 'ReplaceWithRegister'
" }}}

" {{{ matchit  match anywhat
  Plugin 'matchit.zip'
" }}}

" {{{ CtrlP
" Plugin 'kien/ctrlp.vim'
  let g:ctrlp_map = '<leader>F'  " :CtrlP
  noremap <leader>R  :CtrlPMRUFiles<CR>
  noremap <leader>B  :CtrlPBuffer<CR>

  noremap <leader>C  :CtrlPBuffer<CR>

  let g:ctrlp_mruf_max = 5000
  let g:ctrlp_mruf_exclude = '$HOME/Workspace/.Builds/*'

  let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/]\.(git|dSYM)$',
        \ 'file': '\v[\/]\.(exe|so|dll|luac|run|pyc|swp|a|o)$',
        \ 'link': '',
        \ }
" }}}

" {{{ unite
" unite.vim is needed by denite.
" https://github.com/Shougo/unite-outline/issues/77
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/unite-outline'

if !has('nvim')
  Plugin 'Shougo/neomru.vim'
  Plugin 'Shougo/neoyank.vim'
  Plugin 'thinca/vim-unite-history'
  Plugin 'osyo-manga/unite-filetype'
  Plugin 'ujihisa/unite-colorscheme'

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
  Plugin 'Shougo/denite.nvim'

  nnoremap <leader><leader><leader> :<C-u>DeniteProjectDir file/rec<CR>
  nnoremap <M-p>                    :<C-u>DeniteProjectDir file/rec<CR>
  nnoremap <leader><leader>\        :<C-u>Denite buffer file/old<CR>
  nnoremap <leader><leader><CR>     :<C-u>Denite unite:outline<CR>
  nnoremap <leader><leader>/        :<C-u>DeniteProjectDir grep<CR>
  nnoremap <M-S-f>                  :<C-u>DeniteProjectDir grep<CR>
  nnoremap <leader><leader>?        :<C-u>Denite change<CR>
  nnoremap <leader><leader>:        :<C-u>Denite command_history<CR>
  nnoremap <leader><leader>b        :<C-u>Denite buffer<CR>
endif

" }}}

" {{{ project root
  Plugin 'dbakker/vim-projectroot'

  function! ProjectNameGuess()
    return substitute(fnamemodify(ProjectRootGuess(), ":t"), "\\(\\w\\)\\(\\w*\\)", "\\U\\1\\L\\2", "g")
  endfunction

  com! -nargs=0 R             :call ProjectRootCD()

  nnoremap <leader><leader>!     :ProjectRootExe<space>

  " use denite.
  " nnoremap <leader><leader>/     :ProjectRootExe Ack<space>
" }}}

" {{{ localvimrc
  Plugin 'embear/vim-localvimrc'
" }}}

" {{{ completion
  if has('macunix')
    Plugin 'ujihisa/neco-look'
  endif

  "Plugin 'shougo/neocomplete.vim'

  "let g:neocomplete#text_mode_filetypes = { "_" : 1 }

  " Use neocomplete.
  let g:neocomplete#enable_at_startup = 1
  " Use smartcase.
  let g:neocomplete#enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplete#sources#syntax#min_keyword_length = 3

  if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
  endif

  "Plugin 'shougo/neco-vim'
" }}}

" }}}

" {{{ fun stuff.
" {{{
  Plugin 'dahu/vim-rng'
  Plugin 'lucasteles/swtc.vim'
" }}}
" }}}

" {{{ misc
 
" {{{ language server protocol
  " dependence of LanguageClient
  Plugin 'junegunn/fzf'
  Plugin 'autozimu/LanguageClient-neovim'
  map <F2>  :call LanguageClient#textDocument_rename()<CR>
  let g:LanguageClient_serverCommands = {
        \   'haskell': [ 'hie-wrapper', '--lsp' ]
        \ }

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

    map     <buffer> <C-]>      :call LanguageClient#textDocument_definition()<CR>
    noremap <buffer> <C-x><C-s> :call ListSymbols()<CR>
    noremap <buffer> <C-x><C-a> :call ListAllSymbols()<CR>
    map     <buffer> <C-\>      :call LanguageClient#textDocument_hover()<CR>
    noremap <buffer> <C-x><C-p> :call LanguageClient_contextMenu()<CR>
    noremap <buffer> <C-c>      :call ClosePreviewIfAny()<CR><C-c>
  endfunction

  autocmd! FileType haskell call SetupMappingsForHaskell()
" }}}

" }}}

" vim:foldmethod=marker:foldlevel=0
