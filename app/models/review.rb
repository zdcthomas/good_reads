class Review < ApplicationRecord
  validates :score, :text, presence: true
  belongs_to :user
  belongs_to :book
end
