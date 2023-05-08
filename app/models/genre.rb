# frozen_string_literal: true

# Genre
class Genre < ApplicationRecord
  has_many :book_genres
  has_many :books, through: :book_genres

  has_many :primary, -> { where kind: 'primary' }, class_name: 'BookGenre'
  has_many :secondary, -> { where kind: 'secondary' }, class_name: 'BookGenre'
end
