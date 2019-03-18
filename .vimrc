"##.vimrc by takuro
syntax enable

set shellpipe=

"language -English-"
language C

"----------------------------------------------------------
" 文字
"----------------------------------------------------------
set fileencoding=utf-8  " 保存時の文字コード
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決
"
"----------------------------------------------------------
" ステータスライン
"----------------------------------------------------------
set laststatus=2 " ステータスラインを常に表示
set showmode " 現在のモードを表示
set showcmd " 打ったコマンドをステータスラインの下に表示
set ruler " ステータスラインの右側にカーソルの位置を表示する

"----------------------------------------------------------
" タブ・インデント
"----------------------------------------------------------
set expandtab " タブ入力を複数の空白入力に置き換える
set tabstop=4 " 画面上でタブ文字が占める幅
set softtabstop=4 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=4 " smartindentで増減する幅

"----------------------------------------------------------
" 文字列検索
"----------------------------------------------------------
set incsearch " インクリメンタルサーチ. １文字入力毎に検索を行う
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch " 検索結果をハイライト

" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

"----------------------------------------------------------
" カーソル
"----------------------------------------------------------
set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set number " 行番号を表示
set cursorline " カーソルラインをハイライト

" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

" バックスペースキーの有効化
set backspace=indent,eol,start

"----------------------------------------------------------
" カッコ・タグの対応
"----------------------------------------------------------
set showmatch " 括弧の対応関係を一瞬表示する
source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する

"----------------------------------------------------------
" コマンドモード
"----------------------------------------------------------
set wildmenu " コマンドモードの補完
set history=5000 " 保存するコマンド履歴の数

"----------------------------------------------------------
" マウスでカーソル移動とスクロール
"----------------------------------------------------------
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

"----------------------------------------------------------
" バックアップファイル
"----------------------------------------------------------
set nobackup "バックアップファイル作らない"
set noswapfile "スワップファイル作らない"
set noundofile
set viminfo= "viminfoを作らない"


set clipboard+=unnamed "OSのクリップボードを使う"
set virtualedit=block "文字のないところにカーソル移動できる"
set background=dark

"外部grep"
set grepprg=c:/cygwin64/bin/grep\ -nH     
au QuickfixCmdPost grep copen


"----------------------------------------------------------

"----------------------------------------------------------
" Vundle Settings.
"----------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'scrooloose/nerdtree' " NERDTree: a file system explorer
Plugin 'tomtom/tcomment_vim' "コメントアウト
Plugin 'Townk/vim-autoclose'  " '()'の補完
Plugin 'grep.vim' " Grep
Plugin 'tpope/vim-endwise' " end certain structures automatically
Plugin 'vim-latex/vim-latex' " vim-latex
Plugin 'koron/codic-vim' " codic-vim
Plugin 'ujihisa/neco-look'  " neco-look
Plugin 'nathanaelkane/vim-indent-guides' " ネストを視覚化
let g:indent_guides_enable_on_vim_startup = 1  " vim起動時に自動でvim-indent-guidesをオンにする

" Colorschemes
Plugin 'w0ng/vim-hybrid'
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'
Plugin 'croaker/mustang-vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'flazz/vim-colorscheme'

" Unite
Plugin 'Shougo/unite.vim'
Plugin 'ujihisa/unite-colorscheme'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"----------------------------------------------------------
" End of Vundle Settings.
"----------------------------------------------------------

"-------------------------
"Start vim-LaTeX Settings.
"-------------------------
""
"" Vim-LaTeX
"
filetype plugin on
filetype indent on
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Imap_UsePlaceHolders = 1
let g:Imap_DeleteEmptyPlaceHolders = 1
let g:Imap_StickyPlaceHolders = 0
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
let g:Tex_CompileRule_dvi = 'platex $*'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
let g:Tex_BibtexFlavor = 'pbibtex'
let g:Tex_MakeIndexFlavor = 'upmendex $*.idx'
let g:Tex_ViewRule_pdf = 'texworks'
let g:Tex_ViewRule_dvi = 'dviout'
let g:Tex_IgnoredWarnings =
	\'Underfull'."\n".
	\'Overfull'."\n".
	\'specifier changed to'."\n".
	\'You have requested'."\n".
	\'Missing number, treated as zero.'."\n".
	\'There were undefined references'."\n".
	\'Citation %.%# undefined'."\n".
	\"Font shape \`OT1/txsy/m/n\' undefined"."\n".
	\"Font shape \`JT1/gt/m/it\' undefined"."\n".
	\"Font shape \`JY1/gt/m/it\' undefined"."\n".
	\"Font shape \`JT1/mc/m/it\' undefined"."\n".
	\"Font shape \`JT1/aer/m/n\' undefined"."\n".
	\"Font shape \`JY1/aer/m/n\' undefined"."\n".
	\"Font shape \`TY1/aer/m/n\' undefined"."\n".
	\"Font shape \`T1/aer/m/n\' undefined"."\n".
	\"Font shape \`T1/aer/bx/n\' undefined"."\n".
	\"Font shape \`T1/aer/m/it\' undefined"."\n".
	\"Font shape \`OMS/aer/m/n\' undefined"."\n".
	\"Font shape \`OMS/aer/m/it\' undefined"."\n".
	\'LaTeX Font Warning: Some font shapes were not available, defaults substituted.'."\n".
    \'LaTeX Warning: Label(s) may have changed. Rerun to get cross-references right.'
let g:Tex_IgnoreLevel = 99
"-----------------------
"end vim-latex settings.
"-----------------------

"-----------------------
"DictionaryTranslate
"-----------------------
function! s:DictionaryTranslate(...)
    let l:word = a:0 == 0 ? expand('<cword>') : a:1
    call histadd('cmd', 'DictionaryTranslate '  . l:word)
    if l:word ==# '' | return | endif
    let l:gene_path = '/cygwin64/home/takuro/.vim/dict/gene.txt'
    let l:jpn_to_eng = l:word !‾? '^[a-z_]¥+$'
    let l:output_option = l:jpn_to_eng ? '-B 1' : '-A 1' " 和英 or 英和

    silent pedit Translate¥ Result | wincmd P | %delete " 前の結果が残っていることがあるため
    setlocal buftype=nofile noswapfile modifiable
    silent execute 'read !grep -ihw' l:output_option l:word l:gene_path
    silent 0delete
    let l:esc = @z
    let @z = ''
    while search("^" . l:word . "$", "Wc") > 0 " 完全一致したものを上部に移動
        silent execute line('.') - l:jpn_to_eng . "delete Z 2"
    endwhile
    silent 0put z
    let @z = l:esc
    silent call append(line('.'), '==')
    silent 1delete
    silent wincmd p
endfunction
command! -nargs=? -complete=command DictionaryTranslate call <SID>DictionaryTranslate(<f-args>)
"-----------------------
"end DictionaryTranslate 
"-----------------------

"-----------------------
" filetypeの設定
"-----------------------
if !exists('g:neocomplete#text_mode_filetypes')
    let g:neocomplete#text_mode_filetypes = {}
endif
let g:neocomplete#text_mode_filetypes = {
    \ 'rst': 1,
    \ 'markdown': 1,
    \ 'gitrebase': 1,
    \ 'gitcommit': 1,
    \ 'vcs-commit': 1,
    \ 'hybrid': 1,
    \ 'text': 1,
    \ 'help': 1,
    \ 'tex': 1,
    \ }
"-----------------------
" end filetypeの設定
"-----------------------

"-----------------------
" CDL の設定
"-----------------------
au BufRead,BufNewFile *.cdl set filetype=cdl


"-----------------------
" Colorscheme Setting
"-----------------------
colorscheme jellybeans
