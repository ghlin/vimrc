" {{{ Vundle
  Plugin 'VundleVim/Vundle.vim'
" }}}

" {{{ Filetype Plugin

" {{{ Paredit
  Plugin 'paredit.vim'
" }}}

" {{{ QuickRun
  Plugin 'thinca/vim-quickrun'
" }}}

" {{{ Codi
  Plugin 'metakirby5/codi.vim'
" }}}

" {{{ Haskell
  Plugin 'neovimhaskell/haskell-vim'
  Plugin 'itchyny/vim-haskell-indent'
  Plugin 'eagletmt/ghcmod-vim'
" }}}

" {{{ Scala
  Plugin 'derekwyatt/vim-scala'
" }}}

" {{{ Coffee
  Plugin 'kchmck/vim-coffee-script'
" }}}

" {{{ Squirrel
" Plugin 'xevz/vim-squirrel'
" }}}

" {{{ Ejs
" Plugin 'briancollins/vim-jst'
" }}}

" {{{ CSS
  Plugin 'ap/vim-css-color'
" }}}

" {{{ Markdown
  Plugin 'tpope/vim-markdown'

  Plugin 'iamcco/markdown-preview.vim'
  let g:mkdp_path_to_chrome = "/Users/ghlin/.local/bin/urlhandler"
" }}}

" {{{ Rust
" Plugin 'rust-lang/rust.vim'

" Plugin 'racer-rust/vim-racer'

  let $RUST_SRC_PATH = "$HOME/.local/lib/rust/src/rustc-1.3.0/src"
  let g:racer_cmd    = "$HOME/.local/bin/racer"

  " autocmd FileType rust setlocal completefunc=RacerComplete
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

" {{{ Jade
" Plugin 'digitaltoad/vim-jade'
" }}}

" {{{ C / C++
  Plugin 'vim-jp/cpp-vim'
" Plugin 'octol/vim-cpp-enhanced-highlight'

" {{{ Clang Complete
  Plugin 'Rip-Rip/clang_complete'

  let g:clang_library_path         = '/Library/Developer/CommandLineTools/usr/lib'

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

" {{{ A.vim (switch between header & source files)
  Plugin 'a.vim'
" }}}

" }}}

" {{{ TOML
" Plugin 'cespare/vim-toml'
" }}}

" }}}

" {{{ Colorscheme

" {{{
" Plugin 'antlypls/vim-colors-codeschool'
" }}}

" {{{ Github
" Plugin 'acarapetis/vim-colors-github'
" }}}

" {{{ Molokai
" Plugin 'tomasr/molokai'
" }}}

" {{{ Pencil
  Plugin 'reedes/vim-colors-pencil'
" }}}

" {{{ Lucid
" Plugin 'cseelus/vim-colors-lucid'
" }}}

" {{{ Brighton
" Plugin 'MvanDiemen/brighton.vim'
" }}}

" {{{ Happy Hacking
" Plugin 'YorickPeterse/happy_hacking.vim'
" }}}

" {{{ Xcode
  Plugin 'Addisonbean/Vim-Xcode-Theme'
" }}}

" {{{ Paper-Color
  Plugin 'NLKNguyen/papercolor-theme'
" }}}

" {{{ MonoChrome
" Plugin 'fxn/vim-monochrome'
" }}}

" {{{ Wombat256
  Plugin 'MPiccinato/wombat256'
" }}}

" {{{ GreenVision
" Plugin 'greenvision'
" }}}

" {{{ Color-Scheme-Exploer
" Plugin 'Color-Scheme-Explorer'
" }}}

" }}}

" {{{ Mode

" {{{ DrawIt
" Plugin 'DrawIt'
" }}}

" {{{ Goyo.vim
" Plugin 'junegunn/goyo.vim'
  let g:goyo_width = 100
" }}}


" }}}

" {{{ Utilites

" {{{ vim-textobj-indent
  Plugin 'kana/vim-textobj-user' " required by vim-textobj-indent
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

" {{{
" Plugin 'luochen1990/rainbow'
  let g:rainbow_active = 1

  let g:rainbow_conf = {
        \   'guifgs'     : ['#0392CE', '#FD5308', '#0247FE', '#FB9902', '#8601AF', '#FEFE33', '#A7194B', '#D0EA2B'],
        \   'ctermfgs'   : ['1', '2', '3', '4', '5', '6', '7', '9', '10', '11' ,'12', '13', '14', '15'],
        \ 'separately': {
        \     '*':       0,
        \     'c':      {},
        \     'cpp':    {},
        \     'scheme': {},
        \     'lisp':   {},
        \     'elisp':  {},
        \     'haskell':{ 'parentheses': [ 'start=/(/ end=/)/', 'start=/\[/ end=/\]/' ] },
        \   }
        \ }

" }}}

" {{{ tablify   generate tables
" Plugin 'Stormherz/tablify'
" }}}

" {{{ startify   a pretty welcome screen
" Plugin 'mhinz/vim-startify'
  let g:startify_files_number = 15
  let g:startify_bookmarks    = [ '~/.vim/vimrc', '~/.zshrc' ]
" }}}

" {{{ airline   pretty status-line
  Plugin 'bling/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'

  let g:airline_mode_map = { '__' : '-', 'n'  : '<N>', 'i'  : '<I>',
       \ 'R'  : 'R', 'c'  : 'C', 'v'  : '<V>', 'V'  : '<V>',
       \ '' : 'V', 's'  : 'S', 'S'  : 'S', '' : 'S', }

  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  let g:airline_symbols.paste      = "[PASTE]"
  let g:airline_symbols.whitespace = "[=]"
  let g:airline_symbols.branch     = "[BRANCH]"
  let g:airline_symbols.readonly   = "[RO]"
  let g:airline_symbols.linenr     = "Ln"

  let g:airline_left_sep           = ""
  let g:airline_left_alt_sep       = ""
  let g:airline_right_sep          = ""
  let g:airline_right_alt_sep      = ""

  let g:airline_powerline_fonts = 0

  let g:airline_theme = 'monochrome'

  function! AIP_BufNr()
    return '#' . bufnr('%')
  endfunction

  function! AIP_FFEnc()
    return printf('%s%s', &fenc, strlen(&ff) > 0 ? ' ' . &ff : '')
  endfunction

  function! AirlineInitPart()
    let g:airline_section_x = airline#section#create([ '%{"#" . bufnr("%") . " "}'
          \                                          , 'filetype'])

    let g:airline_section_y = airline#section#create(['%{printf("%s%s", &fenc, strlen(&ff) > 0 ? " " . &ff : "")}'])

    "let g:airline_section_z = '%{g:airline_symbols.linenr}'
          "\                 . '%#__accent_bold#%4l%#__restore__#:%3v'
  endfunction

  au User AirlineAfterInit call AirlineInitPart()


  let g:airline#extensions#tagbar#enabled              = 0
  let g:airline#extensions#branch#enabled              = 1
  let g:airline#extensions#branch#displayed_head_limit = 10

  let g:airline#extensions#tabline#enabled             = 0
" }}}

" {{{ EasyAlign
  Plugin 'junegunn/vim-easy-align'
  vnoremap <silent> <Enter> :EasyAlign<Enter>
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
  let g:NERDTreeWinSize  = 18
  let g:NERDTreeSortOrder = [
                  \   '\/$'
                  \ , '\.lst$', '\.txt$', '\.vim$'
                  \ , '\.md$'
                  \ , '\.lua$'
                  \ , '\.run$'
                  \ , '*', '\.swp$', '\~$', '.dSYM' ]

  hi link NERDTreePart Normal
  hi link NERDTreePartFile Normal
" }}}

" {{{ Surround
  Plugin 'tpope/vim-surround'
" }}}

" {{{ VimShell
  Plugin 'Shougo/vimproc.vim'
  Plugin 'Shougo/vimshell.vim'
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

  nmap <leader>u    :GundoToggle<CR>
" }}}

" {{{ UltiSnips
  Plugin 'SirVer/ultisnips'
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

" {{{ AGrep
  Plugin 'ramele/agrep'
" }}}

" {{{ Ack
  Plugin 'mileszs/ack.vim'
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
  Plugin 'kien/ctrlp.vim'
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

" {{{
  Plugin 'dbakker/vim-projectroot'

  function! ProjectNameGuess()
    return substitute(fnamemodify(ProjectRootGuess(), ":t"), "\\(\\w\\)\\(\\w*\\)", "\\U\\1\\L\\2", "g")
  endfunction
" }}}

" {{{
  Plugin 'embear/vim-localvimrc'
" }}}

" }}}

