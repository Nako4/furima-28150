require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    ##ユーザー情報
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "11111aaa",first_kanji: "山田", last_kanji: "太郎", first_katakana: "ヤマダ", last_katakana: "タロウ", birthday: "" )
      user.valid?
      binding.pry
    end
    it "メールアドレスが空だと登録できない" do
    end
    it "メールアドレスが既に登録済みだと登録できない" do
    end 
    it "メールアドレスは@を含まないと登録できない" do
    end
    it "パスワードが空だと登録できない" do
    end
    it "パスワードが５文字以下だと登録できない" do
    end
    it "パスワードは半角英数字混合でなければ登録できない" do
    end
    it "パスワードと確認用パスワードの値が一致しなければ登録できない" do
    end
    ##本人確認用
    it "ユーザー名（漢字・カタカナ）がどれか１つでも空だと登録できない" do
    end
    it "ユーザー名は漢字・ひらがな・カタカナ以外で入力されると登録できない" do
    end
    it "ユーザー名（カタカナ）はカタカナ以外で入力されると登録できない" do
    end
    it "生年月日が空だと登録できない" do
    end

  end
end
