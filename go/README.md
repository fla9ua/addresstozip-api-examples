# Goサンプル

[Address to ZIP](https://addresstozip.jp) — 住所⇄郵便番号を変換する郵便番号APIの、Go最小サンプルです。

- 住所 → 郵便番号: `search.go`
- 郵便番号 → 住所(逆引き): `lookup.go`
- 依存パッケージなし(標準ライブラリのみ)

APIキーは [こちら](https://addresstozip.jp/signup) から取得できます(14日間無料、以降月額¥1,980)。

## 使い方

```bash
export ADDRESSTOZIP_API_KEY=your_key

go run search.go "東京都千代田区丸の内"
go run lookup.go 100-0005
```

各ファイルは独立した `package main` です。`go run` にファイル名を指定して実行してください(`go run .` ではなく)。

## もっと詳しく

- [使い方ガイド(curl/JavaScript/Python/PHP/Ruby/Go)](https://addresstozip.jp/guide)
- [APIリファレンス](https://addresstozip.jp/docs)
