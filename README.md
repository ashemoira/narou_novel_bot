# narou_novel_bot

narou_novel_bot は discord 上でなろう小説の検索が出来る bot です。  
使用できる検索オプションは個人的によく使うものが主な機能のため全ての検索条件が使用できるわけではないのでご了承ください。

## 使い方

小説の検索(おまかせ検索)

```
/narou タイトル
```

条件指定検索

```
# 新着順検索
/narou -n タイトル
```

他の検索オプションは`-help`で確認できます

```
/narou -help
```

## 導入方法

1.  git clone する

```
git clone https://github.com/ashemoira/narou_novel_bot.git
```

2.  `discord_token.rb`に自分の discord bot のトークンを入れる

```
TOKEN = "自分のbotのトークン".freeze
```

3.  `narou_novel.rb`を起動する

```
ruby narou_novel.rb
```

## 要望など

この機能もほしいなどありましたら issue を上げてください。  
対応できそうなものは対応します。
