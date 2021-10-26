"##.vimrc by takuro
syntax enable
language C

set shellpipe=
set fileencoding=utf-8 
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac
set ambiwidth=double

set expandtab
set tabstop=4
set softtabstop=4
set autoindent
set smartindent
set shiftwidth=4

set incsearch
set ignorecase
set smartcase
set hlsearch

set background=dark
set number
set whichwrap=b,s,h,l,<,>,[,],~
set cursorline
set virtualedit=block
set showmatch
set visualbell
set laststatus=2
set showmode
set showcmd
set ruler
set wildmenu
set history=5000

set autoread
set nobackup
set noswapfile
set noundofile
set viminfo=

set clipboard+=unnamed
set backspace=indent,eol,start

nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

if has('mouse')
    set mouse=a
    if has('mouse_sgr')
        set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif

"colorscheme mojave