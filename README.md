#アプリ名						

#概要(このアプリでできることを書いて下さい)						

#本番環境(デプロイ先　テストアカウント＆ID)						

#制作背景(意図)						
⇒どんな課題や不便なことを解決するためにこのアプリを作ったのか。						

#DEMO(gifで動画や写真を貼って、ビューのイメージを掴んでもらいます)						
⇒特に、デプロイがまだできていない場合はDEMOをつけることで見た目を企業側に伝えることができます。						
#工夫したポイント						

#使用技術(開発環境)						

#課題や今後実装したい機能						

#DB設計												

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
