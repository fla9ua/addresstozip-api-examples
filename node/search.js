// 住所 → 郵便番号
// 使い方: ADDRESSTOZIP_API_KEY=xxx node search.js "東京都千代田区丸の内"
const apiKey = process.env.ADDRESSTOZIP_API_KEY;
const address = process.argv[2];

if (!apiKey) {
  console.error("ADDRESSTOZIP_API_KEY が未設定です。https://addresstozip.jp/signup で取得してください。");
  process.exit(1);
}
if (!address) {
  console.error('使い方: node search.js "東京都千代田区丸の内"');
  process.exit(1);
}

const url = new URL("https://addresstozip.jp/api/v1/search");
url.searchParams.set("address", address);

const res = await fetch(url, {
  headers: { "x-api-key": apiKey },
});

if (!res.ok) {
  console.error(`エラー: ${res.status} ${await res.text()}`);
  process.exit(1);
}

const data = await res.json();
console.log(JSON.stringify(data.results, null, 2));
