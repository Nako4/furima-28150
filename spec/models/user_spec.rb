require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    # #ユーザー情報
    # ##正常系
    context '新規登録がうまくいくとき' do
      it 'nickname,email,password,password_confirmation,first_kanji,last_kanji,first_katakana,last_katakana,birthdayがあれば登録できる' do
        expect(@user).to be_valid
      end
      it 'nicknameが40文字以下で登録できる' do
        @user.nickname = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
        expect(@user).to be_valid
      end
      it 'パスワードが6文字以上なら登録できる' do
        @user.password = '123456afg'
        @user.password_confirmation = '123456afg'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが一致すれば登録できる' do
        @user.password = '123456a'
        @user.password_confirmation = '123456a'
        expect(@user).to be_valid
      end
    end

    # ##異常系
    context '新規登録がうまく行かないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが既に登録済みだと登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスは@を含まないと登録できない' do
        @user.email = '12345ftr'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードが５文字以下だと登録できない' do
        @user.password = '123rt'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードは半角英数字混合でなければ登録できない' do
        @user.password = '111111'
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワードと確認用パスワードの値が一致しなければ登録できない' do
        @user.password = '123456a'
        @user.password_confirmation = 'a654321'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
    # #本人確認用
    # ##正常系
    context '新規登録がうまくいくとき' do
      # 空欄なく入力されているときは11~13行目で記述済み
      it 'first_kanji,last_kanjiが全角入力であれば登録できる' do
        @user.first_kanji = '田中'
        @user.last_kanji = '太郎'
        expect(@user).to be_valid
      end
      it 'first_katakana,last_katakanaが全角カタカナであれば登録できる' do
        @user.first_katakana = 'タナカ'
        @user.last_katakana = 'タロウ'
        expect(@user).to be_valid
      end
    end
    # ##異常系
    context '新規登録がうまく行かないとき' do
      it '名字（漢字）が空だと登録できない' do
        @user.first_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First kanji can't be blank")
      end
      it '名字が半角だと登録できない' do
        @user.first_kanji = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First kanji 全角文字を使用してください')
      end
      it '名前（漢字）が空だと登録できない' do
        @user.last_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kanji can't be blank")
      end
      it '名前が半角だと登録できない（漢字入力欄）' do
        @user.last_kanji = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last kanji 全角文字を使用してください')
      end
      it '名字（カタカナ）が空だと登録できない' do
        @user.first_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First katakana can't be blank")
      end
      it '名字がカタカナ以外だと登録できない' do
        @user.last_katakana = '123'
        @user.valid?
        @user.last_katakana = 'たなか'
        @user.valid?
        @user.last_kanji = '田中'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last katakana 全角文字を使用してください')
      end
      it '名字が半角だと登録できない（漢字入力欄）' do
        @user.last_kanji = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last kanji 全角文字を使用してください')
      end
      it '名前（カタカナ）が空だと登録できない' do
        @user.last_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last katakana can't be blank")
      end
      it '名前がカタカナ以外だと登録できない' do
        @user.last_katakana = '123'
        @user.valid?
        @user.last_katakana = 'たろう'
        @user.valid?
        @user.last_katakana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last katakana 全角文字を使用してください')
      end
      it '名前が半角だと登録できない（カタカナ入力欄）' do
        @user.last_katakana = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last katakana 全角文字を使用してください')
      end
      it '生年月日が空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
