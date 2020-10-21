FactoryBot.define do
  factory :user_order do
    # number { '4242424242424242' }
    # exp_month { '3' }
    # exp_year { '23' } 
    # cvc { '123' }
    token {'123123'}
    user_id {'1'}
    item_id {'2'}
    postal_code {'123-4567' }
    consignor_id {'3'}
    city {'東京都'}
    addresses {'1-1'}
    building {'東京ハイツ'}
    phone_number { '09011111234' }
    
  end
end
