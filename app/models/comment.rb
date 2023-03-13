# frozen_string_literal: true

# Comment
class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
end
