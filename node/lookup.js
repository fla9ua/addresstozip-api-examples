// 郵便番号 → 住所(逆引き)
// 使い方: ADDRESSTOZIP_API_KEY=xxx node lookup.js 100-0005
const apiKey = process.env.ADDRESSTOZIP_API_KEY;
const zipcode = process.argv[2];

if (!apiKey) {
  console.error("ADDRESSTOZIP_API_KEY が未設定です。https://addresstozip.jp/signup で取得してください。");
  process.exit(1);
}
if (!zipcode) {
  console.error("使い方: node lookup.js 100-0005");
  process.exit(1);
}

const url = new URL("https://addresstozip.jp/api/v1/lookup");
url.searchParams.set("zipcode", zipcode);

const res = await fetch(url, {
  headers: { "x-api-key": apiKey },
});

if (!res.ok) {
  console.error(`エラー: ${res.status} ${await res.text()}`);
  process.exit(1);
}

const data = await res.json();
console.log(JSON.stringify(data.results, null, 2));
