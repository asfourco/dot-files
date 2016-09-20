" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" {{{ Setting up Vundle - the vim plugin bundler
  let iCanHazVundle=1
  let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
  if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
  endif
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()
  Bundle 'gmarik/vundle'
  " add your bundles below
  Bundle 'Lokaltog/vim-easymotion'
  Bundle 'Lokaltog/vim-powerline'
  Bundle 'Lokaltog/vim-distinguished' 
  Bundle 'jngeist/vim-multimarkdown'
  Bundle 'vim-scripts/searchfold.vim'
  Bundle 'ddollar/nerdcommenter'
  Bundle 'tpope/vim-vividchalk'
  Bundle 'altercation/vim-colors-solarized'
  Bundle 'sukima/xmledit'
  Bundle 'sophacles/vim-bundle-mako'
  Bundle 'plasticboy/vim-markdown'
  Bundle 'jelera/vim-javascript-syntax'
  Bundle 'pangloss/vim-javascript'
  Bundle 'nathanaelkane/vim-indent-guides'
  Bundle 'Raimondi/delimitMate'
  Bundle 'scrooloose/syntastic'
  Bundle 'tpope/vim-unimpaired'
  Bundle 'maksimr/vim-jsbeautify' 
  Bundle 'einars/js-beautify'
  Bundle 'elzr/vim-json'
  " add your bundles above
  if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
  endif
" }}}

" {{{ Setting up RestoreCursor capability
  function! RestoreCursor()
    if line("'\"") <= line("$")
      normal! g`"
      return 1
    endif
  endfunction

  augroup RestoreCursor
    autocmd!
    autocmd BufWinEnter * call RestoreCursor()
  augroup END
" }}}

set modeline
set modelines=2
set laststatus=2
set encoding=utf-8

set hlsearch
set incsearch
set ignorecase
set smartcase
set smartindent
set number

set t_Co=256
set background=dark
colorscheme vividchalk
"colorscheme distinguished
syntax on

" delimitMate
let delimitMate_expand_cr=1
imap <C-c> <CR><Esc>0

" syntastic
let g:syntastic_check_on_open=1
  let g:syntastic_mode_map={
    \'mode': 'active',
    \'active_filetypes': [],
    \'passive_filetypes': ['html', 'cpp', 'java', 'scala']
  \}

" java
augroup java
  autocmd!
  autocmd FileType java set ts=4 sw=4 et sm si ai sta
augroup END

" default
"set ts=4 sw=4 et sm si ai sta
set ts=2 sw=2 et sm si ai sta

" xslt
augroup xslt
  autocmd!
  autocmd FileType xslt set ts=2 sw=2 et sm si ai sta
augroup END

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
