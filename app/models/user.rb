class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :buys

  with_options presence: true do
    validates :nickname
    validates :full_last_name
    validates :full_first_name
    validates :kana_last_name
    validates :kana_first_name
    validates :birthday
  end

  with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
    validates :full_last_name
    validates :full_first_name
  end

  with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :kana_last_name
    validates :kana_first_name
  end

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
end
