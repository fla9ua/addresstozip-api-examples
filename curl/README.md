# curlサンプル

[Address to ZIP](https://addresstozip.jp) — 住所⇄郵便番号を変換する郵便番号APIの、curl最小サンプルです。

- 住所 → 郵便番号: `search.sh`
- 郵便番号 → 住所(逆引き): `lookup.sh`

APIキーは [こちら](https://addresstozip.jp/signup) から取得できます(14日間無料、以降月額¥1,980)。

## 使い方

```bash
export ADDRESSTOZIP_API_KEY=your_key
chmod +x search.sh lookup.sh

./search.sh "東京都千代田区丸の内"
./lookup.sh 100-0005
```

## もっと詳しく

- [使い方ガイド(curl/JavaScript/Python/PHP/Ruby/Go)](https://addresstozip.jp/guide)
- [APIリファレンス](https://addresstozip.jp/docs)
