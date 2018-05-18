require 'rails_helper'


describe 'a user' do
  descrbie ' visits the book show page' do 
    it 'should display the book title' do
      book = Book.create!(title:"American Gods")

      visit book_path book

      expect(page).to have_content(title)
    end
    it 'should show the average rating for that book' do
      book = Book.create!(title:"American Gods")
      user = User.create!(name:"Emma")
      user2 = User.create!(name:"Mike")
      text1 = "I hate good writing"
      text2 = "I liked it"
      user.reviews.create!(score:2, text: text1, book_id: book.id)
      user2.reviews.create!(score:4, text: text2, book_id: book.id)

      visit book_path book

      expect(page).to have_content("Average Rating: 3")
    end

    it 'should display a list of reviews for that book' do
      book = Book.create!(title:"American Gods")
      user = User.create!(name:"Emma")
      user2 = User.create!(name:"Mike")
      text1 = "I hate good writing"
      text2 = "I liked it"
      score1 = 2
      score2 = 4
      user.reviews.create!(score:score1, text: text1, book_id: book.id)
      user2.reviews.create!(score:score2, text: text2, book_id: book.id)

      visit book_path book

      expect(page).to have_content(text1)
      expect(page).to have_content(text2)
      expect(page).to have_content(user1.name)
      expect(page).to have_content(user2.name)
      expect(page).to have_content(score1)
      expect(page).to have_content(score2)

    end

    it 'should display the highest and lowest rating for that book' do
      book = Book.create!(title:"American Gods")
      user = User.create!(name:"Emma")
      user2 = User.create!(name:"Mike")

      text1 = 'I hate good writing'
      text2 = 'I liked it'
      score1 = 2
      score2 = 4

      user.reviews.create!(score:score1, text: text1, book_id: book.id)
      user2.reviews.create!(score:score2, text: text2, book_id: book.id)

      visit book_path book

      expect(page).to have_content("Highest Rating:#{score2}")
      expect(page).to have_content("Lowest Rating:#{score1}")
    end

    it 'should display the review text for the highest reviewer under the highest review header' do
      book = Book.create!(title:"American Gods")
      user = User.create!(name:"Emma")
      user2 = User.create!(name:"Mike")
      text1 = "I hate good writing"
      text2 = "I liked it"
      score1 = 2
      score2 = 4
      user.reviews.create!(score:score1, text: text1, book_id: book.id)
      user.reviews.create!(score:score2, text: text2, book_id: book.id)
      
      visit book_path book
      within(".highest_rating") do
        expect(page).to have_content(text2)
      end
      within(".lowest_rating") do
        expect(page).to have_content(text1)
      end
    end

  end
end

