// 住所 → 郵便番号
// 使い方: ADDRESSTOZIP_API_KEY=xxx go run search.go "東京都千代田区丸の内"
package main

import (
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"net/url"
	"os"
)

func main() {
	apiKey := os.Getenv("ADDRESSTOZIP_API_KEY")
	if apiKey == "" {
		fmt.Fprintln(os.Stderr, "ADDRESSTOZIP_API_KEY が未設定です。https://addresstozip.jp/signup で取得してください。")
		os.Exit(1)
	}
	if len(os.Args) < 2 {
		fmt.Fprintln(os.Stderr, `使い方: go run search.go "東京都千代田区丸の内"`)
		os.Exit(1)
	}
	address := os.Args[1]

	u, _ := url.Parse("https://addresstozip.jp/api/v1/search")
	q := u.Query()
	q.Set("address", address)
	u.RawQuery = q.Encode()

	req, _ := http.NewRequest("GET", u.String(), nil)
	req.Header.Set("x-api-key", apiKey)

	res, err := http.DefaultClient.Do(req)
	if err != nil {
		panic(err)
	}
	defer res.Body.Close()

	body, _ := io.ReadAll(res.Body)
	if res.StatusCode != http.StatusOK {
		fmt.Fprintf(os.Stderr, "エラー: %d %s\n", res.StatusCode, body)
		os.Exit(1)
	}

	var data map[string]any
	json.Unmarshal(body, &data)
	fmt.Println(data["results"])
}
