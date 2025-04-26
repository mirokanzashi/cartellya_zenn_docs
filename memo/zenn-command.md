## git config on vscode

```
# ユーザ名の設定
git config user.name [ユーザ名]

# メールアドレスの設定
git config user.email [メールアドレス]
```

## build
### install
```
npm init --yes
npm install zenn-cli
npx zenn init
```


## article
### create article
```
npx zenn new:article
```
### slugを使用する

```
npx zenn new:article --slug what-is-slug

```

- slugはサイト全体で（記事や本などのコンテンツの種類ごとに）ユニークにする必要があります。他ユーザーの記事で使用済みのslugも使用できないのでご注意ください。
- slugは半角英小文字（a-z）、半角数字（0-9）、ハイフン（-）、アンダースコア（_）の12〜50字の組み合わせにする必要があります。



## reference
- https://zenn.dev/zenn/articles/zenn-cli-guide