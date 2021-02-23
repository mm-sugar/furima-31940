class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, format: { with: /\A[a-zA-Z0-9]+\z/ }

  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ヶー-龥]/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶー-龥]/ }
  validates :family_name_kana, presence: true, format: { with: /\A[ア-ン゛゜ァ-ォャ-ョー。「」、]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ア-ン゛゜ァ-ォャ-ョー。「」、]+\z/ }
  validates :birthday, presence: true

end
