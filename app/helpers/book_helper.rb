# frozen_string_literal: true

# BookHelper
module BookHelper
  def book_rating(rating)
    rating.empty? ? 'No rating available' : rating.average(:score).round(1)
  end
end
