class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }

  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
    validates :last_name_kana, format: {with: /\A[ァ-ヶー－]+\z/}
    validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/}
    validates :birth
  end

  has_many :items
  
end