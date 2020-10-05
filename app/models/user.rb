class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  NAME_REGEX_KANNJI = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  NAME_REGEX_KATAKANA = /\A[ァ-ヶー－]+\z/.freeze

  with_options presence: true do
    validates :nickname, length: { maximum: 40 }
    validates :password, format: { with: PASSWORD_REGEX }
    validates :first_kanji, format: { with: NAME_REGEX_KANNJI, message: '全角文字を使用してください' }
    validates :last_kanji, format: { with: NAME_REGEX_KANNJI, message: '全角文字を使用してください' }
    validates :first_katakana, format: { with: NAME_REGEX_KATAKANA, message: '全角文字を使用してください' }
    validates :last_katakana, format: { with: NAME_REGEX_KATAKANA, message: '全角文字を使用してください' }
    validates :birthday
  end
  validates :email, uniqueness: true

  # メールアドレスに@必須の記述はconfig/initialize/devise.rbにデフォルトで記述がある
  # パスワードは6-128文字の制限がconfig/initialize/devise.rbにデフォルトで記述がある
end
