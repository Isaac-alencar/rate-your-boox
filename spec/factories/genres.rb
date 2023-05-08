# frozen_string_literal: true

# Author Factory
FactoryBot.define do
  factory :genre do
    name { Faker::Book.unique.genre }
  end
end
