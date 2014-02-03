""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VUNDLE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'phleet/vim-mercenary'
Bundle 'kien/ctrlp.vim'
Bundle 'greatghoul/vim-web-indent'
Bundle 'hynek/vim-python-pep8-indent'
Bundle 'jnurmine/Zenburn'
Bundle 'Townk/vim-autoclose'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'vim-scripts/linediff.vim'
Bundle 'vim-scripts/Lawrencium'
Bundle 'vim-scripts/gitv'
Bundle 'davidhalter/jedi-vim'
Bundle 'vim-scripts/Clam'
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/git-cheat'
Bundle 'vim-scripts/diffchanges.vim'
Bundle 'sukima/xmledit'
Bundle 'scrooloose/nerdcommenter'
Bundle 'vim-scripts/DirDiff.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'tell-k/vim-autopep8'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NORMAL CONFIG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype indent plugin on
syntax on
set t_Co=256
colorscheme zenburn
set hidden
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
nnoremap <F2> :set invnumber<CR>

autocmd BufWritePre * :%s/\s\+$//e

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :vsp %%
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
execute pathogen#infect()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" exuberant ctags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags=~/mytags

map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
"let c='a'
"while c <= 'z'
"  exec "set <A-".toupper(c).">=\e".c
"  exec "imap \e".c." <A-".toupper(c).">"
"  let c = nr2char(1+char2nr(c))
"endw
set <A-]>=]
imap ] <A-]

set timeout ttimeoutlen=50
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
