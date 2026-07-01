# PHPサンプル

[Address to ZIP](https://addresstozip.jp) — 住所⇄郵便番号を変換する郵便番号APIの、PHP最小サンプルです。

- 住所 → 郵便番号: `search.php`
- 郵便番号 → 住所(逆引き): `lookup.php`
- 依存ライブラリなし(ext-curlのみ)

APIキーは [こちら](https://addresstozip.jp/signup) から取得できます(14日間無料、以降月額¥1,980)。

## 使い方

```bash
export ADDRESSTOZIP_API_KEY=your_key

php search.php "東京都千代田区丸の内"
php lookup.php 100-0005
```

## もっと詳しく

- [使い方ガイド(curl/JavaScript/Python/PHP/Ruby/Go)](https://addresstozip.jp/guide)
- [APIリファレンス](https://addresstozip.jp/docs)
