# README

## users テーブル

| Column                | Type   | Options                       |
| --------------------- | ------ | ----------------------------- |
| nickname              | string | null: false                   |
| email                 | string | null: false, uniqueness: true |
| encrypted_password    | string | null: false                   |
| last_name             | string | null: false                   |
| first_name            | string | null: false                   |
| last_name_kana        | string | null: false                   |
| first_name_kana       | string | null: false                   |
| birth                 | date   | null: false                   |

### Association

- has_many :items
- has_many :records


## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item_name           | string     | null: false                    |
| item_text           | text       | null: false                    |
| category_id         | integer    | null: false                    |
| condition_id        | integer    | null: false                    |
| shipping_charge_id  | integer    | null: false                    |
| shipping_area_id    | integer    | null: false                    |
| day_to_ship_id      | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :record


## records テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one :buyer


## buyers テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| shipping_area_id | integer    | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     |                                |
| tel              | string     | null: false                    |
| record           | references | null: false, foreign_key: true |

### Association

- belongs_to :record
