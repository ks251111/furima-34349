# テーブル設計

## users テーブル

| Column          | Type    | Option                    |
|-----------------| ------- | ------------------------- |
| nickname        | string  | null: false, unique: true |
| email           | string  | null: false, unique: true |
| password        | string  | null: false               |
| full_last_name  | string  | null: false               |
| full_first_name | string  | null: false               |
| kana_last_name  | string  | null: false               |
| kana_first_name | string  | null: false               |
| birth_year      | integer | null: false               |
| birth_month     | integer | null: false               |
| birth_day       | integer | null: false               |

### Association

- has_many :items
- has_one  :shipping

## items テーブル

| Column   | Type       | Option                         |
| -------- | ---------- | ------------------------------ |
| image    |            |                                |
| title    | string     | null: false                    |
| text     | text       | null: false                    |
| category | string     | null: false                    |
| status   | string     | null: false                    |
| burden   | string     | null: false                    |
| area     | string     | null: false                    |
| days     | string     | null: false                    |
| price    | integer    | null: false                    |
| user_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :shipping

## shippings テーブル

| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| card             | integer    | null: false                    |
| expiration_month | integer    | null: false                    |
| expiration_year  | integer    | null: false                    |
| security         | integer    | null: false                    |
| postal           | string     | null: false                    |
| prefecture       | string     | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| build            | string     |                                |
| tel              | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |
| item_id          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item