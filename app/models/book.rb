# frozen_string_literal: true

# Book
class Book < ApplicationRecord
  belongs_to :author
end
