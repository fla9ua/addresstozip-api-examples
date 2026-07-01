# Node.jsサンプル

[Address to ZIP](https://addresstozip.jp) — 住所⇄郵便番号を変換する郵便番号APIの、Node.js最小サンプルです。

- 住所 → 郵便番号: `search.js`
- 郵便番号 → 住所(逆引き): `lookup.js`
- 依存ライブラリなし(Node.js 18+ 標準の `fetch` のみ)
- 日本郵便の公式データに毎月追従

## セットアップ

このディレクトリに入って実行してください([リポジトリ全体のREADME](../README.md)も参照)。

APIキーは [こちら](https://addresstozip.jp/signup) から取得できます(14日間無料、以降月額¥1,980)。
登録なしで試したい場合は[ドキュメントのライブ実行](https://addresstozip.jp/docs#live)からどうぞ。

## 使い方

```bash
export ADDRESSTOZIP_API_KEY=your_key

# 住所 → 郵便番号
node search.js "東京都千代田区丸の内"

# 郵便番号 → 住所
node lookup.js 100-0005
```

### 出力例

```bash
$ node search.js "東京都千代田区丸の内"
[
  {
    "zipcode": "100-0005",
    "prefecture": "東京都",
    "city": "千代田区",
    "town": "丸の内",
    "kana": "トウキョウト チヨダク マルノウチ"
  }
]
```

## もっと詳しく

- [使い方ガイド(curl/JS/Python/PHP/Ruby/Go)](https://addresstozip.jp/guide)
- [APIリファレンス](https://addresstozip.jp/docs)
- [無料の郵便番号APIとの比較](https://addresstozip.jp/compare)

## ライセンス

MIT
