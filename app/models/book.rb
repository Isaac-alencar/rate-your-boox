# frozen_string_literal: true

# Book
class Book < ApplicationRecord
  belongs_to :author
  has_many :rating
  has_many :comments, as: :commentable

  has_many :prequel, class_name: 'Book', foreign_key: 'sequence_id'
  belongs_to :sequel, class_name: 'Book', optional: true

  accepts_nested_attributes_for :author

  validates :title, presence: true
end
