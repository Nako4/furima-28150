require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '購入処理の実装' do
    before do
      @user_order = FactoryBot.build(:user_order)
    end

    # 正常系
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user_order).to be_valid
    end

    it 'buildingは空でも保存できること' do
      @user_order.building = nil
      expect(@user_order).to be_valid
    end

    # 異常系
    it 'tokenが空だと保存できないこと' do
      @user_order.token = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeが空だと保存できないこと' do
      @user_order.postal_code = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include(
        "Postal code can't be blank", 'Postal code is invalid. Include hyphen(-)'
      )
    end

    it 'postal_codeはハイフンを含んでいないと保存できないこと' do
      @user_order.postal_code = '1234567'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end

    it 'consignor_idが1だと保存できないこと' do
      @user_order.consignor_id = 1
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include('Consignor must be other than 1')
    end

    it 'cityが空だと保存できないこと' do
      @user_order.city = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("City can't be blank")
    end

    it 'addressesが空だと保存できないこと' do
      @user_order.addresses = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Addresses can't be blank")
    end

    it 'phone_numberが空だと保存できないこと' do
      @user_order.phone_number = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberが10、11文字以外だと保存できないこと' do
      @user_order.phone_number = '1234'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include('Phone number is invalid')
    end

    it 'phone_numberは数字以外は保存できないこと' do
      @user_order.phone_number = '123ab123451'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include('Phone number is invalid')
    end
  end
end
