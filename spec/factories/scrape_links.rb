# frozen_string_literal: true

FactoryBot.define do
  factory :scrape_link do
    scrape
    name { Faker::Lorem.word }
    url { Faker::Internet.url }
  end
end
