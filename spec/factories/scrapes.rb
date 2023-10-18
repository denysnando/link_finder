# frozen_string_literal: true

FactoryBot.define do
  factory :scrape do
    user
    url { 'https://www.google.com.br' }
  end
end
