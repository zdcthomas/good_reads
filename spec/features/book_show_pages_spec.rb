require 'rails_helper'


describe 'a user' do
  descrbie ' visits the book show page' do 
    it 'should display the book title' do
      expect(page).to have_content(title)
    end
    it 'should display a list of reviews for that book' do
      expect(page).to have_content(text)
      expect(page).to have_content(user_name)
    end
    it 'should display the rating the user gave the book' do
    end
    it 'should display the average rating for that book' do
    end
    it 'should display the highest rating for that book' do
      expect(page).to have_content("Highest Rating:#{rating}")
    end
    it 'should display the lowest rating for that book' do
      expect(page).to have_content("Lowest Rating:#{rating}")
    end
    it 'should display the review text for the highest reviewer under the highest review header' do
      expect(page).to have_content(text)
      expect(page).to have_content(name)
    end
    it 'should display the review text for the lowest reviewer under the lowest review header' do
      expect(page).to have_content(text)
      expect(page).to have_content(name)
    end
  end
end

