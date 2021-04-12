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
| birthday           | datetime | null: false               |

### Association

- has_many :items

## items テーブル

| Column      | Type       | Option                         |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| text        | text       | null: false                    |
| category_id | integer    | null: false                    |
| status_id   | integer    | null: false                    |
| burden_id   | integer    | null: false                    |
| area_id     | integer    | null: false                    |
| days_id     | integer    | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## buysテーブル

| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- has_one :shipping

## shippings テーブル

| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| postal        | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| build         | string     |                                |
| tel           | integer    | null: false                    |

### Association

- belongs_to :buy