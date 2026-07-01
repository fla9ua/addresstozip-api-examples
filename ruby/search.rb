#!/usr/bin/env ruby
# 住所 → 郵便番号
# 使い方: ADDRESSTOZIP_API_KEY=xxx ruby search.rb "東京都千代田区丸の内"
require "net/http"
require "json"
require "uri"

api_key = ENV["ADDRESSTOZIP_API_KEY"]
address = ARGV[0]

unless api_key
  warn "ADDRESSTOZIP_API_KEY が未設定です。https://addresstozip.jp/signup で取得してください。"
  exit 1
end
unless address
  warn '使い方: ruby search.rb "東京都千代田区丸の内"'
  exit 1
end

uri = URI("https://addresstozip.jp/api/v1/search")
uri.query = URI.encode_www_form(address: address)
req = Net::HTTP::Get.new(uri)
req["x-api-key"] = api_key

res = Net::HTTP.start(uri.host, uri.port, use_ssl: true) { |http| http.request(req) }
unless res.is_a?(Net::HTTPSuccess)
  warn "エラー: #{res.code} #{res.body}"
  exit 1
end

puts JSON.parse(res.body)["results"]
