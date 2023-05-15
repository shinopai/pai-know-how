class Bookmark < ApplicationRecord
  # relation
  belongs_to :user
  belongs_to :knowhow
end
