set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
let g:vundle_default_git_proto='git'

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Bundle 'greatghoul/vim-web-indent'
Bundle 'hynek/vim-python-pep8-indent'
Bundle 'jnurmine/Zenburn'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/diffchanges.vim'
Bundle 'sukima/xmledit'
Bundle 'tell-k/vim-autopep8'
Bundle 'plasticboy/vim-markdown'
Bundle 'mattn/emmet-vim'
Bundle 'marijnh/tern_for_vim'
Bundle 'Raimondi/delimitMate'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'einars/js-beautify'
Bundle 'nathanaelkane/vim-indent-guides'

filetype plugin indent on
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NORMAL CONFIG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set t_Co=256
colorscheme zenburn
set wildmenu
set showcmd
set ignorecase
set smartcase
set backspace=indent,eol,start
set autoindent
set nostartofline
set ruler
set laststatus=2
set confirm
set t_vb=
set cmdheight=2
set notimeout ttimeout ttimeoutlen=200
set pastetoggle=<F11>
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set number
set noscb
set colorcolumn=80
map Y y$
map <C-H> <C-W>h<C-W>_
map <C-L> <C-W>l<C-W>_
autocmd VimResized * :wincmd =

let mapleader = ","
let maplocalleader = ","
nnoremap <silent> <leader><leader> :ClearCtrlPCache<cr>\|:CtrlP<cr>

autocmd BufWritePre * :%s/\s\+$//e

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap %% <C-R>=expand('%:h').'/'<CR>
map <leader>e :edit %%
map <leader>v :vsp %%
map <leader>n :vsp
map <leader>s :sp %%
map <leader>h :sp %%

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RAINBOW PARENTHESES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SYNTASTIC
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_python_checkers = ['pep8', 'pylint', 'pyflakes']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_html_tidy_ignore_errors = ['<div> proprietary attribute "ng-', '<summernote> is not recognized!', '<span> proprietary attribute "translate"', '<button> proprietary attribute "ng-"', '<label> proprietary attribute "translate"', 'trimming empty <i>', '<button> proprietary attribute "ng-', '<input> proprietary attribute "ng-', '<span> proprietary attribute "ng-', '<button> proprietary attribute "translate"', '<li> proprietary attribute "ng-"', '<label> proprietary attribute "ng-', '<textarea> proprietary attribute "ng-', '<li> proprietary attribute "ng-']


set timeout ttimeoutlen=50
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
set showcmd

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>vd :call VerticalGoto()<CR>
let g:ycm_autoclose_preview_window_after_completion = 1

function! VerticalGoto()
    :vsplit
    :YcmCompleter GoTo
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Markdown
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled=1

au FileType html setl sw=2 sts=2 et
au FileType htmldjango setl sw=2 sts=2 et
au BufRead,BufNewFile *.less set filetype=css

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JsBeautify
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType javascript map <leader>f :call JsBeautify()<cr>
autocmd FileType html map <leader>f :call HtmlBeautify()<cr>
autocmd FileType css map <leader>f :call CSSBeautify()<cr>
autocmd FileType less map <leader>f :call CSSBeautify()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent Guides
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi IndentGuidesOdd  ctermbg=white
hi IndentGuidesEven ctermbg=lightgrey
set fileformats=unix
