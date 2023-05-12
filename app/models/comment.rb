# frozen_string_literal: true

# Comment
class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  validates :body, presence: true, length: { minimum: 1, maximum: 120 }
end
