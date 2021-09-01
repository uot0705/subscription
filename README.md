![画像名](app/assets/images/Sabusukulogo.png)
# アプリ名
サブスクの管理

# 概要(このアプリでできることを書いて下さい)						
ユーザー登録ができます。<br>
契約しているサブスクをアプリ上に登録できます。<br>
登録したサブスクを一覧で管理ができます。<br>
毎月1回(1日)or2回(1日・15日)メールにてお知らせが来る<br>

# 本番環境(デプロイ先　テストアカウント＆ID)						
http://52.68.230.104/<br>
ID/Pass<br>
ID: uot0705<br>
Pass: 7777<br>
テスト用アカウント<br>
メールアドレス: sabusukunokanri.demoaka@gmail.com<br>
パスワード: demo1234<br>

# 制作背景(意図)
『サブスクを使いこなすには、契約の把握から始めましょう!』がコンセプトです。<br>
現在様々なサービスが「サブスクリプション制」になっており、少ない費用で価値あるサービスが使えて生活が豊かになります。<br>
しかしそんなサブスクでも、小さな問題点があります。(個人的な)<br>
①契約の把握をしていない<br>
※費用が安いため契約を数多くしてしまう。<br>
②メモ帳に管理しても見返さない<br>
※契約してるけど使えていない、気づかぬうちに毎月引き落とされている<br>
上記の問題点を、解決できるアプリケーションです。<br>
サブスクをアプリ上に登録すると、毎月1回(1日)or2回(1日・15日)メールにてお知らせが来るため、ユーザーが忘れていても自然に契約内容の確認ができる。<br>

						
# DEMO(gifで動画や写真を貼って、ビューのイメージを掴んでもらいます)
## トップページ
[![Image from Gyazo](https://i.gyazo.com/ba5d1caf6dc9743f2bb00fc589b154d7.gif)](https://gyazo.com/ba5d1caf6dc9743f2bb00fc589b154d7)
## ユーザー新規登録
[![Image from Gyazo](https://i.gyazo.com/21b4ba20ae1ecbe4b84fc6636aa6744b.png)](https://gyazo.com/21b4ba20ae1ecbe4b84fc6636aa6744b)
## ユーザーページ
[![Image from Gyazo](https://i.gyazo.com/16add867b4b1f3c8469d8233feb9d335.gif)](https://gyazo.com/16add867b4b1f3c8469d8233feb9d335)
## サブスク登録
[![Image from Gyazo](https://i.gyazo.com/a14fd38ae4b4a2f2ab2cde48eaa4fec5.gif)](https://gyazo.com/a14fd38ae4b4a2f2ab2cde48eaa4fec5)
## 【メール】新規登録・お知らせ

# 工夫したポイント
①ユーザーが、契約内容を忘れないようにする仕組みを考えた<br>
メールにて定期的に、お知らせをすることにしました。<br>
②シンプルなデザイン<br>
シンプルにすることで、機能的にユーザーが迷うことなく使用できるようにしました。<br> 

# 使用技術(開発環境)
開発環境<br>
Ruby/Ruby on Rails/JavaScript/MySQL/Github/AWS/Visual Studio Code<br>
開発期間と平均作業時間<br>
開発期間：8/12〜9/1(21日間)<br>
1日あたりの平均作業時間：9<br>
合計：190時間程度<br>

# 課題や今後実装したい機能						
.無料期間を追加できる項目<br>
・金額登録時に契約期間を指定できるように<br>

# DB設計												
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
| price                | integer    | null: false                    |
| user                 | references | null: false, foreign_key:true  |

### Association
- belongs_to :user
