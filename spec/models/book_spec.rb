# frozen_string_literal: true

require 'rails_helper'

# UserModelSpec
RSpec.describe User, type: :model do
  subject { User.new(username: 'test_user_name') }

  describe 'Associations' do
    it { is_expected.to have_many(:comments) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_uniqueness_of(:username) }
    it { is_expected.to validate_length_of(:username).is_at_most(15) }
  end
end
