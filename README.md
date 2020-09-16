# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## usersテーブル

|column        |Type   |Options    |
|--------------|-------|-----------|
|nickname      |string |null: false|
|email         |string |null: false|
|password      |string |null: false|
|first_kanji   |string |null: false|
|last_kanji    |string |null: false|
|first_katakana|string |null: false|
|last_katakana |string |null: false|
|birthday      |date   |null: false|

### Association
has_many :items
has_many  :purchase


## itemsテーブル

|column        |Type     |Options                       |
|--------------|---------|------------------------------|
|name          |string   |null: false                   |
|text          |text     |null: false                   |
|category      |list     |null: false                   |
|condition     |list     |null: false                   |
|who_pays_fare |list     |null: false                   |
|consignor     |list     |null: false                   |
|when_ship     |list     |null: false                   |
|price         |integer  |null: false                   |
|user_id       |reference|null: false, foreign_key: true|

### Association
belongs to :user
has_one :purchase


## purchaseテーブル

|column    |Type     |Options                       |
|----------|---------|------------------------------|
|user_id   |reference|null: false, foreign_key: true|
|item_id   |reference|null: false, foreign_key: true|

### Association
belongs_to :users
belongs_to :items
has_one :addresses

## addressesテーブル

|column|Type|Options|
|-------|---------|------------------------------|
|user_id|reference|null: false, foreign_key: true|
|address|text     |null: false                   |


### Association
belongs_to :purchase