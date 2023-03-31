# frozen_string_literal: true

# Book
class Book < ApplicationRecord
  belongs_to :author
  has_many :comments, as: :commentable

  accepts_nested_attributes_for :author

  validates :title, presence: true
end
