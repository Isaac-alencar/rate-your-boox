# frozen_string_literal: true

# Book Factory
FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    synopsys { Faker::Lorem.paragraph }
    release_date { Faker::Date.birthday }
    author
  end

  trait :invalid_book do
    title { nil }
  end

  trait :with_sequel do
    title { 'Book with sequence' }
    sequence_id { Book.first.id }
  end
end
