class Book < ApplicationRecord
  validates :title, presence: true
  has_many :reviews

  def highest_review
    self.reviews.order("score Desc").first
  end

  def lowest_review
    self.reviews.order("score Asc").first
  end
end
