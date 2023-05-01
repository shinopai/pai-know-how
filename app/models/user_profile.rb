class UserProfile < ApplicationRecord
  # relation
  belongs_to :user

  # validation
  VALID_TEL_REGEX = /\A\d{10}$|^\d{11}\z/

  validates :name,
            length: { maximum: 30 }
  with_options numericality: {only_integer: true, greater_than_or_equal_to: 0} do
    validates :birth_year
    validates :birth_month
    validates :birth_day
    validates :sex
  end
  validates :tel, format: { with: VALID_TEL_REGEX }
end
