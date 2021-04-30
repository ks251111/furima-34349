# テーブル設計

## users テーブル

| Column             | Type     | Option                    |
|------------------- | -------- | ------------------------- |
| nickname           | string   | null: false, unique: true |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| full_last_name     | string   | null: false               |
| full_first_name    | string   | null: false               |
| kana_last_name     | string   | null: false               |
| kana_first_name    | string   | null: false               |
| birthday           | date     | null: false               |

### Association

- has_many :items
- has_many :buys
- has_many :comments
- has_many :likes

## items テーブル

| Column      | Type       | Option                         |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| text        | text       | null: false                    |
| category_id | integer    | null: false                    |
| status_id   | integer    | null: false                    |
| burden_id   | integer    | null: false                    |
| area_id     | integer    | null: false                    |
| day_id      | integer    | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :buy
- has_many   :comments
- has_many   :likes

## buysテーブル

| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- has_one :shipping
- belongs_to :user
- belongs_to :item

## shippings テーブル

| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| postal        | string     | null: false                    |
| area_id       | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| build         | string     |                                |
| tel           | string     | null: false                    |
| buy           | references | null: false, foreign_key: true |

### Association

- belongs_to :buy

## commentsテーブル

| Column | Type      | Option                         |
| ------ | --------- | ------------------------------ |
| text   | text      | null: false                    |
| user   | references| null: false, foreign_key: true |
| item   | references| null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## likesテーブル

| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item