class Review < ApplicationRecord
  validates :score, :text, presence: true
  belongs_to :user_id
  belongs_to :book_id
end
