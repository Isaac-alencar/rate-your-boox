# frozen_string_literal: true

require 'rails_helper'

# UserModelSpec
RSpec.describe Comment, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:commentable) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_length_of(:body).is_at_most(120) }
  end
end
