# README

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| last_name             | string | null: false |
| first_name            | string | null: false |
| last_name_kana        | string | null: false |
| first_name_kana       | string | null: false |
| birth                 | date   | null: false |

### Association

- has_many :items
- has_many :records


## items テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| item_name        | string     | null: false |
| item_text        | text       | null: false |
| category         | string     | null: false |
| condition        | string     | null: false |
| shipping_charges | string     | null: false |
| shipping_area    | string     | null: false |
| day_to_ship      | string     | null: false |
| price            | integer    | null: false |
| user             | references |             |

### Association

- belongs_to :user
- has_one :record


## records テーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| user      | references |             |
| item      | references |             |

- belongs_to :user
- belongs_to :item
- has_one :buyer


## buyers テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| post_code    | integer    | null: false |
| prefectures  | string     | null: false |
| city         | string     | null: false |
| address      | string     | null: false |
| tel          | string     | null: false |
| record       | references |             |

### Association

- belongs_to :record
