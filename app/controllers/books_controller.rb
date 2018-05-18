class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
    @top_review = @book.highest_review
    @worst_review = @book.lowest_review
  end
end
