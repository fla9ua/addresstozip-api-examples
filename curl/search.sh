#!/usr/bin/env bash
# 住所 → 郵便番号
# 使い方: ADDRESSTOZIP_API_KEY=xxx ./search.sh "東京都千代田区丸の内"
set -euo pipefail

: "${ADDRESSTOZIP_API_KEY:?ADDRESSTOZIP_API_KEY が未設定です。https://addresstozip.jp/signup で取得してください。}"
address="${1:?使い方: ./search.sh \"東京都千代田区丸の内\"}"

curl --get "https://addresstozip.jp/api/v1/search" \
  --data-urlencode "address=${address}" \
  -H "x-api-key: ${ADDRESSTOZIP_API_KEY}"
