# frozen_string_literal: true

# BookGenre
class BookGenre < ApplicationRecord
  belongs_to :book
  belongs_to :genre

  validates :genre, uniqueness: { scope: :book }
end
