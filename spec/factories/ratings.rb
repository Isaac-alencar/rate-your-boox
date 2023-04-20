# frozen_string_literal: true

# Rating Factory
FactoryBot.define do
  factory :rating do
    score { Faker::Number.rand_in_range(1, 5) }
    user
    book
  end
end
