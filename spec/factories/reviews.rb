# frozen_string_literal: true

# Review Factory
FactoryBot.define do
  factory :review do
    title { Faker::Book.title }
    description { Faker::Lorem.paragraph }
    attribuition { Faker::Internet.url }
    rating
  end
end
