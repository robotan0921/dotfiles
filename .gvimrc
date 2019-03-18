"B
"##.gvimrc by takuro
"Display"
colorscheme molokai
"colorscheme jellybeans
set background=dark
"set shell=cmd.exe
"set shellcmdflag=/C
"set columns=100 "横幅 
"au GUIEnter * simalt ~x
"set lines=45    "行数"
"syntax enable   "シンタックスカラーリングを設定する
set number    "行番号を表示する
set title    "編集中のファイル名を表示する
set showcmd    "入力中のコマンドを表示する
set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]
set laststatus=2    "ステータスラインを常に表示する
gui
set transparency=0

set nobackup
set noswapfile

"フォントの設定
set linespace=0
" フォント名に日本語名を使うので、一時的に文字コードを変える
"set encoding=cp932
"set guifont=Osaka－等幅:h12
"set guifontwide=Osaka－等幅:h9
" 文字コードを元に戻す
set encoding=utf8
"
"メニューバー非表示"
"set guioptions-=m
"set guioptions+=M
"set guioptions-=T
