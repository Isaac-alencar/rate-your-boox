# frozen_string_literal: true

require 'rails_helper'

# AuthorsControllerSpec
RSpec.describe AuthorsController, type: 'request' do
  let(:user) { create :user }
  let(:author) { build(:author).attributes }

  describe 'GET /authors/new' do
    context 'when the user is succesfully logged in' do
      it 'returns a successful response' do
        sign_in user
        get new_author_path
        expect(response).to be_successful
        expect(response).to have_http_status(200)
      end
    end

    context 'when the user isn\'t logged in' do
      it 'redirects user with 302 status code' do
        get new_author_path
        expect(response).to_not be_successful
        expect(response).to have_http_status(302)
      end
    end
  end

  describe 'POST /authors' do
    context 'when params are valid' do
      it 'successfully peform the request' do
        sign_in user
        create_author_params = { author: }

        post authors_path, params: create_author_params

        expect(response).to redirect_to new_book_path
        expect(response).to have_http_status(302)
      end

      it 'creates a new author' do
        sign_in user
        create_author_params = { author: }

        post authors_path, params: create_author_params

        expect(Author.count).to eq 1
      end
    end

    context 'when params aren\'t valid' do
      it 'returns to edit page with 422 status code' do
        sign_in user
        create_author_params = { author: {
          name: nil,
          birthdate: Faker::Date.birthday
        } }

        post authors_path, params: create_author_params

        expect(response).to have_http_status(422)
      end

      it 'do not creates a new author' do
        sign_in user
        create_author_params = { author: {
          name: nil,
          release_date: Faker::Date.birthday
        } }

        post authors_path, params: create_author_params

        expect(Book.count).to eq 0
      end
    end
  end
end
