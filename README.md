# README

## DB設計

### users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| profile            | text   |                           |

### Association

- has_many :posts
- has_many :favorites

### posts テーブル

| Column             | Type       | Options       |
| ------------------ | ---------- | ------------- |
| title              | string     | null: false   |
| describe           | text       | null: false   |
| favorite_scene     | text       |               |
| favorite_character | text       |               |
| spoiler            | integer    |               |
| user               | references | foreign: true |

### Association

- belongs_to :user
- has_many :favorites

### favorites テーブル

| Column    | Type       | Options           |
| --------- | ---------- | ----------------- |
| user      | references | foreign_key: true |
| post      | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post