require 'rails_helper'

RSpec.describe Book, type: :model do
  it{should have_many(:reviews)}

  describe 'highest_review' do
    book = Book.create!(title:"American Gods")
    user = User.create!(name:"Emma")
    user2 = User.create!(name:"Mike")
    text1 = "I hate good writing"
    text2 = "I liked it"
    user.reviews.create!(score:2, text: text1, book_id: book.id)
    review2 = user2.reviews.create!(score:4, text: text2, book_id: book.id)
    
    expect(book.highest_review).to eq(review2)
  end
  describe 'highest_review' do
    book = Book.create!(title:"American Gods")
    user = User.create!(name:"Emma")
    user2 = User.create!(name:"Mike")
    text1 = "I hate good writing"
    text2 = "I liked it"
    review1 = user.reviews.create!(score:2, text: text1, book_id: book.id)
    review2 = user2.reviews.create!(score:4, text: text2, book_id: book.id)
    
    expect(book.lowest_review).to eq(review1)
  end
end
