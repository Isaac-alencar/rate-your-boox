# frozen_string_literal: true

# Author
class Author < ApplicationRecord
  has_many :books

  validates :name, presence: true
end
