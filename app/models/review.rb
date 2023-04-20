# frozen_string_literal: true

# Review
class Review < ApplicationRecord
  belongs_to :rating

  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true
end
