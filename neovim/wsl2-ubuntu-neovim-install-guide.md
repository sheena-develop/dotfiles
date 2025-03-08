# WSL2(Ubuntu) の Neovim インストール手順

apt では、古いバージョンがインストールされてしまうため、以下の方法で最新をインストールする

1. 既存の古いバージョンの Neovim があれば、アンインストール

```sh
sudo apt remove neovim
```
2. ホームディレクトリに移動

```sh
cd ~
```

3. AppImage から Neovim(v0.10.4) をインストール

※ バージョンによってリンクが異なるので、[こちら]([Neovim Releases](https://github.com/neovim/neovim/releases/)を参考にURLを置き換えてください。

```sh
curl -LO https://github.com/neovim/neovim/releases/download/v0.10.4/nvim-linux-x86_64.appimage
```

4. 権限の変更

```sh
chmod u+x nvim-linux-x86_64.appimage
```

5. インストール

```sh
~/nvim-linux-x86_64.appimage --appimage-extract
```

6. 正しくインストールされ、バージョンが表示されることを確認

```sh
~/squashfs-root/AppRun --version
```

7. フォルダの移動

```sh
sudo mv ~/squashfs-root /
```

8. シンボリックリンクの設定

```sh
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
```

9. シンボリックリンクが正しく設定されていることを確認

```sh
which nvim
```

10. nvim コマンドでバージョンが表示されていることを確認

```sh
nvim --version
```

11. AppImage の削除

```sh
rm -rf nvim-linux-x86_64.appimage
```
