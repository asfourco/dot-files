" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off

" ----------------------------------------------------------------------------
" Bundle/plugins 
" ----------------------------------------------------------------------------

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-scripts/searchfold.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Lokaltog/vim-powerline'
Plugin 'sukima/xmledit'
Plugin 'sophacles/vim-bundle-mako'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-unimpaired'
Plugin 'maksimr/vim-jsbeautify' 
Plugin 'einars/js-beautify'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-fugitive'
Plugin 'crusoexia/vim-monokai'
Plugin 'tpope/vim-vividchalk'
Plugin 'Lokaltog/vim-distinguished' 
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
Plugin 'tmhedberg/SimpylFold'

call vundle#end()
filetype plugin on
"filetype plugin indent on

" ----------------------------------------------------------------------------
" Editor settings 
" ----------------------------------------------------------------------------
set modeline
set modelines=2
set laststatus=2
set encoding=utf-8
set backupcopy=yes
set hlsearch
set incsearch
set ignorecase
set smartcase
set number
set autoread
set t_Co=256
set mouse=a
syntax on
"set background=dark
colorscheme monokai
hi normal ctermbg=none
hi nonText ctermbg=none

" delimitMate
let delimitMate_expand_cr=1
imap <C-c> <CR><Esc>0

" syntastic
let g:syntastic_check_on_open=1

" view invisible characters
set listchars=eol:¬,tab:>-,trail:·,extends:>,precedes:<
set list

" ----------------------------------------------------------------------------
" Javascript settings
" ----------------------------------------------------------------------------
" jsBeautify
let g:EditorConfig_core_mode = 'external_command'
"let g:editorconfig_Beautifier='~/.vim/.editorconfig'

"let g:jsbeautify = {"indent_size": 2, "indent_char": "\t"}
" for JS
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" ES6 setup
let g:jsx_ext_required = 0
let g:syntastic_javascript_checkers = ['eslint']

" ----------------------------------------------------------------------------
" Tabbing/Indentation
" ----------------------------------------------------------------------------
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set noshiftround
set smarttab

" indent guides
nnoremap <silent> <leader>i :IndentGuidesToggle<CR>
let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_auto_colors=0
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

augroup IndentGuideColors
  autocmd!
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermfg=white ctermbg=234
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermfg=white ctermbg=236
augroup END

" ----------------------------------------------------------------------------
" Python PEP8 setup
" ----------------------------------------------------------------------------
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=120 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set foldmethod=indent |
    \ set foldlevel=99


let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
map <C-n> :NERDTreeToggle<CR>

" ----------------------------------------------------------------------------
" NERDCommenter settings 
" ----------------------------------------------------------------------------
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" ----------------------------------------------------------------------------
" Wild and file globbing stuff in command mode
" ----------------------------------------------------------------------------

" Binary
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.o,*.obj,*.exe,*.dll,*.jar,*.pyc,*.rbc,*.class
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.avi,*.m4a,*.mp3,*.oga,*.ogg,*.wav,*.webm
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.doc,*.pdf
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
" Cache
set wildignore+=.sass-cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*.gem
" Compiled
set wildignore+=*.marko.js
set wildignore+=*.min.*
" Temp/System
set wildignore+=*.*~,*~
set wildignore+=*.swp,.lock,.DS_Store,._*,tags.lock

autocmd VimEnter * redraw!
