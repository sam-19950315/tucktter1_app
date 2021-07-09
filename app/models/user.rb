class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets,dependent: :destroy
  has_one_attached :user_icon
  has_one_attached :user_identification
  has_many :comments
end
