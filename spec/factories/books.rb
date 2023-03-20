# frozen_string_literal: true

# Book Factory
FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    release_date { Faker::Date.birthday }
    association :author
  end

  trait :ivalid_book do
    title { nil }
  end
end
