# frozen_string_literal: true

FactoryBot.define do
  factory :scrape do
    user
    name { Faker::Lorem.word }
    link { Faker::Internet.url }
  end
end
