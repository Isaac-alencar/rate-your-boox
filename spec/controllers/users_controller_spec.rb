# frozen_string_literal: true

require 'rails_helper'

# UsersControllerSpec
RSpec.describe UsersController, type: 'request' do
  let(:user) { FactoryBot.create(:user, username: 'camaco', first_name: 'test_name') }

  describe 'GET /users/:username' do
    context 'when the user is succesfully logged in' do
      it 'renders a successful response' do
        sign_in user
        get user_url user
        expect(response).to be_successful
        expect(response).to have_http_status(200)
      end
    end

    context 'when the user isn\'t logged in' do
      it 'redirects user with 302 status code' do
        get user_url user
        expect(response).to_not be_successful
        expect(response).to have_http_status(302)
      end
    end
  end

  describe 'PUT /users/:username' do
    context 'when params are valid' do
      it 'updates user personal info' do
        sign_in user
        update_user_params = { user: {
          id: user.id,
          first_name: 'updated_user_name',
          last_name: Faker::Name.last_name,
          bio: Faker::Quote.yoda,
          birthdate: Faker::Date.birthday
        } }

        put "/users/#{user.id}", params: update_user_params

        expect(response).to redirect_to user_url
        expect(response).to have_http_status(302)
      end
    end

    context 'when params are valid' do
      it 'returns to edit page with 422 status code' do
        sign_in user
        update_user_params = { user: {
          id: user.id,
          username: nil
        } }

        put "/users/#{user.id}", params: update_user_params

        expect(response).to have_http_status(422)
      end
    end
  end
end
