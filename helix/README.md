# Helix Config

[Helix公式](https://helix-editor.com/)<br/>
[Helix Docs](https://docs.helix-editor.com/)<br/>
[Helix Github](https://github.com/helix-editor/helix)<br/>
[LSP Wiki](https://github.com/helix-editor/helix/wiki/Language-Server-Configurations)<br/>
[LSP Default Config](https://github.com/helix-editor/helix/blob/master/languages.toml)<br/>

設定ファイルが存在しない場合は、ファイルを作成してください。<br/>
```
touch .config/helix/config.toml
```

Google IMEの使用を推奨します。<br/>
[Google IME](https://www.google.co.jp/ime/)

この設定は、Ctrl + space でノーマルモードに戻すようにマッピングをしています。<br/>
全角入力中に、ノーマルモードに戻した時、全角入力なので半角入力にしないといけません。<br/>
これは、面倒でよくありません。<br/>
なので、以下の設定をすることで、Ctrl + Space + Spaceでノーマルモードに戻して、半角入力にすることができます。<br/>
```
右下の入力変換マークを右クリック > プロパティ > キー設定の選択の編集 > エントリーを追加 > モード：入力文字なし、入力キー：Ctrl Space、コマンド：IMEを無効化
```
