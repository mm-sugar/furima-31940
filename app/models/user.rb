class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/ }

  with options presence: true, format: { with: /\A[ぁ-んァ-ヶー-龥]/ } do
    validates :family_name
    validates :first_name
  end

  with options presence: true, format: { with: /\A[ア-ン゛゜ァ-ォャ-ョー。「」、]+\z/ } do
    validates :family_name_kana
    validates :first_name_kana
  end

  validates :birthday, presence: true

end
