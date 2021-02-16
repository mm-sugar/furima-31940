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

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| name               | string     | null: false       |
| description        | text       | null: false       |
| category_id        | integer    | null: false       |
| product_status_id  | integer    | null: false       |
| shipping_burden_id | integer    | null: false       |
| prefecture_id      | integer    | null: false       |
| shipping_days_id   | integer    | null: false       |
| price              | integer    | null: false       |
| user               | references | foreign_key: true |

### Association

- belongs_to :user
- has_many   :comments
- has_one    :purchase

## purchases テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| product | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one    :address

## addresses

 Column         | Type       | Options           |
| ------------- | ---------- | ----------------- |
| post_code     | string     | null: false       |
| prefecture_id | integer    | null: false       |
| city          | string     | null: false       |
| house_num     | string     | null: false       |
| building_name | string     | ----------------- |
| phone_num     | string     | null: false       |
| purchase_id   | references | foreign_key: true |

### Association

- belongs_to :purchase

## comments テーブル

| Column    | Type       | Options           |
| --------- | ---------- | ----------------- |
| text      | text       | null: false       |
| user      | references | foreign_key: true |
| product   | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product