#!/usr/bin/env ruby
# 郵便番号 → 住所(逆引き)
# 使い方: ADDRESSTOZIP_API_KEY=xxx ruby lookup.rb 100-0005
require "net/http"
require "json"
require "uri"

api_key = ENV["ADDRESSTOZIP_API_KEY"]
zipcode = ARGV[0]

unless api_key
  warn "ADDRESSTOZIP_API_KEY が未設定です。https://addresstozip.jp/signup で取得してください。"
  exit 1
end
unless zipcode
  warn "使い方: ruby lookup.rb 100-0005"
  exit 1
end

uri = URI("https://addresstozip.jp/api/v1/lookup")
uri.query = URI.encode_www_form(zipcode: zipcode)
req = Net::HTTP::Get.new(uri)
req["x-api-key"] = api_key

res = Net::HTTP.start(uri.host, uri.port, use_ssl: true) { |http| http.request(req) }
unless res.is_a?(Net::HTTPSuccess)
  warn "エラー: #{res.code} #{res.body}"
  exit 1
end

puts JSON.parse(res.body)["results"]
