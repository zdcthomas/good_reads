class Book < ApplicationRecord
  validates :title, presence: true
  has_many :reviews
end
