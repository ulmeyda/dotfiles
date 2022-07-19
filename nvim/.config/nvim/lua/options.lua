local opt = vim.opt
opt.encoding='utf-8' -- 内部エンコード
-- vim.cmd scriptencoding utf-8 -- script内の文字コード
opt.fileencoding='utf-8' -- 保存時の文字コード
opt.termguicolors=true --gui color
opt.background='dark' -- dark theme
opt.redrawtime=3000 -- syntaxハイライトが消える突然対応
-- opt.ambiwidth='double' -- マルチバイト記号対応
opt.number=true -- 桁表示
opt.clipboard:append "unnamed" -- clip
opt.laststatus=2 -- ステータスラインの表示
opt.list=true -- スペースの可視化
opt.listchars={tab='» ', trail='-', extends='»', precedes='«', nbsp='%'} -- space 可視化文字
opt.ruler=false -- ruler
opt.autoindent=true -- 改行時に前の行のインデントを継続する
opt.softtabstop=2 -- 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
opt.shiftwidth=4 -- 自動インデントでずれる幅
opt.tabstop=4 -- タブによるスペース数
opt.smarttab=true -- 行頭の余白内で Tab を打ち込むと、shiftwidth の数だけインデントする。
opt.expandtab=true -- タブ入力を複数の空白入力に置き換える
opt.smartindent=true -- 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
opt.shell='/bin/zsh'
opt.swapfile=false -- swap
opt.backup=false -- backup
opt.hid=true --  保存されていないファイルがあるときでも別のファイルを開くことが出来る
opt.autoread=true -- 外部でファイルに変更がされた場合は読みなお
opt.cmdheight=1 --  メッセージ表示欄
opt.wildmenu=true
-- opt.wildmode='longest,list,full' -- コマンドラインモードでTABキーによるファイル名補完を有効にする
opt.formatoptions:append('mM') -- 行整形時マルチバイト文字対応.□や○の文字があってもカーソル位置がずれない
opt.showmatch=true --  対応する括弧を強調表示
opt.wrap=false -- 折返しなし
opt.scrolloff=10 --  スクロール時の余白行数
opt.fileformat='unix'
opt.fileformats='unix,dos,mac' -- fileformat
opt.whichwrap='b,s,h,l,<,>,[,]' --  カーソルを行をまたいで移動
opt.virtualedit='block' --  行末に空白があっても矩形選択可能
opt.maxmempattern=2000 -- pattern保存数
opt.ignorecase=true -- 大文字小文字区別しないで検索
opt.smartcase=true -- ignorecaseと合わせて使う
opt.wrapscan=true --  検索がファイル末尾まで進んだら、ファイル先頭から再び検索する。
opt.hlsearch=true --  前回の検索パターンが存在するとき、それにマッチするテキストを全て強調表示する。
opt.ttimeout=true --  日本語対応用
opt.ttimeoutlen=50 --  日本語対応用
opt.pumblend=5 --  floating widnow
opt.grepprg='rg --vimgrep --no-heading' -- grep rg
opt.grepformat='%f:%l:%c:%m,%f:%l:%m'


-- autocmd
vim.cmd('au FileType * setlocal formatoptions-=ro') -- コメントアウト行後の改行時にコメントアウトを入れない
vim.cmd('au FileType go setlocal foldmethod=marker') -- 折り畳み折り返し
vim.cmd('autocmd BufEnter * silent! :lcd%:p:h')
vim.cmd('autocmd QuickfixCmdPost make,*grep* cwin') -- 検索結果をwin
vim.cmd('au FileType go nmap <Leader>cm :!gocmt -i % <CR><CR>') -- gocmt

