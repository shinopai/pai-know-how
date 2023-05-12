class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # relation
  has_many :knowhows, dependent: :destroy
  has_many :drafts, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_one :user_profile, dependent: :destroy, class_name: 'UserProfile'
end
