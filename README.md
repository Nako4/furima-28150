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
|last_kanji    |string |null: false|
|born_year     |list   |null: false|
|born_month    |list   |null: false|
|born_day      |list   |null: false|

### Association
has_many :items
has_one  :purchase


## itemsテーブル

|column        |Type   |Options    |
|--------------|-------|-----------|
|image         |image  |null: false|
|name          |string |null: false|
|text          |string |null: false|
|category      |list   |null: false|
|condition     |list   |null: false|
|who_pays_fare |list   |null: false|
|consignor     |list   |null: false|
|when_ship     |list   |null: false|
|price         |integer|null: false|

### Association
belongs to :users
has_one    :purchase


## purchaseテーブル

|column        |Type   |Options    |
|--------------|-------|-----------|
|purchaser     |image  |null: false|
|address       |string |null: false|
|card_number   |integer|null: false|
|card_date     |list   |null: false|
|security_code |integer|null: false|

### Association
belongs_to :user
belongs_to :items