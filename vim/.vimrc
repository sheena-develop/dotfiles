" =====基本設定（ファイルやバックアップ、読み込み関連）=====

" 文字コードをUTF-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden


" =====UI設定（表示・ステータス・タイトル関連）=====

" 行番号を表示
set number
" カーソルラインを表示する
set cursorline
" ステータスラインを常に表示
set laststatus=2
set list listchars=tab:\▸\-,trail:·,eol:⏎
" タイトルを表示
set title
" カーソルの行数表示
set cursorline


" =====動作設定（補完や検索、マウス操作）=====

" 入力中のコマンドをステータスに表示する
set showcmd
" コマンドラインの補完
set wildmode=list:longest
" 補完ウィンドウの設定
set completeopt=menuone
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" マウス操作を有効にする
set mouse=a


" =====インデントとタブ設定=====

" Tab文字を半角スペースにする
set expandtab
" 前の行のインデントを継承する
set autoindent
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのインデント幅（スペースいくつ分）
set shiftwidth=2


" =====検索設定=====

" 検索時大文字小文字を区別しない
set ignorecase
" 検索時に大文字を入力した場合ignorecaseが無効になる
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索語をハイライト表示
set hlsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>


" =====インデントと補完関連=====

" インデントはスマートインデント
set smartindent
" 括弧入力時の対応する括弧を表示
set showmatch
" 改行時に前の行のインデントを継続しない
set smartindent

" =====その他=====

" ヤンク時クリップボードに自動同期させる
augroup Yank
  au!
  autocmd TextYankPost * :call system('echo ' . shellescape(@") . ' | iconv -f utf-8 -t utf-16le | clip.exe')
augroup END
