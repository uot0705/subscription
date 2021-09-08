![画像名](app/assets/images/Sabusukulogo.png)
# ◇アプリ名
サブスクの管理

# ◇概要
`サブスクをアプリ上に登録すると、毎月1回(1日)or2回(1日・15日)メールにてお知らせ。`<br>
`ユーザーが忘れていてもアプリからのお知らせで気付ける。`<br>
・ユーザー登録ができます。<br>
・契約しているサブスクをアプリ上に登録できます。<br>
・登録したサブスクを一覧で管理ができます。<br>
・毎月1回(1日)or2回(1日・15日)メールにてお知らせが来ます。<br>

# ◇本番環境						
□URL<br>
http://52.68.230.104/<br>
□ID/Pass<br>
ID: uot0705<br>
Pass: 7777<br>
□テスト用アカウント<br>
メールアドレス: sabusukunokanri.demoaka@gmail.com<br>
パスワード: demo1234<br>

# ◇制作背景
`『サブスクを使いこなすには、契約の把握から始めましょう!』`がコンセプトです。<br>
現在様々なサービスが「サブスクリプション制」になっており、少ない費用で価値あるサービスが使えて生活が豊かになります。<br>
しかしそんなサブスクでも、小さな問題が2点があります。<br>
①契約の把握をしていない<br>
どのサブスクサービスも費用が安価な為、契約を数多くしてしまう。<br>
②メモ帳に管理しても見返さない<br>
契約したが使えていない、無料期間試しに使用したが、忘れていて毎月引き落とされている<br>
上記の問題点を、解決できるアプリケーションです。<br>
サブスクをアプリ上に登録すると、毎月1回(1日)or2回(1日・15日)メールにてお知らせが来るため、ユーザーが忘れていても自然に契約内容の確認ができます。</br>

						
# ◇DEMO
## トップページ
[![Image from Gyazo](https://i.gyazo.com/6190b8695139c4a6305881b1bb7462e1.gif)](https://gyazo.com/6190b8695139c4a6305881b1bb7462e1)
## ユーザー新規登録
[![Image from Gyazo](https://i.gyazo.com/69a15091d097a937cadcf74ded2b3e1e.png)](https://gyazo.com/69a15091d097a937cadcf74ded2b3e1e)
## ユーザーページ
[![Image from Gyazo](https://i.gyazo.com/0fac265dd149084f75805663500ac564.gif)](https://gyazo.com/0fac265dd149084f75805663500ac564)
## ユーザーページ（メモ機能）
[![Image from Gyazo](https://i.gyazo.com/fb28cbf6e8c52a36957b6873ca305696.gif)](https://gyazo.com/fb28cbf6e8c52a36957b6873ca305696)
## サブスク登録
[![Image from Gyazo](https://i.gyazo.com/de2cdd7246cefe25befe02e7447cb6f9.gif)](https://gyazo.com/de2cdd7246cefe25befe02e7447cb6f9)
## 【メール】新規登録・お知らせ
□新規登録
[![Image from Gyazo](https://i.gyazo.com/c71a29fb4d407bf2c2c47a9fb7aa2ef0.png)](https://gyazo.com/c71a29fb4d407bf2c2c47a9fb7aa2ef0)
□お知らせ
[![Image from Gyazo](https://i.gyazo.com/5a0f5726629eff0d524ccfcca095d38e.png)](https://gyazo.com/5a0f5726629eff0d524ccfcca095d38e)

# ◇工夫したポイント
`①ユーザーが、契約内容を忘れないようにする仕組みを考えた`<br>
メールにて定期的に、お知らせをすることにしました。<br>
`②シンプルなデザイン`<br>
シンプルにすることで、機能的にユーザーが迷うことなく使用できるようにしました。<br> 

（その他）<br>
・メモ機能<br>
・サブスク費用を、年・月・週・日の期間で表示<br>
・コンテンツの並び替え<br>

# ◇使用技術
□開発環境<br>
Ruby/Ruby on Rails/JavaScript/MySQL/Github/AWS/Visual Studio Code<br>
□開発期間と平均作業時間<br>
・開発期間：8/12〜9/1(21日間)<br>
・1日あたりの平均作業時間：9<br>
合計：190時間程度<br>

# ◇課題や今後実装したい機能						
・無料期間を追加できる項目<br>
無料期間終了の前に、お知らせがくるようにしたいです<br>
・金額登録時に契約期間を指定できるように<br>
サービスによっては年単位などの契約もあるためです<br>

# ◇DB設計												
## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| nickname           | string | null: false, unique: true |
| check              | integer| null: false |

### Association
- has_many :contents

## contentsテーブル

| Column               | Type       | Options                        |
| -----------------    | ---------- | ------------------------------ |
| name                 | string     | null: false                    |
| memo                 | string     |                                |
| price                | integer    | null: false                    |
| user                 | references | null: false, foreign_key:true  |

### Association
- belongs_to :user
