# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| family_name        | string  | null: false               |
| first_name         | string  | null: false               |
| family_name_kana   | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birthday           | date    | null: false               |

### Association

- has_many :products
- has_many :purchases
- has_many :comments

## products テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| product_name    | string       | null: false |
| description     | text       | null: false |
| category        | string     | null: false |
| product_status  | string     | null: false |
| shipping_burden | string     | null: false |
| shipment_source | string     | null: false |
| shipping_days   | string     | null: false |
| price           | integer    | null: false |
| user            | references | ----------- |

### Association

- belongs_to :users
- has_many   :comments
- has_one    :purchases

## purchases テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| card_num         | integer    | null: false |
| expiration_month | integer    | null: false |
| expiration_year  | integer    | null: false |
| security_code    | integer    | null: false |
| user             | references | ----------- |
| product          | references | ----------- |

### Association

- belongs_to :users
- belongs_to :products
- has_one    :address

## addresses テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| post_code        | integer    | null: false |
| prefecture       | string     | null: false |
| city             | string     | null: false |
| house_num        | string     | null: false |
| building_name    | string     | ----------- |
| phone_num        | integer    | null: false |
| purchase         | references | ----------- |

### Association

- belongs_to :purchases

## comments テーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| text      | text       | null: false |
| user      | references | ----------- |
| product   | references | ----------- |

### Association

- belongs_to :users
- belongs_to :products