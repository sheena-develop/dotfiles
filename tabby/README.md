# ターミナルエミュレータ Tabby

## リンク

- [Tabby](https://tabby.sh/)
- [Tabbyとは？](https://github.com/Eugeny/tabby/blob/master/README.ja-JP.md/)
- [最新リリース](https://github.com/Eugeny/tabby/releases/latest/)

## 設定

### 言語の設定

1. 右上の歯車マークをクリック
2. 「Application」をクリック
3. 「Application settings」の「Language」を「日本語」に変更

### フォントの設定

※[0xProto](https://github.com/0xType/0xProto) がインストール済みであることを前提としています。

1. 右上の歯車マークをクリック
2. 「外観」をクリック
3. 「フォント」を「0xProto Nerd Font」に変更
4. 「標準フォントの太さ」を「100」に変更
5. 「太字フォントの太さ」を「400」に変更

### WSL2の接続方法

※言語が日本語であることを前提としています。

WSL2に接続するには、プロファイルの設定が必要となります。

1. 右上の歯車マークをクリック
2. 「プロファイルと接続」をクリック
3. 「標準」の「WSL」で複製をクリック
4. 以下で設定

```
「動的なタブ名を無効にする」：有効
「全般」の「コマンドライン」：C:\\WINDOWS\\system32\\wsl.exe
「作業ディレクトリ」：\\wsl$\WSL名\home\ユーザー名
```

5. 「保存」をクリック
