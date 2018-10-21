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

"---------------------------
" Start Neobundle Settings.
"---------------------------

if 0 | endif

 if has('vim_starting')
   if &compatible
     set nocompatible               " Be iMproved
   endif

" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

endif
 
"Required:
call neobundle#begin(expand('~/.vim/bundle/'))
 
" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'
 
" 今後このあたりに追加のプラグインをどんどん書いて行きます！！"
NeoBundle 'Shougo/vimproc.vim', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
    \ },
\ }
"
"基本的なシンタックスのチェック
"NeoBundle 'scrooloose/syntastic'
"
"補完"
NeoBundle 'Shougo/neocomplete.vim'
"NeoBundle 'Shougo/neocomplcashe'
"
"--------------------------------------------------------------------------------------------"
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
  \ 'default' : '',
  \ 'vimshell' : $HOME.'/.vimshell_hist',
  \ 'scheme' : $HOME.'/.gosh_completions'
  \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "¥<C-y>" : "¥<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>¥<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. ¥t]->¥h¥w*¥|¥h¥w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *¥t]¥%(¥.¥|->¥)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *¥t]¥%(¥.¥|->¥)¥|¥h¥w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"------------------------------------------------------------------------------------------------------



"スニペット"
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
" -----------------------------------------------------------------------------------------------------
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
 
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: "\<TAB>"
 
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
"-------------------------------------------------------------------------------------------------------

"ユナイト"
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'

"c++言語補完"
NeoBundle 'osyo-manga/vim-marching'

" --------------------------------------------------------------------------------------------------------
" clang コマンドの設定
let g:marching_clang_command = "C:/clang.exe"

" オプションを追加する
" filetype=cpp に対して設定する場合
let g:marching#clang_command#options = {
            \   "cpp" : "-std=gnu++1y"
            \}

" インクルードディレクトリのパスを設定
let g:marching_include_paths = [
            \   "C:/MinGW/lib/gcc/mingw32/4.6.2/include/c++" ,
            \   "C:/cpp/boost"
            \]

" neocomplete.vim と併用して使用する場合
let g:marching_enable_neocomplete = 1

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.cpp =
            \ '[^.[:digit:] *¥t]¥%(¥.¥|->¥)¥w*¥|¥h¥w*::¥w*'

" 処理のタイミングを制御する
" 短いほうがより早く補完ウィンドウが表示される
" ただし、marching.vim 以外の処理にも影響するので注意する
set updatetime=200

" オムニ補完時に補完ワードを挿入したくない場合
imap <buffer> <C-x><C-o> <Plug>(marching_start_omni_complete)

" キャッシュを削除してからオムに補完を行う
imap <buffer> <C-x><C-x><C-o> <Plug>(marching_force_start_omni_complete)


" 非同期ではなくて、同期処理でコード補完を行う場合
" この設定の場合は vimproc.vim に依存しない
" let g:marching_backend = "sync_clang_command"
"---------------------------------------------------------------------------------------------------------

"colorscheme"hybrid"
NeoBundle 'w0ng/vim-hybrid'

"colorscheme"molokai"
NeoBundle 'tomasr/molokai'

"colorscheme"solarized
NeoBundle 'altercation/vim-colors-solarized'
"colorscheme"mustang
NeoBundle 'croaker/mustang-vim'
"colorscheme"jellybeans
NeoBundle 'nanotech/jellybeans.vim'

"colorscheme"いろいろ"
NeoBundle 'flazz/vim-colorscheme'

"NERDTreeを設定
NeoBundle 'scrooloose/nerdtree' 

"()を作ってくれるやつ
NeoBundle 'Townk/vim-autoclose'

"grep
NeoBundle 'grep.vim'

"ifとかの終了宣言を自動で挿入してくれるやつ
NeoBundleLazy 'tpope/vim-endwise', {
 \  'autoload' : { 'insert' : 1,}}

"vim-LaTeX
NeoBundle 'vim-latex/vim-latex'

"codic-vim
NeoBundle 'koron/codic-vim'

"neco-look"
NeoBundle 'ujihisa/neco-look'

"auto-ctags"
NeoBundle 'soramugi/auto-ctags.vim'
"let g:auto_ctags = 1
"let g:auto_ctags_directory_list = ['/cygwin64/home/takuro']
set tags+=/cygwin64/home/takuro/tags
" tagsジャンプの時に複数ある時は一覧表示                                        
nnoremap <C-]> g<C-]> 

"--
"markdown
"--
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
""" markdown {{{
  autocmd BufRead,BufNewFile *.mkd  set filetype=markdown
  autocmd BufRead,BufNewFile *.md  set filetype=markdown
  " Need: kannokanno/previm
  nnoremap <silent> <C-p> :PrevimOpen<CR> " Ctrl-pでプレビュー
  " 自動で折りたたまないようにする
  let g:vim_markdown_folding_disabled=1
  let g:previm_enable_realtime=1

" }}}

"function list
NeoBundleLazy "majutsushi/tagbar", {
      \ "autoload": { "commands": ["TagbarToggle"] }}
if ! empty(neobundle#get("tagbar"))
   " Width (default 40)
  let g:tagbar_width = 20
  " Map for toggle
  nn <silent> <leader>t :TagbarToggle<CR>
endif

"コメントアウト
NeoBundle 'tomtom/tcomment_vim'

"ネストを視覚化{{{
NeoBundle 'nathanaelkane/vim-indent-guides'
" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1

" ファイル名で検索し、そのままVim上で開くことができるプラグイン
NeoBundle 'ctrlpvim/ctrlp.vim'
set runtimepath^=~/.vim/bundle/ctrlp.vim

"}}}
call neobundle#end()
 
" Required:
filetype plugin indent on
 
" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck
 
"-------------------------
" End Neobundle Settings.
"------------------------
"
"
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
"colorscheme の設定
"-----------------------
colorscheme jellybeans

