class Draft < ApplicationRecord
  # relation
  belongs_to :user
  belongs_to :category

  # validation
  with_options presence: true do
    validates :title,
              length: { maximum: 30 }
    validates :content,
              length: { maximum: 300 }
  end
end
