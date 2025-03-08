# Helix

- [Helix](https://helix-editor.com/)
- [Helix Docs](https://docs.helix-editor.com/)
- [Helix Github](https://github.com/helix-editor/helix)
- [LSP Wiki](https://github.com/helix-editor/helix/wiki/Language-Server-Configurations)
- [LSP Default Config](https://github.com/helix-editor/helix/blob/master/languages.toml)

設定ファイルが存在しない場合は、ファイルを作成してください。

```sh
mkdir .config
mkdir .config/helix
mkdir .config/themes
touch .config/helix/config.toml
touch .config/helix/language.toml
```

LSPのインストール

```sh
npm i -g @vue/language-server
npm i -g typescript typescript-language-server
```
