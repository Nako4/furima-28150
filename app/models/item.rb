class Item < ApplicationRecord

  has_many_atacched :image

  with_options presence: true do
    validates :name
    validates :text
    validates :category_id
    validates :condition_id
    validates :who_pays_fare_id
    validates :consignor_id
    validates :whem_ship_id
    validates :price
    validates :user_id
  end

end
