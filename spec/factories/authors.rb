# frozen_string_literal: true

# Author Factory
FactoryBot.define do
  factory :author do
    name { Faker::Name.name }
    also_known_as { [Faker::Name.name] }
    birthdate { Faker::Date.birthday }
  end

  trait :invalid_author do
    name { nil }
  end
end
