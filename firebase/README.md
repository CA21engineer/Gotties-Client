# Firebase 関係ディレクトリ
## Firestore セキュリティルールテスト
1. エミュレータを実行する
```sh
firebase emulators:start --only firestore
```

2. テストする
```sh
npm test
```


## Firestore セキュリティルールデプロイ
`firebase login` 後に

```sh
firebase deploy --only firestore:rules
```
