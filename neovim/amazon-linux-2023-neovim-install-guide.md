# Amazon Linux 2023 の Neovim インストール手順

1. ホームディレクトリに移動

```sh
cd ~
```

2. Neovim(v0.10.4) のダウンロード

※ バージョンによってリンクが異なるので、[こちら]([Neovim Releases](https://github.com/neovim/neovim/releases/)を参考にURLを置き換えてください。

```sh
curl -LO https://github.com/neovim/neovim/releases/download/v0.10.4/nvim-linux64.tar.gz
```

3. 削除

```sh
sudo rm -rf /opt/nvim
```

4. 解凍

```sh
sudo tar -C /opt -xzf ~/nvim-linux64.tar.gz
```

5. .bashrc_profile に追加(~/.bashrc, ~/.zshrc, ...などでも可)

```sh
export PATH="$PATH:/opt/nvim-linux64/bin"
```

6. Neovim がインストールされていることを確認

```sh
nvim --version
```
