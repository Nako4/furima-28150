class UserOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :consignor_id, :city, :addresses, :building, :phone_number, :token, :price

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :consignor_id, numericality: { other_than: 1 }
    validates :city
    validates :addresses
    validates :phone_number, format: {with: /\A\d{10,11}\z/ }
  end

  validates :token,
            :presence => {
            :is => true,
            :message => 'カード情報を正しく入力してください'
  }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, consignor_id: consignor_id, city: city, addresses: addresses, building: building,phone_number: phone_number, user_id: user_id)
  end

end