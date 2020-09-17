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
has_many :purchases


## itemsテーブル

|column           |Type     |Options                       |
|-----------------|---------|------------------------------|
|name             |string   |null: false                   |
|text             |text     |null: false                   |
|category_id      |integer  |null: false                   |
|condition_id     |integer  |null: false                   |
|who_pays_fare_id |integer  |null: false                   |
|consignor_id     |integer  |null: false                   |
|when_ship_id     |integer  |null: false                   |
|price            |integer  |null: false                   |
|user             |reference|null: false, foreign_key: true|

### Association
belongs to :user
has_one :purchase


## purchaseテーブル

|column |Type     |Options                       |
|-------|---------|------------------------------|
|user   |reference|null: false, foreign_key: true|
|item   |reference|null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :item
has_one :address

## addressesテーブル

|column       |Type     |Options                       |
|-------------|---------|------------------------------|
|user         |reference|null: false, foreign_key: true|
|postal_code  |string   |null: false                   |
|prefecture_id|integer  |null: false                   |
|city         |string   |null: false                   |
|address      |string   |null: false                   |
|building     |string   |                              |
|phone_num    |string   |null: false                   |


### Association
belongs_to :purchase