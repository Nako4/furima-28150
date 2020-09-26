class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: { maximum: 40 }
  validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/}
  validates :first_kanji, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' }
  validates :last_kanji, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' }
  validates :first_katakana, presence: true, format: { with: /\A[ァ-ン]+\z/, message: '全角文字を使用してください' } 
  validates :last_katakana, presence: true, format: { with: /\A[ァ-ン]+\z/, message: '全角文字を使用してください' } 
  validates :birthday, presence: true

  #メールアドレスに@必須の記述はconfig/initialize/devise.rbにデフォルトで記述がある
  #パスワードは6-128文字の制限がconfig/initialize/devise.rbにデフォルトで記述がある
  
end
