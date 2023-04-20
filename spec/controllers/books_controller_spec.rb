# frozen_string_literal: true

require 'rails_helper'

# BooksControllerSpec
RSpec.describe BooksController, type: 'request' do
  let(:user) { create :user }
  let(:author) { create :author }

  describe 'GET /books/new' do
    context 'when the user is succesfully logged in' do
      it 'returns a successful response' do
        sign_in user
        get new_book_path
        expect(response).to be_successful
        expect(response).to have_http_status(200)
      end
    end

    context 'when the user isn\'t logged in' do
      it 'redirects user with 302 status code' do
        get new_book_path
        expect(response).to_not be_successful
        expect(response).to have_http_status(302)
      end
    end
  end

  describe 'POST /books' do
    context 'when params are valid' do
      let(:book) { build(:book, author_id: author.id).attributes }

      it 'successfully peform the request' do
        sign_in user
        create_book_params = { book: }
        post books_path, params: create_book_params

        expect(response).to redirect_to user_url(user)
        expect(response).to have_http_status(302)
      end

      it 'creates a new book' do
        sign_in user
        create_book_params = { book: }

        post books_path, params: create_book_params

        expect(Book.count).to eq 1
      end
    end

    context 'when params aren\'t valid' do
      it 'returns to edit page with 422 status code' do
        sign_in user
        create_book_params = { book: {
          title: Faker::Book.title,
          release_date: Faker::Date.birthday
        } }

        post books_path, params: create_book_params

        expect(response).to have_http_status(422)
      end

      it 'do not creates a new book' do
        sign_in user
        create_book_params = { book: {
          title: Faker::Book.title,
          release_date: Faker::Date.birthday
        } }

        post books_path, params: create_book_params

        expect(Book.count).to eq 0
      end
    end
  end
end
