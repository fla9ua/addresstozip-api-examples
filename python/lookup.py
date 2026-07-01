#!/usr/bin/env python3
"""郵便番号 → 住所(逆引き)
使い方: ADDRESSTOZIP_API_KEY=xxx python lookup.py 100-0005
"""
import os
import sys

import requests

api_key = os.environ.get("ADDRESSTOZIP_API_KEY")
zipcode = sys.argv[1] if len(sys.argv) > 1 else None

if not api_key:
    print("ADDRESSTOZIP_API_KEY が未設定です。https://addresstozip.jp/signup で取得してください。", file=sys.stderr)
    sys.exit(1)
if not zipcode:
    print("使い方: python lookup.py 100-0005", file=sys.stderr)
    sys.exit(1)

res = requests.get(
    "https://addresstozip.jp/api/v1/lookup",
    params={"zipcode": zipcode},
    headers={"x-api-key": api_key},
)
res.raise_for_status()
print(res.json()["results"])
