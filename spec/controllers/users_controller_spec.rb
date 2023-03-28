# frozen_string_literal: true

require 'rails_helper'

# UsersControllerSpec
RSpec.describe UsersController, type: 'request' do
  describe 'GET /users/:username' do
    context 'when the user is succesfully logged in' do
      let(:user) { create :user }

      it 'renders a successful response' do
        sign_in user
        get user_url user
        expect(response).to be_successful
        expect(response).to have_http_status(200)
      end
    end

    context 'when the user isn\'t logged in' do
      let(:user) { create :user }

      it 'redirects user with 302 status code' do
        get user_url user
        expect(response).to_not be_successful
        expect(response).to have_http_status(302)
      end
    end
  end

  describe 'PUT /users/:username' do
    context 'when params are valid' do
      let(:user) do
        create(:user, username: 'camaco', first_name: 'test_name')
      end

      update_user_params = { user: {
        first_name: 'updated_user_name',
        last_name: Faker::Name.last_name,
        bio: Faker::Quote.yoda,
        birthdate: Faker::Date.birthday
      } }

      it 'successfully peform the request' do
        sign_in user
        put "/users/#{user.id}", params: update_user_params

        expect(response).to redirect_to user_url
        expect(response).to have_http_status(302)
      end

      it 'update user\'s info' do
        sign_in user
        put "/users/#{user.id}", params: update_user_params
        user.reload

        expect(user.first_name).to eq 'updated_user_name'
      end
    end

    context 'when params aren\'t valid' do
      let(:user) { create :user, username: 'camaco' }

      it 'returns to edit page with 422 status code' do
        sign_in user
        update_user_params = { user: {
          id: user.id,
          username: nil
        } }

        put "/users/#{user.id}", params: update_user_params

        expect(response).to have_http_status(422)
      end

      it 'won\'t update any user info' do
        sign_in user
        update_user_params = { user: {
          id: user.id,
          username: nil
        } }

        put "/users/#{user.id}", params: update_user_params
        user.reload

        expect(user.username).to eq('camaco')
      end
    end

    context 'when params are valid but violates a constraint' do
      let(:user) { create :user, username: 'camaco' }
      it 'do not update any user atribute' do
        sign_in user
        update_user_params = { user: {
          id: user.id,
          username: Faker::Internet.username(specifier: 17)
        } }

        put "/users/#{user.id}", params: update_user_params
        user.reload

        expect(user.username).to eq('camaco')
      end
    end
  end
end
