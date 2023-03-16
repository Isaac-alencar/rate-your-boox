# frozen_string_literal: true

require 'rails_helper'

# AuthorModelSpec
RSpec.describe Author, type: :model do
  describe 'Associations' do
    it { is_expected.to have_many(:books) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
