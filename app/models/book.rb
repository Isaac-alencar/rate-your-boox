# frozen_string_literal: true

# Book
class Book < ApplicationRecord
  belongs_to :author

  has_many :book_genres
  has_many :primary_genres, -> { where kind: 'primary' }, class_name: 'BookGenre'
  has_many :secondary_genres, -> { where kind: 'secondary' }, class_name: 'BookGenre'

  has_many :rating
  has_many :comments, as: :commentable

  has_many :prequels, class_name: 'Book', foreign_key: 'sequence_id'
  belongs_to :sequence, class_name: 'Book', optional: true

  accepts_nested_attributes_for :author

  validates :title, presence: true
end
