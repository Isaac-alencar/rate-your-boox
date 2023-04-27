# frozen_string_literal: true

# BooksController
class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
    @rating = Rating.where(book_id: @book.id)
    @book_reviews = Review.joins(:rating).where(rating: { book_id: @book.id })
  end

  def new
    @authors = Author.all
    @book = Book.new
  end

  def create
    @authors = Author.all
    @book = Book.new(create_book_params)

    if @book.save
      redirect_to user_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  private

  def create_book_params
    params.require(:book).permit(:title, :release_date, :author_id)
  end
end
