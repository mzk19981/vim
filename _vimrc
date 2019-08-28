"---------------------------------------------------------------------------
"カラースキーム変更
syntax on
colorscheme molokai
"---------------------------------------------------------------------------
"バックアップ
set backup
set backupdir=~/VimBackUp/

""" Swap file settings (.file.txt.swp)
set swapfile
set directory=~/VimBackUp/

""" Undo file settings (.file.txt.un~)
set undofile
set undodir=~/VimBackUp/
"---------------------------------------------------------------------------
" 検索の挙動に関する設定:
"
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set nosmartcase
"ビジュアルモードで選択した部分を検索
vnoremap * "zy:let @/ = @z<CR>n
"---------------------------------------------------------------------------
" 編集に関する設定:
"
"空行を挿入
nnoremap o o<ESC>
nnoremap O O<ESC>
" タブの画面上での幅
set tabstop=4
" タブキー押下時に挿入される文字幅を指定
set softtabstop=4
" タブをスペースに展開しない (expandtab:展開する)
set noexpandtab
" インデント幅
set shiftwidth=4
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM
"検索結果のハイライトと取り消し
set hlsearch
nnoremap <ESC><ESC> :nohlsearch<CR>
"全角スペースの可視化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

"括弧,クォーテーションの補完
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap ｛ {}<Left>
inoremap （ ()<ESC>i
inoremap （ ()<LEFT>
inoremap ” ""<LEFT>
inoremap ’ ''<LEFT>

"全角数字の補完
inoremap ０ 0
inoremap １ 1
inoremap ２ 2
inoremap ３ 3
inoremap ４ 4
inoremap ５ 5
inoremap ６ 6
inoremap ７ 7
inoremap ８ 8
inoremap ９ 9
"ノーマルモードで: を;に置き換える"
noremap ; :
"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:
"
"ビープ音
set visualbell t_vb=
set noerrorbells
" 行番号を非表示 (number:表示)
set number
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を非表示 (list:表示)
set list
" どの文字でタブや改行を表示するかを設定
set listchars=tab:>-,space:~,extends:<,trail:~,eol:↲,nbsp:%
" 長い行を折り返して表示 (nowrap:折り返さない)
set wrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title
" 画面を黒地に白にする (次行の先頭の " を削除すれば有効になる)
"colorscheme darkblue" (Windows用gvim使用時はgvimrcを編集すること)
" ヤンクでクリップボードにコピー
set clipboard=unnamed,autoselect
"ウィンドウの下にterminalを開く"
set splitbelow
"terminalのサイズ指定"
set termwinsize=10x0
"bashを開く
nnoremap gs :term ++close bash<CR>
"カーソル下をgrep
nnoremap gr yiw:tabnew grep_<C-R>"<CR>:r! grep -lri <C-R>" ./<CR>
"grep結果からファイルを開く
nnoremap gf <C-W>f<C-W><S-K><C-W>j:res 7<CR><C-W>k/<C-R>"<CR>
"----------------------------------------------------------"
"emacs移動
" insert mode
inoremap <C-p> <Up>
inoremap <C-n> <Down>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>
"-----------------------------------------------------------
"tagジャンプ
set tags=tags;
nmap <F8> :TagbarToggle<CR>