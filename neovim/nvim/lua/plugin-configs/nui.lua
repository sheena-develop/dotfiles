return function()
  local Popup = require("nui.popup")

  local command_list = [[
q - コマンドリストを閉じる

<Leader> - <Space>

<検索>
Normal mode, <Esc><Esc> - 検索結果のハイライトを取り消し

<バッファ>
Normal mode, Shift + j - 1つ前のバッファに移動する
Normal mode, Shift + k - 1つ後のバッファに移動する
Normal mode, Space + w - バッファを閉じる

<プラグイン>
Normal mode, Ctrl + b - Neo-treeの表示をトグルする
Normal mode, Ctrl + t - ToggleTermを使ってターミナル表示

Normal mode, Space + lg - LazyGitを表示
  LazyGitがインストールされていること（https://github.com/jesseduffield/lazygit?tab=readme-ov-file#installation）
Normal mode, LazyGitが表示された状態で、q - LazyGitを非表示
  LazyGitがインストールされていること（https://github.com/jesseduffield/lazygit?tab=readme-ov-file#installation）

Normal mode, Space + ld - LazyDockerを表示
  LazyDockerがインストールされていること（https://github.com/jesseduffield/lazydocker?tab=readme-ov-file#binary-release-linuxosxwindows）
Normal mode, LazyDockerが表示された状態で、q - LazyDockerを非表示
  LazyDockerがインストールされていること（https://github.com/jesseduffield/lazydocker?tab=readme-ov-file#binary-release-linuxosxwindows）

Normal mode, f - HopWordを実行

Normal mode, Space + t + j - カーソルが置かれている英単語の和訳をポップアップ表示
Normal mode, Space + t + e - カーソルが置かれている日本語の英訳をポップアップ表示

Normal mode, Space + t + w - Pantranをポップアップ表示
Normal mode, Pantranが表示された状態で、q - Pantranを非表示
Normal mode, Pantranが表示された状態で、S - 翻訳させる言語を切替え（表示されている言語が翻訳元を示す）
Insert mode, Pantranが表示された状態で、Ctrl + y - 翻訳後の文字をクリップボードにコピーする

<その他>
Command mode, :SrcClip ~/.config/nvim - 指定されたディレクトリのファイル内容とパスをクリップボードにコピーする
  除外したいディレクトリ、ファイルは、~/.config/nvim/lua/.source-clip に追記する
]]

  local function show_commands()
    local popup = Popup({
      enter = true,
      focusable = true,
      border = {
        style = "rounded",
        text = {
          top = " コマンドリスト ",
          top_align = "center",
        },
      },
      position = "50%",
      size = {
        width = 80,
        height = 30,
      },
      buf_options = {
        modifiable = false,
        readonly = true,
      },
    })

    vim.api.nvim_buf_set_lines(popup.bufnr, 0, -1, false, vim.split(command_list, "\n"))

    popup:map("n", "q", function()
      popup:unmount()
    end, { noremap = true })

    popup:mount()
  end

  vim.api.nvim_create_user_command("S", show_commands, {})

end
