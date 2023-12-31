# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', require: false
gem 'importmap-rails'
gem 'jbuilder'
gem 'nokogiri', '~> 1.15', '>= 1.15.3'
gem 'open-uri'
gem 'sidekiq', '~> 7.1.6'
gem 'pg', '~> 1.3.4'
gem 'puma', '>= 5.0'
gem 'rails', '~> 7.1.1'
gem 'redis', '>= 4.0.1'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mswin mswin64 mingw x64_mingw jruby]
gem 'uri'
gem 'will_paginate', '~> 4.0'

group :development, :test do
  gem 'debug', platforms: %i[mri mswin mswin64 mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 6.0.0'
end

group :development do
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'solargraph'
end

group :test do
  gem 'database_cleaner'
  gem 'rspec-sidekiq'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'simplecov'
  gem 'vcr', '~> 6.1.0'
  gem 'webmock', '~> 3.9.1'
end
