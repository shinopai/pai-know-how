class Follow < ApplicationRecord
  # relation
  belongs_to :user

  # validation
  validates :partner_id, presence: true,
                         numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :partner_id, uniqueness: { scope: :user_id }
end
