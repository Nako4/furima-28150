class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :who_pays_fare
  belongs_to_active_hash :consignor
  belongs_to_active_hash :when_ship

  has_one_attached :image

  PRICE_REGEX = /\A[0-9]+\z/

  with_options presence: true do
    validates :name
    validates :text
    validates :category_id, numericality: { other_than: 1 }
    validates :condition_id
    validates :who_pays_fare_id
    validates :consignor_id
    validates :when_ship_id
    validates :price, numericality:[ { :greater_than_or_equal_to => 300 }, { :less_than_or_equal_to => 9999999}], format: {with: PRICE_REGEX}
    validates :user_id
  end

end
