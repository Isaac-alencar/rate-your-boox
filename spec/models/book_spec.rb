# frozen_string_literal: true

require 'rails_helper'

# BookModelSpec
RSpec.describe Book, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:author) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:title) }
  end
end
