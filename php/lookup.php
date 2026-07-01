<?php
// 郵便番号 → 住所(逆引き)
// 使い方: ADDRESSTOZIP_API_KEY=xxx php lookup.php 100-0005

$apiKey = getenv("ADDRESSTOZIP_API_KEY");
$zipcode = $argv[1] ?? null;

if (!$apiKey) {
    fwrite(STDERR, "ADDRESSTOZIP_API_KEY が未設定です。https://addresstozip.jp/signup で取得してください。\n");
    exit(1);
}
if (!$zipcode) {
    fwrite(STDERR, "使い方: php lookup.php 100-0005\n");
    exit(1);
}

$query = http_build_query(["zipcode" => $zipcode]);
$ch = curl_init("https://addresstozip.jp/api/v1/lookup?$query");
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
