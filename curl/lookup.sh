#!/usr/bin/env bash
# 郵便番号 → 住所(逆引き)
# 使い方: ADDRESSTOZIP_API_KEY=xxx ./lookup.sh 100-0005
set -euo pipefail

: "${ADDRESSTOZIP_API_KEY:?ADDRESSTOZIP_API_KEY が未設定です。https://addresstozip.jp/signup で取得してください。}"
zipcode="${1:?使い方: ./lookup.sh 100-0005}"

curl --get "https://addresstozip.jp/api/v1/lookup" \
  --data-urlencode "zipcode=${zipcode}" \
  -H "x-api-key: ${ADDRESSTOZIP_API_KEY}"
