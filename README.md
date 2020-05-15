# gottiesclient
![CI](https://github.com/CA21engineer/Gotties-Client/workflows/CI/badge.svg)

おうちハッカソン。

## アプリ配布
アプリの配布に Firebase AppDistribution を使用しています。
手元の環境でのビルド成果物を配布したい場合は、 `.env.example` を `.env` にコピーし、必要な情報を入力した上で `bundle exec fastlane android distribute_app` を実行してください。

### 各設定値について
#### `FIREBASE_APP_ID_IOS`
Firebase で iOS アプリを登録した際の App ID

#### `FIREBASE_APP_ID_ANDROID`
Firebase で Android アプリを登録した際の App ID

#### `FIREBASE_CLI_TOKEN`
`firebase login:ci` で取得した Firebase のトークン

#### `IPA_PATH`
iOS のビルド成果物へのパス

※ 現在はアップロードできません。

#### `APK_PATH`
Android のビルド成果物へのパス
