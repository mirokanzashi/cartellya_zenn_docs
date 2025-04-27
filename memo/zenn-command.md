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

## 画像
```
# 正しい指定方法

![](/images/example-image1.png)
![](/images/example-article-1/image1.png)

# 誤った指定方法

![](../images/example-image1.png)
![](//images/example-image1.png)

```
画像ファイルはリポジトリ直下の /images ディレクトリに配置します。 /images ディレクトリの中の構造に制限はありませんが、拡張子だけはチェック対象となります。

画像の参照方法
画像は、記事の本文や、本のチャプターの本文から参照することができます。参照するには、画像埋め込み記法の URL 部分に /images/ から始まる絶対パスを指定します。相対パスで指定しないようご注意ください。

画像ファイルの制限は以下の通りです。違反する場合はデプロイ時にエラーとなります。

- ファイルサイズは 3MB 以内
- 対応する拡張子は .png .jpg .jpeg .gif .webp のみ


## 数式
https://zenn.dev/ykyki/articles/math-formulae-in-zenn
https://katex.org/docs/supported.html
https://zenn.dev/dmiyamo3/articles/34fb48a88aa813beffc0

## reference
- https://zenn.dev/zenn/articles/zenn-cli-guide