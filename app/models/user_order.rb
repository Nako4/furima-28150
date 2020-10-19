class UserOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :consignor_id, :city, :addresses, :building, :phone_number, :token, :price

  with_options presence: true do
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :consignor_id
    validates :city
    validates :addresses
    validates :phone_number  #ハイフン不要、11桁以内
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, consignor_id: consignor_id, city: city, addresses: addresses, building: building,phone_number: phone_number, user_id: user_id)
  end

end