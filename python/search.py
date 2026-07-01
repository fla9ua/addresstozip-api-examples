#!/usr/bin/env python3
"""住所 → 郵便番号
使い方: ADDRESSTOZIP_API_KEY=xxx python search.py "東京都千代田区丸の内"
"""
import os
import sys

import requests

api_key = os.environ.get("ADDRESSTOZIP_API_KEY")
address = sys.argv[1] if len(sys.argv) > 1 else None

if not api_key:
    print("ADDRESSTOZIP_API_KEY が未設定です。https://addresstozip.jp/signup で取得してください。", file=sys.stderr)
    sys.exit(1)
if not address:
    print('使い方: python search.py "東京都千代田区丸の内"', file=sys.stderr)
    sys.exit(1)

res = requests.get(
    "https://addresstozip.jp/api/v1/search",
    params={"address": address},
    headers={"x-api-key": api_key},
)
res.raise_for_status()
print(res.json()["results"])
