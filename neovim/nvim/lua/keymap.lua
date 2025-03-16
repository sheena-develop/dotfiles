-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
    local options = { noremap=true, silent=true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

vim.g.mapleader = " "

-- ターミナルモードで、Escを押すと、Normalモードに切り替わる
map("t", "<Esc>", "<C-\\><C-n>")

-- ノーマルモードで、「x」を押して文字を削除した際に、レジスタ（クリップボード）に削除した文字が保存されないようにする
map("n", "x", '"_x')

-- ノーマルモードで、「J」を押すと、現在のバッファの一つ前のバッファに移動する（バッファ切り替え）
map("n", "J", "<Cmd>BufferPrevious<CR>")

-- ノーマルモードで、「K」を押すと、現在のバッファの一つ後のバッファに移動する（バッファ切り替え）
map("n", "K", "<Cmd>BufferNext<CR>")

-- ノーマルモードで、「Space + w」を押すと、現在のバッファを閉じる
map("n", "<Leader>w", "<Cmd>BufferClose<CR>")

-- ノーマルモードで、ESCを2回連打すると、現在の検索ハイライトが解除される
map("n", "<Esc><Esc>", "<Cmd>nohlsearch<CR><Esc>")

-- ノーマルモードで、「Ctrl+b」を押すことで、ファイルエクスプローラー(Neo-tree)の表示をトグルする（表示・非表示の切り替え）
map("n", "<C-b>", "<Cmd>Neotree toggle<CR>")

-- コマンド「:SrcClip」を定義。指定されたディレクトリのファイル内容とパスをクリップボードにコピーする
vim.api.nvim_create_user_command("SrcClip", function(opts)
    require("source-clip").source_clip(opts)
end, { nargs = "?" })

-- ノーマルモードで、「f」を押すことで、HopWordを実行
map("n", "f", "<Cmd>HopWord<CR>")

-- ノーマルモードで、「Ctrl + t」を押すことで、ToggleTermをdirection=floatで実行
map("n", "<C-t>", "<Cmd>ToggleTerm size=100 direction=float<CR>")
-- ノーマルモードで、「Space + 1」を押すことで、ToggleTermをdirection=horizontalで実行
map("n", "<Leader>1", "<Cmd>Neotree close<CR><Cmd>1ToggleTerm size=20 direction=horizontal<CR>")
-- ノーマルモードで、「Space + 2」を押すことで、ToggleTermをdirection=horizontalで実行
map("n", "<Leader>2", "<Cmd>Neotree close<CR><Cmd>2ToggleTerm size=20 direction=horizontal<CR>")
-- ノーマルモードで、「Space + 3」を押すことで、ToggleTermをdirection=horizontalで実行
map("n", "<Leader>3", "<Cmd>Neotree close<CR><Cmd>3ToggleTerm size=20 direction=horizontal<CR>")
