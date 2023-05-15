class UserProfile < ApplicationRecord
  # relation
  belongs_to :user

  # validation
  VALID_TEL_REGEX = /\A\d{10}$|^\d{11}\z/ # 電話番号のフォーマット

  validates :name,
            length: { maximum: 30 }
  with_options numericality: {only_integer: true, greater_than_or_equal_to: 0} do
    validates :birth_year, allow_blank: true
    validates :birth_month, allow_blank: true
    validates :birth_day, allow_blank: true
  end
  validates :tel, format: { with: VALID_TEL_REGEX }

  # carrierwave
  mount_uploader :profile_image, ProfileImageUploader

   # enum
   enum sex: { 男性: 0, 女性: 1 }
end
