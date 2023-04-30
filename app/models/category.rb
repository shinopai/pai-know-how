class Category < ApplicationRecord
  # validation
  validates :name, presence: true,
                   length: { maximum: 50 }
end
