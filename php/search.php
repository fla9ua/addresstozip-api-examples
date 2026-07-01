<?php
// 住所 → 郵便番号
// 使い方: ADDRESSTOZIP_API_KEY=xxx php search.php "東京都千代田区丸の内"

$apiKey = getenv("ADDRESSTOZIP_API_KEY");
$address = $argv[1] ?? null;

if (!$apiKey) {
    fwrite(STDERR, "ADDRESSTOZIP_API_KEY が未設定です。https://addresstozip.jp/signup で取得してください。\n");
    exit(1);
}
if (!$address) {
    fwrite(STDERR, "使い方: php search.php \"東京都千代田区丸の内\"\n");
    exit(1);
}

$query = http_build_query(["address" => $address]);
$ch = curl_init("https://addresstozip.jp/api/v1/search?$query");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, ["x-api-key: $apiKey"]);
$body = curl_exec($ch);
$status = curl_getinfo($ch, CURLINFO_HTTP_CODE);
curl_close($ch);

if ($status !== 200) {
    fwrite(STDERR, "エラー: {$status} {$body}\n");
    exit(1);
}

$data = json_decode($body, true);
print_r($data["results"]);
