require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品登録' do
    # 正常系
    context '商品出品がうまくいくとき' do
      it 'name,text,category_id,condition_id,who_pays_fare_id,consignor_id,when_ship_id,priceがあれば出品できる' do
        expect(@item).to be_valid
      end
      it 'nameが40文字以下なら出品できる' do
        @item.name = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
        expect(@item).to be_valid
      end
      it 'textが1000文字以下なら出品できる' do
        @item.text = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
        expect(@item).to be_valid
      end
      it 'カテゴリーが入力されていれば登録できる' do
        @item.category_id = '11'
        expect(@item).to be_valid
      end
      it '商品の状態が入力されていれば登録できる' do
        @item.condition_id = '7'
        expect(@item).to be_valid
      end
      it '配送料の負担が入力されていれば登録できる' do
        @item.who_pays_fare_id = '3'
        expect(@item).to be_valid
      end
      it '発送元の地域が入力されていれば登録できる' do
        @item.consignor_id = '48'
        expect(@item).to be_valid
      end
      it '発送までの日数が入力されていれば登録できる' do
        @item.when_ship_id = '4'
        expect(@item).to be_valid
      end
      it '価格が入力されていれば登録できる' do
        @item.price = 4000
        expect(@item).to be_valid
      end
    end
    # 異常系
    describe '新規登録がうまくいかない時' do
      # 出品画像がない時
      it '商品名が空欄の時' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品名が41文字以上の時' do
        @item.name = 'aaaaaaaaaassssssssssddddddddddffffffffffg'
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end
      it '商品の説明が空欄の時' do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it '商品の説明が1001文字以上の時' do
        @item.text = ("a" * 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include("Text is too long (maximum is 1000 characters)")
      end

      it 'カテゴリーに入力が---の時' do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1") 
      end
      it '商品の状態に入力が---の時' do
        @item.condition_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1") 
      end
      it '配送料の負担が---の時' do
        @item.who_pays_fare_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Who pays fare must be other than 1") 
      end
      it '発送元の地域が---の時' do
        @item.consignor_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Consignor must be other than 1") 
      end
      it '発送までの日数が---の時' do
        @item.when_ship_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("When ship must be other than 1") 
      end

      it '価格が299円以下の時' do
        @item.price = 50
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300") 
      end
      it '価格が100000000円以上の時' do
        @item.price = 10000000000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999") 
      end
      it '価格が空欄の時' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number") 
      end
    end
  end  
end
