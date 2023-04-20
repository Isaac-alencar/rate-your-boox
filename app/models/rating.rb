# frozen_string_literal: true

# Rating
class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :score, presence: true, numericality: true
end
