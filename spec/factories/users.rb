# frozen_string_literal: true

# User Factory
FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    username { Faker::Internet.username(specifier: 3..15) }
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.first_name }
    birthdate  { Faker::Date.birthday }
    bio { Faker::Quote.yoda }
  end

  trait :without_email do
    email { nil }
  end

  trait :without_username do
    username { nil }
  end

  trait :invalid_username do
    username { Faker::Internet.username(specifier: 16) }
  end
end
